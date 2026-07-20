/**
 * Job de renovação de assinaturas pagas via Pix.
 *
 * Diferente do cartão (que o Mercado Pago debita sozinho via Preapproval),
 * o Pix não tem auto-débito: a cada ciclo é preciso gerar uma NOVA
 * cobrança avulsa para o usuário pagar. Esta rotina roda periodicamente
 * e cria essa cobrança um pouco antes do período atual vencer.
 */

const PLANOS = require('../config/planos');
const assinaturaModel = require('../models/assinaturaModel');
const pagamentoModel = require('../models/pagamentoModel');
const mercadoPagoService = require('../services/mercadoPagoService');

async function gerarRenovacoesPixPendentes() {
  const pendentes = await assinaturaModel.buscarPixParaRenovar();

  for (const assinatura of pendentes) {
    const dadosPlano = PLANOS[assinatura.plano];
    if (!dadosPlano) continue;

    try {
      const pagamentoMP = await mercadoPagoService.criarPagamentoPix({
        idAssinatura: assinatura.id,
        dadosPlano,
        emailPagador: assinatura.emailPagador,
      });

      await pagamentoModel.registrarOuAtualizarPagamento({
        idAssinatura: assinatura.id,
        idTransacaoGateway: pagamentoMP.id,
        metodo: 'pix',
        valor: dadosPlano.valor,
        status: 'pendente',
        dataPagamento: null,
        extensaoMeses: dadosPlano.frequencia,
      });

      console.log(`[renovacaoPix] Cobrança Pix gerada para a assinatura ${assinatura.id}.`);
    } catch (err) {
      console.error(`[renovacaoPix] Falha ao gerar cobrança para a assinatura ${assinatura.id}:`, err.message);
    }
  }
}

/**
 * Agenda a checagem de renovações Pix para rodar a cada `intervaloMs`
 * (padrão: 24h). Chamado uma vez na inicialização do servidor.
 */
function agendarRenovacaoPix(intervaloMs = 24 * 60 * 60 * 1000) {
  gerarRenovacoesPixPendentes().catch((err) => console.error('[renovacaoPix] Falha na checagem inicial:', err.message));
  setInterval(() => {
    gerarRenovacoesPixPendentes().catch((err) => console.error('[renovacaoPix] Falha na checagem periódica:', err.message));
  }, intervaloMs);
}

module.exports = { gerarRenovacoesPixPendentes, agendarRenovacaoPix };
