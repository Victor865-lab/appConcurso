# Deploy no VPS

Passo a passo para subir a API Concursos do zero num VPS (Ubuntu/Debian).

## 1. Dependências no VPS

```bash
# Node.js (LTS) e PM2
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
sudo npm install -g pm2

# nginx
sudo apt install -y nginx

# SQL Server (ou use um serviço gerenciado — Azure SQL, RDS etc.
# costuma ser mais simples que rodar o SQL Server dentro do próprio VPS)
```

## 2. Banco de dados

Rode **nesta ordem** contra o banco de produção (vazio):

```bash
sqlcmd -S <servidor> -U <usuario> -P <senha> -i database/schema.sql
```

O `schema.sql` já está consolidado com todas as migrations até
`migration_seguranca_rbac.sql` e `migration_atividade_usuario.sql` — não
precisa rodar os `migration_*.sql` separadamente numa instalação nova
(eles servem só para atualizar um banco que já está em produção).

⚠️ **Não use `sqlcmd` para os arquivos `insert_questoes_*.sql`** — ele
corrompe acentuação UTF-8 nesses arquivos maiores. Rode-os assim, de
dentro do projeto, apontando pro banco de produção via `.env`:

```js
// scripts/rodar_sql.js (crie esse arquivo se for reusar)
const fs = require('fs');
const { getPool } = require('../src/config/database');
(async () => {
  const pool = await getPool();
  const sqlText = fs.readFileSync(process.argv[2], 'utf8');
  const lotes = sqlText.split(/\r?\n[ \t]*GO[ \t]*\r?\n/).map(s => s.trim()).filter(Boolean);
  for (const lote of lotes) await pool.request().batch(lote);
  console.log('OK:', process.argv[2]);
  process.exit(0);
})();
```

```bash
node scripts/rodar_sql.js database/insert_questoes_fotografo_provas_publicas.sql
node scripts/rodar_sql.js database/insert_questoes_tecnicas_audiovisuais_vunesp.sql
node scripts/rodar_sql.js database/insert_questoes_simulados_pericial.sql
node scripts/rodar_sql.js database/insert_questoes_novas_provas_2026.sql
```

Depois de rodar, promova sua conta de admin (troque `'seu_usuario'`):

```sql
UPDATE dbo.usuarios SET role = 'admin' WHERE nome = 'seu_usuario';
```

(a conta só existirá depois que você criar seu usuário pela tela de
cadastro do `/app` uma vez com o app já no ar)

## 3. Clonar o projeto e configurar o `.env`

```bash
git clone <seu-repo> /var/www/api-concursos
cd /var/www/api-concursos
npm ci --omit=dev
cp .env.example .env
nano .env
```

Preencha, no mínimo:

| Variável | Valor em produção |
|---|---|
| `NODE_ENV` | `production` |
| `PORT` | `3000` |
| `TRUST_PROXY` | `true` (nginx na frente) |
| `CORS_ORIGENS` | `https://SEU_DOMINIO.com.br` |
| `APP_BASE_URL` | `https://SEU_DOMINIO.com.br` |
| `DB_SERVER`, `DB_USER`, `DB_PASSWORD`, `DB_DATABASE` | do banco de produção |
| `DB_ENCRYPT` | `true` se o banco não estiver na mesma máquina |
| `JWT_SECRET` | gere um novo — **não reuse o de dev**: `node -e "console.log(require('crypto').randomBytes(64).toString('hex'))"` |
| `MERCADOPAGO_ACCESS_TOKEN` | o de **produção** (não o `TEST-...`) |
| `MERCADOPAGO_WEBHOOK_SECRET` | pegue em developers.mercadopago.com → Webhooks |

## 4. Subir com PM2

```bash
mkdir -p logs
pm2 start ecosystem.config.js --env production
pm2 save
pm2 startup   # segue as instruções impressas para o PM2 sobreviver a reboot
```

Comandos úteis depois:

```bash
pm2 logs api-concursos     # ver logs em tempo real
pm2 restart api-concursos  # aplicar mudanças de código/.env
pm2 status
```

## 5. nginx + HTTPS

```bash
sudo cp deploy/nginx.conf /etc/nginx/sites-available/api-concursos
sudo nano /etc/nginx/sites-available/api-concursos   # trocar SEU_DOMINIO.com.br
sudo ln -s /etc/nginx/sites-available/api-concursos /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx

sudo apt install -y certbot python3-certbot-nginx
sudo certbot --nginx -d SEU_DOMINIO.com.br -d www.SEU_DOMINIO.com.br
```

O certbot cuida de emitir o certificado, reescrever o `nginx.conf` com o
bloco HTTPS e agendar a renovação automática.

## 6. Checklist final

- [ ] `https://SEU_DOMINIO.com.br/` responde (rota raiz da API)
- [ ] `https://SEU_DOMINIO.com.br/app` carrega o painel do aluno
- [ ] `https://SEU_DOMINIO.com.br/admin` carrega o painel administrativo
- [ ] Login funciona e sua conta está com `role = 'admin'`
- [ ] Um pagamento Pix de teste completa o fluxo (webhook chega — teste
      com o Access Token de produção mesmo, valores baixos)
- [ ] `pm2 status` mostra o processo `online`
- [ ] `pm2 startup` configurado (sobrevive a reboot do VPS)
