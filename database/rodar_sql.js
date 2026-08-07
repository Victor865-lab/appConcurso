/**
 * Executa um arquivo .sql qualquer da pasta database/ contra o banco
 * configurado no .env — sempre via driver Node (nunca sqlcmd, que
 * corrompe acentuação UTF-8 em arquivos grandes).
 *
 * Uso (a partir da raiz do projeto):
 *   node database/rodar_sql.js migration_email_usuario.sql
 *   node database/rodar_sql.js insert_questoes_novas_provas_2026.sql
 *
 * Aceita tanto o nome do arquivo (procurado dentro de database/) quanto
 * um caminho relativo/absoluto próprio.
 */

const fs = require('fs');
const path = require('path');
const { getPool } = require('../src/config/database');

async function main() {
  const alvo = process.argv[2];
  if (!alvo) {
    console.error('Uso: node database/rodar_sql.js <arquivo.sql>');
    process.exit(1);
  }

  const caminho = fs.existsSync(alvo) ? alvo : path.join(__dirname, alvo);
  if (!fs.existsSync(caminho)) {
    console.error('Arquivo não encontrado:', alvo);
    process.exit(1);
  }

  const conteudo = fs.readFileSync(caminho, 'utf8');
  const lotes = conteudo.split(/\r?\n[ \t]*GO[ \t]*\r?\n/).map((s) => s.trim()).filter(Boolean);

  const pool = await getPool();
  for (const lote of lotes) {
    await pool.request().batch(lote);
  }

  console.log('OK:', caminho);
  process.exit(0);
}

main().catch((err) => {
  console.error('ERRO:', err.message);
  process.exit(1);
});
