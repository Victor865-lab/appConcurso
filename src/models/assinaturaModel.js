/**
 * Model de Assinatura.
 * Guarda o histórico de assinaturas do usuário e sincroniza o status
 * com o Mercado Pago (por webhook ou consulta direta).
 */

const { sql, getPool } = require('../config/database');

async function criar({ idUsuario, plano, valor, emailPagador, metodoPagamento, idPreapprovalMP, status }) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idUsuario', sql.Int, idUsuario)
    .input('plano', sql.NVarChar(20), plano)
    .input('valor', sql.Decimal(10, 2), valor)
    .input('emailPagador', sql.NVarChar(150), emailPagador)
    .input('metodoPagamento', sql.NVarChar(20), metodoPagamento)
    .input('idPreapprovalMP', sql.NVarChar(100), idPreapprovalMP || null)
    .input('status', sql.NVarChar(20), status)
    .query(`
      INSERT INTO assinaturas (idUsuario, plano, valor, emailPagador, metodoPagamento, idPreapprovalMP, status)
      OUTPUT INSERTED.*
      VALUES (@idUsuario, @plano, @valor, @emailPagador, @metodoPagamento, @idPreapprovalMP, @status);
    `);
  return result.recordset[0];
}

async function buscarPorId(id) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .query(`SELECT * FROM assinaturas WHERE id = @id;`);
  return result.recordset[0] || null;
}

/**
 * Assinaturas pagas via Pix cujo período de acesso está vencendo (ou já
 * venceu) e que ainda não têm uma cobrança pendente em aberto — usadas
 * pelo job de renovação (ver services/renovacaoPixService.js).
 */
async function buscarPixParaRenovar() {
  const pool = await getPool();
  const result = await pool.request().query(`
    SELECT a.*
    FROM assinaturas a
    WHERE a.metodoPagamento = 'pix'
      AND a.status IN ('autorizada', 'pendente')
      AND (a.dataFim IS NULL OR a.dataFim <= DATEADD(DAY, 2, SYSUTCDATETIME()))
      AND NOT EXISTS (
        SELECT 1 FROM pagamentos p WHERE p.idAssinatura = a.id AND p.status = 'pendente'
      );
  `);
  return result.recordset;
}

async function buscarMaisRecentePorUsuario(idUsuario) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idUsuario', sql.Int, idUsuario)
    .query(`
      SELECT TOP 1 *
      FROM assinaturas
      WHERE idUsuario = @idUsuario
      ORDER BY criadoEm DESC;
    `);
  return result.recordset[0] || null;
}

async function buscarPorPreapprovalMP(idPreapprovalMP) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idPreapprovalMP', sql.NVarChar(100), idPreapprovalMP)
    .query(`SELECT * FROM assinaturas WHERE idPreapprovalMP = @idPreapprovalMP;`);
  return result.recordset[0] || null;
}

async function atualizarStatus(id, status) {
  const pool = await getPool();
  await pool
    .request()
    .input('id', sql.Int, id)
    .input('status', sql.NVarChar(20), status)
    .query(`
      UPDATE assinaturas
      SET status = @status, atualizadoEm = SYSUTCDATETIME()
      WHERE id = @id;
    `);
}

module.exports = {
  criar,
  buscarPorId,
  buscarPixParaRenovar,
  buscarMaisRecentePorUsuario,
  buscarPorPreapprovalMP,
  atualizarStatus,
};
