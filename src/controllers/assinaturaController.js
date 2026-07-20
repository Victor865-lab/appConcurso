/**
 * Controller de Assinatura.
 * Lista os planos disponíveis, cria assinaturas (cartão recorrente via
 * Preapproval, ou Pix avulso via Payments), processa o webhook de
 * pagamentos/assinaturas e trata o reembolso (direito de arrependimento
 * de 7 dias, CDC art. 49).
 */

const PLANOS = require('../config/planos');
const assinaturaModel = require('../models/assinaturaModel');
const pagamentoModel = require('../models/pagamentoModel');
const reembolsoModel = require('../models/reembolsoModel');
const mercadoPagoService = require('../services/mercadoPagoService');
const { ok, created, fail, notFound, serverError } = require('../utils/response');

const STATUS_PREAPPROVAL_MP_PARA_LOCAL = {
  pending: 'pendente',
  authorized: 'autorizada',
  paused: 'pausada',
  cancelled: 'cancelada',
};

const STATUS_PAGAMENTO_MP_PARA_LOCAL = {
  approved: 'aprovado',
  pending: 'pendente',
  in_process: 'pendente',
  authorized: 'pendente',
  rejected: 'rejeitado',
  cancelled: 'rejeitado',
  refunded: 'estornado',
  charged_back: 'estornado',
};

function mapearMetodoPagamento(pagamentoMP) {
  if (pagamentoMP.payment_method_id === 'pix') return 'pix';
  if (pagamentoMP.payment_type_id === 'debit_card') return 'cartao_debito';
  return 'cartao_credito';
}

/**
 * Encontra a assinatura local correspondente a um pagamento do Mercado
 * Pago: pagamentos de cartão gerados pela recorrência trazem o id da
 * assinatura (subscription_id); pagamentos Pix avulsos trazem no
 * external_reference (definido em criarPagamentoPix).
 */
async function resolverAssinaturaDoPagamento(pagamentoMP) {
  const idPreapproval = pagamentoMP.point_of_interaction?.transaction_data?.subscription_id;
  if (idPreapproval) {
    const porPreapproval = await assinaturaModel.buscarPorPreapprovalMP(idPreapproval);
    if (porPreapproval) return porPreapproval;
  }

  const referencia = pagamentoMP.external_reference;
  if (referencia?.startsWith('assinatura:')) {
    const id = Number(referencia.split(':')[1]);
    return assinaturaModel.buscarPorId(id);
  }
  return null;
}

function listarPlanos(req, res) {
  return ok(res, Object.values(PLANOS), 'Planos obtidos com sucesso.');
}

async function criarAssinatura(req, res) {
  try {
    const idUsuario = req.usuario.id;
    const { plano, emailPagador, metodoPagamento } = req.body;

    const dadosPlano = PLANOS[plano];
    if (!dadosPlano) return fail(res, 'Plano inválido.', 400);

    if (metodoPagamento === 'pix') {
      const assinatura = await assinaturaModel.criar({
        idUsuario,
        plano,
        valor: dadosPlano.valor,
        emailPagador,
        metodoPagamento: 'pix',
        idPreapprovalMP: null,
        status: 'pendente',
      });

      const pagamentoMP = await mercadoPagoService.criarPagamentoPix({ idAssinatura: assinatura.id, dadosPlano, emailPagador });

      await pagamentoModel.registrarOuAtualizarPagamento({
        idAssinatura: assinatura.id,
        idTransacaoGateway: pagamentoMP.id,
        metodo: 'pix',
        valor: dadosPlano.valor,
        status: STATUS_PAGAMENTO_MP_PARA_LOCAL[pagamentoMP.status] || 'pendente',
        dataPagamento: pagamentoMP.date_approved || null,
        extensaoMeses: dadosPlano.frequencia,
      });

      const dadosPix = pagamentoMP.point_of_interaction?.transaction_data;
      return created(res, {
        ...assinatura,
        pix: {
          idPagamento: pagamentoMP.id,
          qrCode: dadosPix?.qr_code,
          qrCodeBase64: dadosPix?.qr_code_base64,
        },
      }, 'Cobrança Pix gerada. Escaneie o QR code para concluir o pagamento.');
    }

    const backUrl = `${process.env.APP_BASE_URL || 'http://localhost:3000'}/app/painel.html?assinatura=retorno`;

    const preapproval = await mercadoPagoService.criarPreapproval({ idUsuario, plano, dadosPlano, emailPagador, backUrl });

    const assinatura = await assinaturaModel.criar({
      idUsuario,
      plano,
      valor: dadosPlano.valor,
      emailPagador,
      metodoPagamento: 'cartao',
      idPreapprovalMP: preapproval.id,
      status: STATUS_PREAPPROVAL_MP_PARA_LOCAL[preapproval.status] || 'pendente',
    });

    return created(res, {
      ...assinatura,
      initPoint: preapproval.init_point,
    }, 'Assinatura criada. Redirecionando para o pagamento.');
  } catch (err) {
    return serverError(res, err.message || 'Erro ao criar assinatura.');
  }
}

