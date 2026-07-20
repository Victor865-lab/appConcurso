const express = require('express');
const router = express.Router();

const assinaturaController = require('../controllers/assinaturaController');

/**
 * @route POST /webhooks/pagamento
 * @description Notificação pública do Mercado Pago sobre mudança de status
 * de uma assinatura (cartão) ou de um pagamento (recorrente ou Pix avulso).
 * Fica FORA do middleware de autenticação de propósito — o Mercado Pago não
 * envia o token JWT da aplicação. A autenticidade é validada via assinatura
 * HMAC do header x-signature (ver mercadoPagoService.validarAssinaturaWebhook).
 */
router.post('/pagamento', assinaturaController.webhook);

module.exports = router;
