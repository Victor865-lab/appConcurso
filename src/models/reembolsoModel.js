/**
 * Model de Reembolso.
 * Registra o estorno de um pagamento (direito de arrependimento de 7
 * dias, CDC art. 49): grava o comprovante bruto do gateway, marca o
 * pagamento como estornado e revoga o acesso da assinatura — tudo em
 * uma única transação.
 */

const { sql, getPool } = require('../config/database');

async function criarReembolso({ idPagamento, idAssinatura, motivo, comprovanteUrl, comprovanteJson }) {
  const pool = await getPool();
  const transaction = new sql.Transaction(pool);

  try {
    await transaction.begin();

    const reembolsoRequest = new sql.Request(transaction);
    const reembolsoResult = await reembolsoRequest
      .input('idPagamento', sql.Int, idPagamento)
      .input('motivo', sql.NVarChar(500), motivo || null)
      .input('comprovanteUrl', sql.NVarChar(300), comprovanteUrl || null)
      .input('comprovanteJson', sql.NVarChar(sql.MAX), comprovanteJson || null)
      .query(`
        INSERT INTO reembolsos (idPagamento, motivo, comprovanteUrl, comprovanteJson)
        OUTPUT INSERTED.id
        VALUES (@idPagamento, @motivo, @comprovanteUrl, @comprovanteJson);
      `);

    const pagamentoRequest = new sql.Request(transaction);
    await pagamentoRequest
      .input('idPagamento', sql.Int, idPagamento)
      .query(`UPDATE pagamentos SET status = 'estornado', atualizadoEm = SYSUTCDATETIME() WHERE id = @idPagamento;`);

    const assinaturaRequest = new sql.Request(transaction);
    await assinaturaRequest
      .input('idAssinatura', sql.Int, idAssinatura)
      .query(`
        UPDATE assinaturas
        SET status = 'reembolsada', dataFim = SYSUTCDATETIME(), atualizadoEm = SYSUTCDATETIME()
        WHERE id = @idAssinatura;
      `);

    await transaction.commit();
    return reembolsoResult.recordset[0];
  } catch (err) {
    await transaction.rollback();
    throw err;
  }
}

module.exports = { criarReembolso };
