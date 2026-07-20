/**
 * Model de Comentário de Questão.
 * Permite que usuários comentem e interajam entre si em cada
 * questão, na aba de mapeamento.
 */

const { sql, getPool } = require('../config/database');

async function listarPorQuestao(idQuestao, limite = 50) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idQuestao', sql.Int, idQuestao)
    .input('limite', sql.Int, limite)
    .query(`
      SELECT TOP (@limite) c.id, c.texto, c.criadoEm, c.idUsuario, u.nome AS usuarioNome
      FROM comentarios_questao c
      JOIN usuarios u ON u.id = c.idUsuario
      WHERE c.idQuestao = @idQuestao
      ORDER BY c.criadoEm ASC;
    `);
  return result.recordset;
}

async function criar({ idQuestao, idUsuario, texto }) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idQuestao', sql.Int, idQuestao)
    .input('idUsuario', sql.Int, idUsuario)
    .input('texto', sql.NVarChar(500), texto)
    .query(`
      INSERT INTO comentarios_questao (idQuestao, idUsuario, texto)
      OUTPUT INSERTED.id, INSERTED.criadoEm
      VALUES (@idQuestao, @idUsuario, @texto);
    `);
  return result.recordset[0];
}

module.exports = { listarPorQuestao, criar };