async function minhaAssinatura(req, res) {
  try {
    const idUsuario = req.usuario.id;
    const assinatura = await assinaturaModel.buscarMaisRecentePorUsuario(idUsuario);
    if (!assinatura) return ok(res, null, 'Nenhuma assinatura encontrada.');

    if (assinatura.status !== 'pendente') {
      return ok(res, assinatura, 'Assinatura obtida com sucesso.');
    }

    // Ainda pendente: consulta o status mais recente direto no Mercado
    // Pago — em ambiente local o webhook não alcança localhost, então
    // esta consulta é o que mantém o status em dia após o checkout.
    return ok(res, await sincronizarAssinaturaPendente(assinatura), 'Assinatura obtida com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao obter assinatura.');
  }
}

async function sincronizarAssinaturaPendente(assinatura) {
  try {
    if (assinatura.metodoPagamento === 'pix') {
      const pagamento = await pagamentoModel.buscarMaisRecentePorAssinatura(assinatura.id);
      if (pagamento && pagamento.status !== 'aprovado') {
        const pagamentoMP = await mercadoPagoService.buscarPagamento(pagamento.idTransacaoGateway);
        const dadosPlano = PLANOS[assinatura.plano];
        await pagamentoModel.registrarOuAtualizarPagamento({
          idAssinatura: assinatura.id,
          idTransacaoGateway: pagamentoMP.id,
          metodo: 'pix',
          valor: dadosPlano.valor,
          status: STATUS_PAGAMENTO_MP_PARA_LOCAL[pagamentoMP.status] || pagamento.status,
          dataPagamento: pagamentoMP.date_approved || null,
          extensaoMeses: dadosPlano.frequencia,
        });
      }
    } else if (assinatura.idPreapprovalMP) {
      const preapproval = await mercadoPagoService.buscarPreapproval(assinatura.idPreapprovalMP);
      const statusAtual = STATUS_PREAPPROVAL_MP_PARA_LOCAL[preapproval.status] || assinatura.status;
      if (statusAtual !== assinatura.status) {
        await assinaturaModel.atualizarStatus(assinatura.id, statusAtual);
      }
    }
  } catch (e) {
    return assinatura; // segue com os dados locais se a consulta ao gateway falhar
  }
  return assinaturaModel.buscarPorId(assinatura.id);
}

/**
 * Webhook público do Mercado Pago: notificado a cada mudança de status
 * de uma assinatura de cartão ou a cada pagamento (recorrente ou Pix).
 * Requer URL pública (não funciona com http://localhost).
 */
