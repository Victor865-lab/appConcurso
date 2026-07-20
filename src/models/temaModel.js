/**
 * Model de Tema.
 * Usado para classificar questões (mapeamento por tema) e
 * como critério de filtro para geração de simulados.
 */

const { sql, getPool } = require('../config/database');

async function criar(nome) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('nome', sql.NVarChar(120), nome)
    .query(`
      INSERT INTO temas (nome)
      OUTPUT INSERTED.id, INSERTED.nome
      VALUES (@nome);
    `);
  return result.recordset[0];
}

async function listarTodos() {
  const pool = await getPool();
  const result = await pool.request().query(`
    SELECT t.id, t.nome,
           (SELECT COUNT(*) FROM questoes q WHERE q.idTema = t.id) AS totalQuestoes
    FROM temas t
    ORDER BY t.nome ASC;
  `);
  return result.recordset;
}

async function buscarPorNome(nome) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('nome', sql.NVarChar(120), nome)
    .query(`SELECT id, nome FROM temas WHERE nome = @nome;`);
  return result.recordset[0] || null;
}

async function buscarPorId(id) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .query(`SELECT id, nome FROM temas WHERE id = @id;`);
  return result.recordset[0] || null;
}

async function excluir(id) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .query(`DELETE FROM temas WHERE id = @id;`);
  return result.rowsAffected[0] > 0;
}

module.exports = { criar, listarTodos, buscarPorNome, buscarPorId, excluir };
