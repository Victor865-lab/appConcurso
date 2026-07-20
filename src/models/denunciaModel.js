/**
 * Model de Denúncia de Questão.
 * Permite que o usuário reporte um problema em uma questão
 * (enunciado errado, gabarito incorreto, etc.), na aba de mapeamento.
 */

const { sql, getPool } = require('../config/database');

async function criar({ idQuestao, idUsuario, motivo }) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idQuestao', sql.Int, idQuestao)
    .input('idUsuario', sql.Int, idUsuario)
    .input('motivo', sql.NVarChar(500), motivo)
    .query(`
      INSERT INTO denuncias_questao (idQuestao, idUsuario, motivo)
      OUTPUT INSERTED.id, INSERTED.criadoEm
      VALUES (@idQuestao, @idUsuario, @motivo);
    `);
  return result.recordset[0];
}

module.exports = { criar };
