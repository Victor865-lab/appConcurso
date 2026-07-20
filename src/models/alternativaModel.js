/**
 * Model de Alternativa.
 * Permite operações unitárias sobre alternativas,
 * além das operações em lote feitas via questaoModel.
 */

const { sql, getPool } = require('../config/database');

async function criar({ idQuestao, letra, descricaoAlt, correta }) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idQuestao', sql.Int, idQuestao)
    .input('letra', sql.Char(1), letra)
    .input('descricaoAlt', sql.NVarChar(sql.MAX), descricaoAlt)
    .input('correta', sql.Bit, correta)
    .query(`
      INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
      OUTPUT INSERTED.*
      VALUES (@idQuestao, @letra, @descricaoAlt, @correta);
    `);
  return result.recordset[0];
}

async function listarPorQuestao(idQuestao) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idQuestao', sql.Int, idQuestao)
    .query(`
      SELECT id, idQuestao, letra, descricaoAlt, correta
      FROM alternativas
      WHERE idQuestao = @idQuestao
      ORDER BY letra ASC;
    `);
  return result.recordset;
}

async function buscarPorId(id) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .query(`SELECT * FROM alternativas WHERE id = @id;`);
  return result.recordset[0] || null;
}

async function existeCorretaNaQuestao(idQuestao, ignorarId = null) {
  const pool = await getPool();
  const request = pool.request().input('idQuestao', sql.Int, idQuestao);
  let query = `SELECT COUNT(*) AS total FROM alternativas WHERE idQuestao = @idQuestao AND correta = 1`;
  if (ignorarId) {
    request.input('ignorarId', sql.Int, ignorarId);
    query += ` AND id <> @ignorarId`;
  }
  const result = await request.query(query);
  return result.recordset[0].total > 0;
}

async function atualizar(id, { letra, descricaoAlt, correta }) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .input('letra', sql.Char(1), letra)
    .input('descricaoAlt', sql.NVarChar(sql.MAX), descricaoAlt)
    .input('correta', sql.Bit, correta)
    .query(`
      UPDATE alternativas
      SET letra = COALESCE(@letra, letra),
          descricaoAlt = COALESCE(@descricaoAlt, descricaoAlt),
          correta = COALESCE(@correta, correta)
      OUTPUT INSERTED.*
      WHERE id = @id;
    `);
  return result.recordset[0] || null;
}

async function excluir(id) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .query(`DELETE FROM alternativas WHERE id = @id;`);
  return result.rowsAffected[0] > 0;
}

module.exports = {
  criar,
  listarPorQuestao,
  buscarPorId,
  existeCorretaNaQuestao,
  atualizar,
  excluir,
};
