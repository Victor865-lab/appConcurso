/**
 * Serviço de integração com o Mercado Pago: assinaturas recorrentes via
 * cartão (Preapproval), cobranças avulsas via Pix (Payments), consulta e
 * estorno de pagamentos, e validação de assinatura de webhook.
 * Usa fetch nativo do Node — sem SDK adicional.
 * Docs: https://www.mercadopago.com.br/developers/pt/docs/subscriptions
 *       https://www.mercadopago.com.br/developers/pt/docs/your-integrations/notifications/webhooks
 */

const crypto = require('crypto');

require('dotenv').config();

const BASE_URL = 'https://api.mercadopago.com';
const ACCESS_TOKEN = process.env.MERCADOPAGO_ACCESS_TOKEN;
const WEBHOOK_SECRET = process.env.MERCADOPAGO_WEBHOOK_SECRET;

function garantirAccessToken() {
  if (!ACCESS_TOKEN) {
    throw new Error('MERCADOPAGO_ACCESS_TOKEN não configurado no .env — gere em developers.mercadopago.com.');
  }
}

/**
 * Cria uma assinatura recorrente (preapproval) "pending": o Mercado Pago
 * retorna um init_point para o qual o navegador do usuário deve ser
 * redirecionado, onde ele informa o cartão e aprova a recorrência.
 *
 * Limitação do Mercado Pago: Preapproval só cobra automaticamente no
 * cartão. Pix não tem "credencial salva" para auto-débito — por isso o
 * fluxo Pix é feito à parte, via criarPagamentoPix (cobrança avulsa
 * repetida a cada ciclo, não um auto-débito de verdade).
 */
async function criarPreapproval({ idUsuario, plano, dadosPlano, emailPagador, backUrl }) {
  garantirAccessToken();

  const resposta = await fetch(`${BASE_URL}/preapproval`, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${ACCESS_TOKEN}`,
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({
      reason: `Assinatura ${dadosPlano.nome} — Trilha de Estudos`,
      external_reference: `usuario:${idUsuario}:plano:${plano}`,
      payer_email: emailPagador,
      back_url: backUrl,
      auto_recurring: {
        frequency: dadosPlano.frequencia,
        frequency_type: dadosPlano.frequenciaTipo,
        transaction_amount: dadosPlano.valor,
        currency_id: 'BRL',
      },
      status: 'pending',
    }),
  });

  const dados = await resposta.json();
  if (!resposta.ok) {
    const erro = new Error(dados.message || 'Erro ao criar assinatura no Mercado Pago.');
    erro.detalhesMP = dados;
    throw erro;
  }
  return dados;
}

/**
 * Consulta o status atual de uma assinatura diretamente na API do
 * Mercado Pago — usado como fallback ao webhook (útil em ambiente local,
 * onde o Mercado Pago não consegue chamar http://localhost).
 */
async function buscarPreapproval(idPreapproval) {
  garantirAccessToken();

  const resposta = await fetch(`${BASE_URL}/preapproval/${idPreapproval}`, {
    headers: { Authorization: `Bearer ${ACCESS_TOKEN}` },
  });

  const dados = await resposta.json();
  if (!resposta.ok) {
    const erro = new Error(dados.message || 'Erro ao consultar assinatura no Mercado Pago.');
    throw erro;
  }
  return dados;
}

/**
 * Cria uma cobrança Pix avulsa (um "pagamento" comum do Mercado Pago,
 * não uma assinatura). Usada tanto na primeira cobrança de um plano pago
 * via Pix quanto na renovação de cada ciclo (ver job de renovação).
 * Retorna o QR code (copia-e-cola) e a imagem em base64 para exibir ao
 * usuário — o Pix não usa redirecionamento como o cartão.
 */
async function criarPagamentoPix({ idAssinatura, dadosPlano, emailPagador }) {
  garantirAccessToken();

  const resposta = await fetch(`${BASE_URL}/v1/payments`, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${ACCESS_TOKEN}`,
      'Content-Type': 'application/json',
      'X-Idempotency-Key': crypto.randomUUID(),
    },
    body: JSON.stringify({
      transaction_amount: dadosPlano.valor,
      description: `Assinatura ${dadosPlano.nome} — Trilha de Estudos`,
      payment_method_id: 'pix',
      payer: { email: emailPagador },
      external_reference: `assinatura:${idAssinatura}`,
    }),
  });

  const dados = await resposta.json();
  if (!resposta.ok) {
    const erro = new Error(dados.message || 'Erro ao gerar cobrança Pix no Mercado Pago.');
    erro.detalhesMP = dados;
    throw erro;
  }
  return dados;
}

