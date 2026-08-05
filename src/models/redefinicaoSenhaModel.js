/**
 * Model de Redefinição de Senha.
 * Responsável exclusivamente pelo acesso a dados dos tokens de
 * redefinição (uso único, com expiração).
 */

const { sql, getPool } = require('../config/database');

async function criar({ idUsuario, token, expiraEm }) {
  const pool = await getPool();
  await pool
    .request()
    .input('idUsuario', sql.Int, idUsuario)
    .input('token', sql.NVarChar(255), token)
    .input('expiraEm', sql.DateTime2, expiraEm)
    .query(`
      INSERT INTO redefinicoes_senha (idUsuario, token, expiraEm)
      VALUES (@idUsuario, @token, @expiraEm);
    `);
}

/**
 * Retorna o token junto com o usuário associado, apenas se ainda for
 * válido (não expirado e não usado). Usado para validar o clique no
 * link de redefinição.
 */
async function buscarTokenValido(token) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('token', sql.NVarChar(255), token)
    .query(`
      SELECT r.id, r.idUsuario, r.expiraEm, r.usadoEm
      FROM redefinicoes_senha r
      WHERE r.token = @token
        AND r.usadoEm IS NULL
        AND r.expiraEm > SYSUTCDATETIME();
    `);
  return result.recordset[0] || null;
}

async function marcarComoUsado(id) {
  const pool = await getPool();
  await pool
    .request()
    .input('id', sql.Int, id)
    .query(`UPDATE redefinicoes_senha SET usadoEm = SYSUTCDATETIME() WHERE id = @id;`);
}

module.exports = { criar, buscarTokenValido, marcarComoUsado };
