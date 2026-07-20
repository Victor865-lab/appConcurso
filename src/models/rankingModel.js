/**
 * Model de Ranking.
 * Pontuação é sempre derivada de respostas_usuario (10 pontos por
 * acerto), garantindo uma única fonte de verdade — nunca armazenada
 * de forma duplicada em usuarios.
 */

const { sql, getPool } = require('../config/database');

/**
 * Retorna o ranking geral ou filtrado por período (dias),
 * incluindo a posição de cada usuário via RANK().
 */
async function listar({ dias, limite = 50 }) {
  const pool = await getPool();
  const request = pool.request().input('limite', sql.Int, limite);

  const filtroData = dias
    ? `AND r.respondidoEm >= DATEADD(DAY, -@dias, CAST(SYSUTCDATETIME() AS DATE))`
    : '';
  if (dias) request.input('dias', sql.Int, dias);

  const result = await request.query(`
    SELECT
      u.id, u.nome,
      COALESCE(SUM(CASE WHEN r.correta = 1 THEN 10 ELSE 0 END), 0) AS pontos,
      COUNT(r.id) AS totalRespondidas,
      RANK() OVER (ORDER BY COALESCE(SUM(CASE WHEN r.correta = 1 THEN 10 ELSE 0 END), 0) DESC) AS posicao
    FROM usuarios u
    LEFT JOIN respostas_usuario r ON r.idUsuario = u.id ${filtroData}
    GROUP BY u.id, u.nome
    ORDER BY pontos DESC, u.nome ASC
    OFFSET 0 ROWS FETCH NEXT @limite ROWS ONLY;
  `);

  return result.recordset;
}

/**
 * Retorna a posição e pontuação de um usuário específico,
 * mesmo que ele não esteja no top N retornado por listar().
 */
async function posicaoUsuario(idUsuario, { dias } = {}) {
  const pool = await getPool();
  const request = pool.request().input('idUsuario', sql.Int, idUsuario);

  const filtroData = dias
    ? `AND r.respondidoEm >= DATEADD(DAY, -@dias, CAST(SYSUTCDATETIME() AS DATE))`
    : '';
  if (dias) request.input('dias', sql.Int, dias);

  const result = await request.query(`
    WITH Ranking AS (
      SELECT
        u.id,
        COALESCE(SUM(CASE WHEN r.correta = 1 THEN 10 ELSE 0 END), 0) AS pontos,
        RANK() OVER (ORDER BY COALESCE(SUM(CASE WHEN r.correta = 1 THEN 10 ELSE 0 END), 0) DESC) AS posicao
      FROM usuarios u
      LEFT JOIN respostas_usuario r ON r.idUsuario = u.id ${filtroData}
      GROUP BY u.id
    )
    SELECT id, pontos, posicao FROM Ranking WHERE id = @idUsuario;
  `);

  return result.recordset[0] || null;
}

module.exports = { listar, posicaoUsuario };