async function webhook(req, res) {
  try {
    const tipo = req.query.type || req.body?.type;
    const dataId = req.query['data.id'] || req.body?.data?.id;

    const assinaturaValida = mercadoPagoService.validarAssinaturaWebhook({
      xSignature: req.headers['x-signature'],
      xRequestId: req.headers['x-request-id'],
      dataId,
    });
    if (!assinaturaValida) return res.status(401).send('assinatura inválida');

    if (tipo === 'subscription_preapproval' && dataId) {
      const assinaturaLocal = await assinaturaModel.buscarPorPreapprovalMP(dataId);
      if (assinaturaLocal) {
        const preapproval = await mercadoPagoService.buscarPreapproval(dataId);
        const statusAtual = STATUS_PREAPPROVAL_MP_PARA_LOCAL[preapproval.status] || assinaturaLocal.status;
        await assinaturaModel.atualizarStatus(assinaturaLocal.id, statusAtual);
      }
    }

    if (tipo === 'payment' && dataId) {
      const pagamentoMP = await mercadoPagoService.buscarPagamento(dataId);
      const assinaturaLocal = await resolverAssinaturaDoPagamento(pagamentoMP);
      if (assinaturaLocal) {
        const dadosPlano = PLANOS[assinaturaLocal.plano];
        await pagamentoModel.registrarOuAtualizarPagamento({
          idAssinatura: assinaturaLocal.id,
          idTransacaoGateway: pagamentoMP.id,
          metodo: mapearMetodoPagamento(pagamentoMP),
          valor: pagamentoMP.transaction_amount,
          status: STATUS_PAGAMENTO_MP_PARA_LOCAL[pagamentoMP.status] || 'pendente',
          dataPagamento: pagamentoMP.date_approved || null,
          extensaoMeses: dadosPlano.frequencia,
        });
      }
    }

    return res.status(200).send('ok');
  } catch (err) {
    // Mercado Pago reenvia notificações em caso de erro; sempre respondemos 200
    // para não gerar retentativas infinitas por um problema já registrado.
    return res.status(200).send('ok');
  }
}

/**
 * Reembolso por direito de arrependimento (CDC art. 49): só é permitido
 * dentro de 7 dias corridos da contratação. Estorna o último pagamento
 * aprovado no Mercado Pago, grava o comprovante e revoga o acesso.
 */
async function reembolsar(req, res) {
  try {
    const idUsuario = req.usuario.id;
    const idAssinatura = Number(req.params.id);

    const assinatura = await assinaturaModel.buscarPorId(idAssinatura);
    if (!assinatura || assinatura.idUsuario !== idUsuario) return notFound(res, 'Assinatura não encontrada.');
    if (assinatura.status === 'reembolsada') return fail(res, 'Esta assinatura já foi reembolsada.', 400);

    const SETE_DIAS_MS = 7 * 24 * 60 * 60 * 1000;
    const contratadaEm = new Date(assinatura.criadoEm).getTime();
    if (Date.now() - contratadaEm > SETE_DIAS_MS) {
      return fail(res, 'O prazo de 7 dias para arrependimento (CDC art. 49) já passou.', 400);
    }

    const pagamento = await pagamentoModel.buscarMaisRecenteAprovado(idAssinatura);
    if (!pagamento) return fail(res, 'Nenhum pagamento aprovado encontrado para esta assinatura.', 400);

    const respostaMP = await mercadoPagoService.estornarPagamento(pagamento.idTransacaoGateway);

    const reembolso = await reembolsoModel.criarReembolso({
      idPagamento: pagamento.id,
      idAssinatura,
      motivo: (req.body && req.body.motivo) || 'Direito de arrependimento (CDC art. 49)',
      comprovanteUrl: null,
      comprovanteJson: JSON.stringify(respostaMP),
    });

    return ok(res, reembolso, 'Reembolso realizado com sucesso.');
  } catch (err) {
    return serverError(res, err.message || 'Erro ao processar reembolso.');
  }
}

module.exports = { listarPlanos, criarAssinatura, minhaAssinatura, webhook, reembolsar };
