/**
 * Model de Usuário.
 * Responsável exclusivamente pelo acesso a dados (queries parametrizadas).
 * Nenhuma regra de negócio deve residir aqui.
 */

const { sql, getPool } = require('../config/database');

async function criar({ nome, senhaHash }) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('nome', sql.NVarChar(150), nome)
    .input('senhaHash', sql.NVarChar(255), senhaHash)
    .query(`
      INSERT INTO usuarios (nome, senhaHash)
      OUTPUT INSERTED.id, INSERTED.nome, INSERTED.criadoEm
      VALUES (@nome, @senhaHash);
    `);
  return result.recordset[0];
}

async function listarTodos() {
  const pool = await getPool();
  const result = await pool.request().query(`
    SELECT id, nome, role, criadoEm, atualizadoEm, ultimaAtividade,
      CASE WHEN ultimaAtividade >= DATEADD(MINUTE, -5, SYSUTCDATETIME()) THEN 1 ELSE 0 END AS online
    FROM usuarios
    ORDER BY nome ASC;
  `);
  return result.recordset;
}

async function buscarPorId(id) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .query(`
      SELECT id, nome, role, criadoEm, atualizadoEm
      FROM usuarios
      WHERE id = @id;
    `);
  return result.recordset[0] || null;
}

async function buscarPorNome(nome) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('nome', sql.NVarChar(150), nome)
    .query(`
      SELECT id, nome, senhaHash, role, criadoEm
      FROM usuarios
      WHERE nome = @nome;
    `);
  return result.recordset[0] || null;
}

async function atualizar(id, { nome }) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .input('nome', sql.NVarChar(150), nome)
    .query(`
      UPDATE usuarios
      SET nome = @nome, atualizadoEm = SYSUTCDATETIME()
      OUTPUT INSERTED.id, INSERTED.nome, INSERTED.atualizadoEm
      WHERE id = @id;
    `);
  return result.recordset[0] || null;
}

async function atualizarSenha(id, senhaHash) {
  const pool = await getPool();
  await pool
    .request()
    .input('id', sql.Int, id)
    .input('senhaHash', sql.NVarChar(255), senhaHash)
    .query(`
      UPDATE usuarios
      SET senhaHash = @senhaHash, atualizadoEm = SYSUTCDATETIME()
      WHERE id = @id;
    `);
  return true;
}

async function registrarAtividade(id) {
  const pool = await getPool();
  await pool
    .request()
    .input('id', sql.Int, id)
    .query(`UPDATE usuarios SET ultimaAtividade = SYSUTCDATETIME() WHERE id = @id;`);
}

async function excluir(id) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .query(`DELETE FROM usuarios WHERE id = @id;`);
  return result.rowsAffected[0] > 0;
}

module.exports = {
  criar,
  listarTodos,
  buscarPorId,
  buscarPorNome,
  atualizar,
  atualizarSenha,
  registrarAtividade,
  excluir,
};
