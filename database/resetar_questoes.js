/**
 * Reseta completamente as questões do banco e reinsere todo o conteúdo
 * a partir dos arquivos database/insert_questoes_*.sql — sempre via
 * driver Node (nunca sqlcmd, que corrompe acentuação UTF-8 em arquivos
 * grandes, causando o problema de bancas/temas sumindo ou aparecendo
 * errados).
 *
 * Uso:
 *   node database/resetar_questoes.js
 *
 * Rodar sempre a partir da raiz do projeto (precisa do .env carregado
 * pelo src/config/database.js).
 */

const fs = require('fs');
const path = require('path');
const { getPool } = require('../src/config/database');

const DIR = __dirname;

const ARQUIVO_LIMPEZA = 'limpar_questoes.sql';

// Ordem de inserção — não é estritamente necessária (cada arquivo cria
// seus próprios temas de forma idempotente), mas mantém os logs em uma
// ordem cronológica/temática legível.
const ARQUIVOS_INSERT = [
  'insert_questoes_fotografo_provas_publicas.sql',
  'insert_questoes_tecnicas_audiovisuais_vunesp.sql',
  'insert_questoes_simulados_pericial.sql',
  'insert_questoes_novas_provas_2026.sql',
];

async function rodarArquivo(pool, nomeArquivo) {
  const caminho = path.join(DIR, nomeArquivo);
  const conteudo = fs.readFileSync(caminho, 'utf8');
  const lotes = conteudo.split(/\r?\n[ \t]*GO[ \t]*\r?\n/).map((s) => s.trim()).filter(Boolean);

  for (const lote of lotes) {
    await pool.request().batch(lote);
  }
}

async function main() {
  const pool = await getPool();

  console.log('== 1/2: Limpando questões e dados dependentes ==');
  await rodarArquivo(pool, ARQUIVO_LIMPEZA);
  console.log('Limpeza concluída.\n');

  console.log('== 2/2: Reinserindo questões ==');
  for (const arquivo of ARQUIVOS_INSERT) {
    process.stdout.write(`  - ${arquivo} ... `);
    await rodarArquivo(pool, arquivo);
    console.log('OK');
  }

  console.log('\n== Verificação ==');
  const total = await pool.request().query('SELECT COUNT(*) AS total FROM questoes;');
  console.log('Total de questões:', total.recordset[0].total);

  const porBanca = await pool.request().query(`
    SELECT ISNULL(banca, '(sem banca)') AS banca, COUNT(*) AS quantidade
    FROM questoes
    GROUP BY banca
    ORDER BY quantidade DESC;
  `);
  console.log('\nPor banca:');
  for (const r of porBanca.recordset) console.log(`  ${r.banca}: ${r.quantidade}`);

  // 4 ou 5 alternativas são ambas legítimas (várias bancas reais usam
  // só A-D) — só é bug de verdade ter menos de 4, mais de 5, ou não ter
  // exatamente uma alternativa marcada como correta.
  const semAlternativas = await pool.request().query(`
    SELECT COUNT(*) AS total FROM questoes q
    WHERE (SELECT COUNT(*) FROM alternativas a WHERE a.idQuestao = q.id) NOT IN (4, 5)
       OR (SELECT COUNT(*) FROM alternativas a WHERE a.idQuestao = q.id AND a.correta = 1) <> 1;
  `);
  console.log('\nQuestões com problema estrutural de alternativas (deveria ser 0):', semAlternativas.recordset[0].total);

  console.log('\nConcluído com sucesso.');
  process.exit(0);
}

main().catch((err) => {
  console.error('\nERRO:', err.message);
  process.exit(1);
});
