/**
 * Model de Pagamento.
 * Registra cada cobrança individual (avulsa via Pix ou gerada
 * automaticamente pela recorrência do cartão) de uma assinatura.
 * Sempre que um pagamento passa a "aprovado", estende o período de
 * acesso (dataFim) da assinatura correspondente — tudo em uma
 * transação, e de forma idempotente (reprocessar a mesma notificação
 * não duplica a extensão do período).
 */

const { sql, getPool } = require('../config/database');

async function buscarPorTransacaoGateway(idTransacaoGateway) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idTransacaoGateway', sql.NVarChar(100), String(idTransacaoGateway))
    .query(`SELECT * FROM pagamentos WHERE idTransacaoGateway = @idTransacaoGateway;`);
  return result.recordset[0] || null;
}

async function buscarPorId(id) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .query(`SELECT * FROM pagamentos WHERE id = @id;`);
  return result.recordset[0] || null;
}

async function buscarMaisRecenteAprovado(idAssinatura) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idAssinatura', sql.Int, idAssinatura)
    .query(`
      SELECT TOP 1 * FROM pagamentos
      WHERE idAssinatura = @idAssinatura AND status = 'aprovado'
      ORDER BY criadoEm DESC;
    `);
  return result.recordset[0] || null;
}

async function buscarMaisRecentePorAssinatura(idAssinatura) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idAssinatura', sql.Int, idAssinatura)
    .query(`SELECT TOP 1 * FROM pagamentos WHERE idAssinatura = @idAssinatura ORDER BY criadoEm DESC;`);
  return result.recordset[0] || null;
}

/**
 * Cria (ou atualiza, se já existir pelo idTransacaoGateway) o registro
 * do pagamento. Só estende o período de acesso da assinatura quando o
 * pagamento passa a "aprovado" pela primeira vez — reenvios do mesmo
 * evento (webhook duplicado, nova consulta de status) não duplicam a
 * extensão. `extensaoMeses` é a periodicidade do plano (1, 3, 6 ou 12).
 */
async function registrarOuAtualizarPagamento({ idAssinatura, idTransacaoGateway, metodo, valor, status, dataPagamento, extensaoMeses }) {
  const existente = await buscarPorTransacaoGateway(idTransacaoGateway);
  const jaEstavaAprovado = existente?.status === 'aprovado';

  const pool = await getPool();
  const transaction = new sql.Transaction(pool);

  try {
    await transaction.begin();

    let idPagamento;
    if (existente) {
      idPagamento = existente.id;
      const atualizarRequest = new sql.Request(transaction);
      await atualizarRequest
        .input('id', sql.Int, idPagamento)
        .input('status', sql.NVarChar(20), status)
        .input('dataPagamento', sql.DateTime2, dataPagamento || null)
        .query(`
          UPDATE pagamentos
          SET status = @status, dataPagamento = @dataPagamento, atualizadoEm = SYSUTCDATETIME()
          WHERE id = @id;
        `);
    } else {
      const inserirRequest = new sql.Request(transaction);
      const resultado = await inserirRequest
        .input('idAssinatura', sql.Int, idAssinatura)
        .input('idTransacaoGateway', sql.NVarChar(100), String(idTransacaoGateway))
        .input('metodo', sql.NVarChar(20), metodo)
        .input('valor', sql.Decimal(10, 2), valor)
        .input('status', sql.NVarChar(20), status)
        .input('dataPagamento', sql.DateTime2, dataPagamento || null)
        .query(`
          INSERT INTO pagamentos (idAssinatura, idTransacaoGateway, metodo, valor, status, dataPagamento)
          OUTPUT INSERTED.id
          VALUES (@idAssinatura, @idTransacaoGateway, @metodo, @valor, @status, @dataPagamento);
        `);
      idPagamento = resultado.recordset[0].id;
    }

    if (status === 'aprovado' && !jaEstavaAprovado) {
      const assinaturaRequest = new sql.Request(transaction);
      await assinaturaRequest
        .input('idAssinatura', sql.Int, idAssinatura)
        .input('extensaoMeses', sql.Int, extensaoMeses)
        .query(`
          UPDATE assinaturas
          SET status = 'autorizada',
              dataInicio = ISNULL(dataInicio, SYSUTCDATETIME()),
              dataFim = DATEADD(MONTH, @extensaoMeses, CASE WHEN dataFim IS NULL OR dataFim < SYSUTCDATETIME() THEN SYSUTCDATETIME() ELSE dataFim END),
              atualizadoEm = SYSUTCDATETIME()
          WHERE id = @idAssinatura;
        `);
    }

    await transaction.commit();
    return buscarPorId(idPagamento);
  } catch (err) {
    await transaction.rollback();
    throw err;
  }
}

module.exports = {
  buscarPorTransacaoGateway,
  buscarPorId,
  buscarMaisRecenteAprovado,
  buscarMaisRecentePorAssinatura,
  registrarOuAtualizarPagamento,
};