/**
 * Consulta um pagamento (cobrança individual, avulsa ou gerada por uma
 * assinatura recorrente) diretamente na API do Mercado Pago.
 */
async function buscarPagamento(idPagamento) {
  garantirAccessToken();

  const resposta = await fetch(`${BASE_URL}/v1/payments/${idPagamento}`, {
    headers: { Authorization: `Bearer ${ACCESS_TOKEN}` },
  });

  const dados = await resposta.json();
  if (!resposta.ok) {
    const erro = new Error(dados.message || 'Erro ao consultar pagamento no Mercado Pago.');
    throw erro;
  }
  return dados;
}

/**
 * Estorna (total) um pagamento aprovado — usado no direito de
 * arrependimento de 7 dias (CDC art. 49).
 */
async function estornarPagamento(idPagamento) {
  garantirAccessToken();

  const resposta = await fetch(`${BASE_URL}/v1/payments/${idPagamento}/refunds`, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${ACCESS_TOKEN}`,
      'Content-Type': 'application/json',
      'X-Idempotency-Key': crypto.randomUUID(),
    },
  });

  const dados = await resposta.json();
  if (!resposta.ok) {
    const erro = new Error(dados.message || 'Erro ao estornar pagamento no Mercado Pago.');
    erro.detalhesMP = dados;
    throw erro;
  }
  return dados;
}

/**
 * Valida a assinatura (header x-signature) de uma notificação de webhook,
 * garantindo que ela realmente veio do Mercado Pago e não foi forjada.
 * Formato oficial: x-signature: "ts=<timestamp>,v1=<hash>"
 * manifest = `id:{dataId};request-id:{xRequestId};ts:{ts};`
 * hash = HMAC-SHA256(manifest, secret)
 * Docs: https://www.mercadopago.com.br/developers/pt/docs/your-integrations/notifications/webhooks
 */
function validarAssinaturaWebhook({ xSignature, xRequestId, dataId }) {
  if (!WEBHOOK_SECRET) {
    if (process.env.NODE_ENV === 'production') {
      console.error('[mercadoPago] MERCADOPAGO_WEBHOOK_SECRET não configurado em produção — rejeitando webhook.');
      return false;
    }
    console.warn('[mercadoPago] MERCADOPAGO_WEBHOOK_SECRET não configurado — notificação NÃO verificada (aceito só por estar fora de produção).');
    return true;
  }
  if (!xSignature || !dataId) return false;

  const partes = {};
  xSignature.split(',').forEach((parte) => {
    const [chave, valor] = parte.split('=');
    if (chave && valor) partes[chave.trim()] = valor.trim();
  });

  const { ts, v1 } = partes;
  if (!ts || !v1) return false;

  const manifest = `id:${String(dataId).toLowerCase()};request-id:${xRequestId || ''};ts:${ts};`;
  const hashCalculado = crypto.createHmac('sha256', WEBHOOK_SECRET).update(manifest).digest('hex');

  const bufferCalculado = Buffer.from(hashCalculado, 'utf8');
  const bufferRecebido = Buffer.from(v1, 'utf8');
  if (bufferCalculado.length !== bufferRecebido.length) return false;

  return crypto.timingSafeEqual(bufferCalculado, bufferRecebido);
}

module.exports = {
  criarPreapproval,
  buscarPreapproval,
  criarPagamentoPix,
  buscarPagamento,
  estornarPagamento,
  validarAssinaturaWebhook,
};
