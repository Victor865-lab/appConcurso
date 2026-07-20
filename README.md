# API Concursos

Sistema completo para gerenciamento de questões de concursos públicos: API REST em Node.js/Express com SQL Server, autenticação JWT e painel administrativo web responsivo.

## Sumário

- [Tecnologias](#tecnologias)
- [Estrutura do projeto](#estrutura-do-projeto)
- [Pré-requisitos](#pré-requisitos)
- [Configuração e execução](#configuração-e-execução)
- [Banco de dados](#banco-de-dados)
- [Autenticação](#autenticação)
- [Endpoints da API](#endpoints-da-api)
- [Regras de negócio](#regras-de-negócio)
- [Painel administrativo](#painel-administrativo)
- [Assinaturas premium (pagamentos e planos)](#assinaturas-premium-pagamentos-e-planos)
- [Documentação interativa (Swagger)](#documentação-interativa-swagger)
- [Coleção Postman](#coleção-postman)

---

## Tecnologias

**Backend:** Node.js, Express, SQL Server (`mssql`), bcrypt, jsonwebtoken, dotenv, cors, helmet, express-rate-limit, express-validator, swagger-jsdoc, swagger-ui-express, nodemon.

**Frontend:** HTML5, CSS3, JavaScript ES6, Bootstrap 5, Bootstrap Icons, Chart.js.

## Estrutura do projeto

```
api-concursos/
├── database/
│   ├── schema.sql                             # Script de criação do banco (instalação limpa)
│   ├── migration_painel_usuario.sql           # Migração aditiva (gamificação/temas/simulados)
│   ├── migration_comentarios_denuncias.sql    # Migração aditiva (comentários/denúncias de questão)
│   ├── migration_assinaturas.sql              # Migração aditiva (assinaturas)
│   └── migration_pagamentos_reembolsos.sql    # Migração aditiva (pagamentos/reembolsos)
├── public/                     # Painel administrativo (front-end estático)
│   ├── index.html              # Tela de login
│   ├── dashboard.html          # Painel (dashboard, questões, usuários)
│   ├── css/style.css
│   └── js/
│       ├── api.js              # Wrapper de comunicação com a API
│       ├── login.js
│       ├── app.js              # Navegação, tema, logout
│       ├── dashboard.js
│       ├── questoes.js
│       └── usuarios.js
├── public-usuario/             # Painel do usuário/estudante (front-end estático)
│   ├── index.html              # Tela de login
│   ├── painel.html             # Dashboard, mapeamento, simulados, ranking
│   ├── css/estilo.css
│   └── js/
│       ├── api.js
│       ├── login.js
│       ├── app.js
│       ├── dashboard.js
│       ├── mapeamento.js
│       ├── simulados.js
│       └── ranking.js
├── src/
│   ├── app.js                  # Configuração do Express (middlewares, rotas)
│   ├── swagger.js              # Definição OpenAPI
│   ├── config/database.js      # Pool de conexões SQL Server
│   ├── controllers/            # Regras de negócio por recurso
│   ├── models/                 # Acesso a dados (queries parametrizadas)
│   ├── routes/                 # Definição de rotas por recurso
│   ├── middlewares/            # auth, validators, errorHandler
│   └── services/
│       ├── jwtService.js
│       └── gamificacaoService.js   # Streak, nível e badges
├── server.js                   # Ponto de entrada
├── postman_collection.json
├── .env.example
└── package.json
```

## Pré-requisitos

- Node.js 18+
- Uma instância SQL Server acessível (local, on-premise ou Azure SQL)

## Configuração e execução

```bash
# 1. Instalar dependências
npm install

# 2. Copiar e preencher as variáveis de ambiente
cp .env.example .env
# edite .env com as credenciais do seu SQL Server

# 3. Executar o script de banco de dados no seu SQL Server
#    (via sqlcmd, Azure Data Studio ou SSMS)
sqlcmd -S <servidor> -U <usuario> -P <senha> -i database/schema.sql

# 4. Iniciar em modo desenvolvimento (reinício automático)
npm run dev

# ou em modo produção
npm start
```

A API sobe por padrão em `http://localhost:3000`.
O painel administrativo fica disponível em `http://localhost:3000/admin/index.html`.
O painel do usuário/estudante fica disponível em `http://localhost:3000/app/index.html`.
A documentação Swagger fica em `http://localhost:3000/docs`.

> **Importante:** não existe usuário padrão pré-cadastrado. Cadastre o primeiro usuário via `POST /usuarios` (endpoint público) ou pelo link "Solicitar acesso" na tela de login do painel.

## Banco de dados

Três tabelas principais, criadas por `database/schema.sql`:

- **usuarios** — `id, nome (único), senhaHash, criadoEm, atualizadoEm`
- **questoes** — `id, referencia, descricao, respondida, ativo, criadoEm, atualizadoEm`
- **alternativas** — `id, idQuestao (FK ON DELETE CASCADE), letra (A–E), descricaoAlt, correta`

Uma trigger (`TRG_alternativas_unica_correta`) reforça no nível do banco que cada questão tenha no máximo uma alternativa marcada como correta, além da validação já feita na camada de aplicação.

## Autenticação

JWT via cabeçalho `Authorization: Bearer <token>`. Fluxo:

1. `POST /usuarios` — cadastra um usuário (rota pública).
2. `POST /auth/login` — retorna `{ token, usuario }`.
3. Use o token nas demais rotas protegidas.
4. `PUT /auth/senha` — troca de senha do usuário autenticado.
5. `POST /auth/logout` — encerra a sessão (modelo stateless: apenas orienta o cliente a descartar o token).

Senhas são armazenadas com hash `bcrypt` (nunca em texto puro).

## Endpoints da API

Todas as respostas seguem o formato:
```json
{ "sucesso": true, "mensagem": "...", "dados": { } }
```

### Autenticação
| Método | Rota | Descrição | Auth |
|---|---|---|---|
| POST | `/auth/login` | Login | Não |
| POST | `/auth/logout` | Logout | Sim |
| PUT | `/auth/senha` | Troca de senha | Sim |

### Usuários
| Método | Rota | Descrição | Auth |
|---|---|---|---|
| POST | `/usuarios` | Cadastrar usuário | Não |
| GET | `/usuarios` | Listar usuários | Sim |
| GET | `/usuarios/:id` | Buscar por ID | Sim |
| PUT | `/usuarios/:id` | Editar nome | Sim |
| DELETE | `/usuarios/:id` | Excluir | Sim |

### Questões
| Método | Rota | Descrição | Auth |
|---|---|---|---|
| GET | `/questoes/dashboard` | Estatísticas agregadas | Sim |
| GET | `/questoes` | Listar (filtros/paginação/ordenação) | Sim |
| GET | `/questoes/:id` | Buscar por ID (com alternativas) | Sim |
| POST | `/questoes` | Cadastrar questão + alternativas (transação) | Sim |
| PUT | `/questoes/:id` | Atualizar questão + alternativas (transação) | Sim |
| DELETE | `/questoes/:id` | Excluir (alternativas em cascata) | Sim |
| PATCH | `/questoes/:id/ativar` | Ativar | Sim |
| PATCH | `/questoes/:id/desativar` | Desativar | Sim |
| PATCH | `/questoes/:id/marcar-respondida` | Marcar como respondida | Sim |
| PATCH | `/questoes/:id/desmarcar-respondida` | Desmarcar | Sim |

Filtros de listagem (`GET /questoes`, todos opcionais via query string):
`pagina`, `limite`, `ativo` (true/false), `respondida` (true/false), `referencia` (busca parcial), `palavraChave` (busca em descrição e referência), `ordenarPor` (`id`|`referencia`|`criadoEm`), `direcao` (`asc`|`desc`).

### Alternativas
| Método | Rota | Descrição | Auth |
|---|---|---|---|
| POST | `/alternativas` | Cadastrar alternativa avulsa | Sim |
| GET | `/alternativas/questao/:idQuestao` | Listar por questão | Sim |
| GET | `/alternativas/:id` | Buscar por ID | Sim |
| PUT | `/alternativas/:id` | Editar | Sim |
| DELETE | `/alternativas/:id` | Excluir | Sim |

### Exemplo — cadastro de questão com alternativas
```http
POST /questoes
Authorization: Bearer <token>
Content-Type: application/json

{
  "referencia": "CESPE 2024",
  "descricao": "Pergunta de exemplo",
  "ativo": true,
  "alternativas": [
    { "letra": "A", "descricaoAlt": "Alternativa A", "correta": false },
    { "letra": "B", "descricaoAlt": "Alternativa B", "correta": true }
  ]
}
```
A questão e todas as alternativas são inseridas em uma única transação SQL. Qualquer falha resulta em rollback completo — nenhuma alteração parcial é salva.

## Regras de negócio

- Uma questão deve ter **exatamente uma** alternativa correta.
- Uma questão não pode ser cadastrada sem alternativas.
- A descrição da questão é obrigatória; a referência é opcional.
- Letras de alternativa restritas a A, B, C, D, E, sem repetição na mesma questão.
- Senha de usuário: mínimo 8 caracteres.
- Nome de usuário: obrigatório e único.
- Exclusão de questão remove as alternativas em cascata (`ON DELETE CASCADE`).
- Não é possível excluir a última alternativa restante de uma questão via `/alternativas/:id` (use a exclusão da questão inteira nesse caso).

## Painel administrativo

Acesse `http://localhost:3000/admin/index.html`. Funcionalidades:

- **Login** com exibir/ocultar senha e cadastro rápido de acesso.
- **Dashboard** com contadores (total, ativas, respondidas, pendentes, usuários) e gráfico de barras.
- **Questões**: tabela com busca em tempo real, filtros (ativo/respondida), paginação, modal de cadastro/edição com alternativas dinâmicas (adicionar/remover, seleção única de "correta"), ações rápidas de ativar/desativar/marcar-respondida e confirmação de exclusão.
- **Usuários**: listagem, busca, cadastro e edição de nome, exclusão com confirmação.
- **Tema claro/escuro** persistido localmente.
- Layout responsivo (menu lateral colapsável em telas menores), toasts de sucesso/erro, e tratamento de sessão expirada (redireciona ao login em respostas 401).

Se preferir hospedar o painel separadamente da API, ajuste `resolverBaseUrl()` em `public/js/api.js` para apontar para o endereço correto da API.

## Painel do usuário (gamificação, mapeamento, simulados, ranking)

Além do painel administrativo, o projeto agora inclui um **painel do usuário/estudante**, servido separadamente em:

```
http://localhost:3000/app/index.html
```

Ele reaproveita a mesma API, banco de dados e login (tabela `usuarios`) do painel admin, mas com um front-end e endpoints próprios focados em quem está estudando.

### O que rodar antes de usar

Se você já tinha o banco `ConcursosDB` criado a partir de uma versão anterior deste projeto, rode a migração aditiva (não apaga nada existente):

```bash
sqlcmd -S <servidor> -U <usuario> -P <senha> -i database/migration_painel_usuario.sql
```

Se estiver instalando do zero, o `database/schema.sql` já inclui todas as tabelas novas.

### Novas tabelas

- **temas** — categorias usadas para classificar questões (ex: "Direito Constitucional")
- **respostas_usuario** — histórico de cada resposta dada (avulsa ou em simulado); é a fonte única de verdade para pontos, progresso e ranking
- **acessos_usuario** — um registro por dia em que o usuário entrou no site (base do calendário de sequência/streak)
- **simulados** / **simulado_questoes** — simulados gerados e o snapshot das questões sorteadas
- Colunas novas em **questoes**: `idTema`, `banca`, `ano`, `dificuldade` (facil/medio/dificil)
- Colunas novas em **usuarios**: `streakAtual`, `streakRecorde`, `ultimoAcesso`

### Gamificação

- **Pontos**: 10 por resposta correta, sempre calculados a partir de `respostas_usuario` (nunca duplicados em outra coluna).
- **Nível**: 100 pontos por nível, com nomes temáticos (Aspirante → Lenda dos Concursos).
- **Streak (sequência)**: registrado automaticamente a cada login. Se o último acesso foi ontem, a sequência aumenta; se pulou um dia ou mais, reinicia.
- **Badges/conquistas**: calculadas dinamicamente (sem tabela própria) a partir de total de respostas, acertos, sequência recorde e pontos — ex: "Primeiro Passo", "Maratonista", "Disciplina" (streak de 7 dias).
- **Calendário de acessos**: heatmap estilo "contribuições", mostrando a intensidade de uso por dia nos últimos 6 meses.

### Novos endpoints da API

| Método | Rota | Descrição | Auth |
|---|---|---|---|
| GET/POST/DELETE | `/temas` | CRUD de temas | Sim |
| GET | `/questoes/filtros` | Bancas/anos/dificuldades disponíveis (para popular filtros) | Sim |
| POST | `/respostas` | Responder uma questão avulsa (fora de simulado) | Sim |
| GET | `/respostas/status?ids=1,2,3` | Status de respostas do usuário para um lote de questões | Sim |
| GET | `/progresso/resumo` | Pontos, nível, streak, taxa de acerto e badges | Sim |
| GET | `/progresso/evolucao?dias=30` | Série diária de respondidas/acertos (gráfico) | Sim |
| GET | `/progresso/calendario?dias=365` | Acessos por dia (heatmap de streak) | Sim |
| GET | `/progresso/mapa-tema` | Desempenho agregado por tema | Sim |
| POST | `/simulados` | Gera um simulado (`idTema`, `banca`, `dificuldade`, `quantidade`) | Sim |
| GET | `/simulados` | Histórico de simulados do usuário | Sim |
| GET | `/simulados/:id` | Detalhes/questões de um simulado | Sim |
| POST | `/simulados/:id/finalizar` | Envia respostas e recebe a correção detalhada | Sim |
| GET | `/ranking?periodo=geral\|semanal\|mensal` | Leaderboard de pontuação + posição do usuário atual | Sim |

`GET /questoes` também aceita agora os filtros `idTema`, `banca`, `ano` e `dificuldade`, usados na aba de Mapeamento.

### As 4 abas do painel do usuário

1. **Dashboard** — cartões de pontos/streak/taxa de acerto, gráfico de evolução (Chart.js), calendário de sequência e grid de conquistas.
2. **Mapeamento** — navega o banco de questões filtrando por tema, banca, ano e dificuldade; cada card mostra se você já acertou aquela questão; clique para responder na hora.
3. **Simulados** — escolha tema/banca/dificuldade/quantidade, o site sorteia as questões (via `NEWID()` no SQL Server), você responde tudo e recebe o gabarito comentado ao final. Simulados incompletos ficam com status "em andamento" e podem ser retomados.
4. **Ranking** — placar geral, mensal ou semanal, com a posição do usuário atual sempre destacada mesmo fora do top 50.

## Assinaturas premium (pagamentos e planos)

O acesso ao painel do usuário (`/progresso`, `/simulados`, `/ranking`, `/respostas`) pode ser condicionado a uma assinatura paga, via **Mercado Pago**.

### Rodando as migrações

```bash
sqlcmd -S <servidor> -U <usuario> -P <senha> -i database/migration_assinaturas.sql
sqlcmd -S <servidor> -U <usuario> -P <senha> -i database/migration_pagamentos_reembolsos.sql
```
(instalação limpa: `database/schema.sql` já inclui tudo)

### Planos

| Plano | Valor | Periodicidade |
|---|---|---|
| Mensal | R$ 19,90 | 1 mês |
| Trimestral | R$ 49,90 | 3 meses |
| Semestral | R$ 99,00 | 6 meses |
| Anual | R$ 179,00 | 12 meses |

Definidos em `src/config/planos.js` (fonte única da verdade — preço e periodicidade usados tanto para exibir os planos quanto para criar a cobrança no Mercado Pago).

### Cartão x Pix — limitação importante do gateway

O Mercado Pago só oferece **débito automático recorrente** (Preapproval) para **cartão de crédito**. O Pix não tem mecanismo de "credencial salva" — por isso:

- **Cartão**: assinatura recorrente de verdade. O Mercado Pago cobra sozinho a cada ciclo e notifica via webhook (`type=payment`); o período de acesso (`assinaturas.dataFim`) é estendido automaticamente a cada cobrança aprovada.
- **Pix**: cobrança avulsa a cada ciclo — **não é auto-débito**. Um job (`src/services/renovacaoPixService.js`, agendado em `server.js` a cada 24h) gera uma nova cobrança Pix pouco antes do período atual vencer; o usuário precisa pagar manualmente (vai receber/ver o QR code ao acessar a aba de assinatura).

### Novas tabelas

- **assinaturas** — `idUsuario, plano, valor, emailPagador, metodoPagamento (cartao|pix), idPreapprovalMP, status (pendente|autorizada|pausada|cancelada|reembolsada), dataInicio, dataFim, criadoEm`
- **pagamentos** — cada cobrança individual (avulsa ou gerada pela recorrência): `idAssinatura, idTransacaoGateway (único, garante idempotência), metodo (pix|cartao_credito|cartao_debito), valor, status (aprovado|pendente|rejeitado|estornado), dataPagamento`
- **reembolsos** — `idPagamento, dataReembolso, motivo, comprovanteJson` (resposta bruta do Mercado Pago, guardada como comprovante — o Mercado Pago não emite uma URL de recibo em PDF)

### Novos endpoints

| Método | Rota | Descrição | Auth |
|---|---|---|---|
| GET | `/assinaturas/planos` | Lista os 4 planos disponíveis | Sim |
| POST | `/assinaturas` | Cria uma assinatura (`plano`, `emailPagador`, `metodoPagamento: cartao\|pix`) | Sim |
| GET | `/assinaturas/atual` | Assinatura mais recente do usuário (sincroniza com o Mercado Pago se ainda pendente) | Sim |
| POST | `/assinaturas/:id/reembolsar` | Reembolso por direito de arrependimento (CDC art. 49) — só até 7 dias corridos da contratação | Sim |
| POST | `/webhooks/pagamento` | Notificação do Mercado Pago (assinatura de cartão ou pagamento) | **Não** (público, validado por assinatura HMAC) |

`POST /assinaturas` com `metodoPagamento: "cartao"` devolve `{ initPoint }` — redirecione o navegador para lá. Com `"pix"`, devolve `{ pix: { qrCode, qrCodeBase64 } }` — exiba o QR code direto na tela (sem redirecionamento).

### Configurando o webhook no painel do Mercado Pago

1. Acesse [developers.mercadopago.com](https://www.mercadopago.com.br/developers/panel) → sua aplicação → **Webhooks** → **Configurar notificações**.
2. URL da notificação: `https://<seu-dominio-publico>/webhooks/pagamento` (precisa ser HTTPS público — não funciona com `http://localhost`; use algo como ngrok para testar localmente).
3. Eventos: marque **Pagamentos** (`payment`) e **Assinaturas** (`subscription_preapproval`).
4. Copie o **"Segredo" (Secret)** gerado nessa tela e cole em `MERCADOPAGO_WEBHOOK_SECRET` no `.env`.

Sem `MERCADOPAGO_WEBHOOK_SECRET` configurado, o webhook processa as notificações mesmo assim (para não travar o ambiente de teste), mas registra um aviso no console porque a autenticidade não pôde ser verificada. Em produção, configure o segredo — sem ele, qualquer requisição forjada para `/webhooks/pagamento` seria aceita.

Como o Mercado Pago não alcança `http://localhost`, `GET /assinaturas/atual` também consulta o status diretamente na API do Mercado Pago quando a assinatura está "pendente" — suficiente para testar o fluxo completo em ambiente local, mesmo sem o webhook.

### Reembolso (direito de arrependimento — CDC art. 49)

`POST /assinaturas/:id/reembolsar` (autenticado, o usuário só reembolsa a própria assinatura):
1. Verifica se ainda está dentro de 7 dias corridos de `assinaturas.criadoEm`.
2. Estorna o pagamento mais recente aprovado direto no Mercado Pago (`POST /v1/payments/:id/refunds`).
3. Grava o comprovante (resposta bruta do gateway) em `reembolsos`.
4. Marca a assinatura como `reembolsada` e zera `dataFim` — revogando o acesso imediatamente.

### Trava de acesso (liga/desliga)

O middleware `src/middlewares/verificarAssinatura.js` bloqueia `/progresso`, `/simulados`, `/ranking` e `/respostas` para quem não tem assinatura com status `autorizada` e `dataFim` no futuro. Controlado por uma única variável de ambiente:

```
EXIGIR_ASSINATURA=true   # bloqueia rotas sem assinatura ativa
EXIGIR_ASSINATURA=false  # (padrão) libera tudo — use em ambiente de teste
```

### Segurança

- Nenhum dado de cartão passa pelo servidor — o cartão é sempre informado direto na página de checkout do Mercado Pago (tokenização do lado deles).
- Chaves e segredos (`MERCADOPAGO_ACCESS_TOKEN`, `MERCADOPAGO_WEBHOOK_SECRET`) só existem em variáveis de ambiente, nunca hardcoded.
- Toda operação que grava em mais de uma tabela (registrar pagamento + estender período da assinatura; registrar reembolso + estornar pagamento + revogar assinatura) roda em uma transação SQL Server (`sql.Transaction`), com rollback completo em caso de falha.

## Documentação interativa (Swagger)

Disponível em `http://localhost:3000/docs` assim que o servidor estiver rodando, com os principais endpoints, schemas e exemplos de requisição.

## Coleção Postman

Importe `postman_collection.json` no Postman. A variável de coleção `{{token}}` deve ser preenchida manualmente após o login (copie o token retornado por `POST /auth/login`), ou configure um script de teste no Postman para preenchê-la automaticamente.
