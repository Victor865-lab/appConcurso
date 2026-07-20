/**
 * Model de Progresso.
 * Fornece dados de streak/calendário de acessos do usuário.
 */

const { sql, getPool } = require('../config/database');

async function buscarUsuarioComStreak(idUsuario) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, idUsuario)
    .query(`
      SELECT id, nome, streakAtual, streakRecorde, ultimoAcesso
      FROM usuarios
      WHERE id = @id;
    `);
  return result.recordset[0] || null;
}

/**
 * Retorna os acessos do usuário nos últimos N dias, no formato
 * { data: 'YYYY-MM-DD', quantidade } — usado no calendário estilo heatmap.
 */
async function calendarioAcessos(idUsuario, dias = 365) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idUsuario', sql.Int, idUsuario)
    .input('dias', sql.Int, dias)
    .query(`
      SELECT CONVERT(VARCHAR(10), dataAcesso, 120) AS data, quantidade
      FROM acessos_usuario
      WHERE idUsuario = @idUsuario
        AND dataAcesso >= DATEADD(DAY, -@dias, CAST(SYSUTCDATETIME() AS DATE))
      ORDER BY dataAcesso ASC;
    `);
  return result.recordset;
}

module.exports = { buscarUsuarioComStreak, calendarioAcessos };
