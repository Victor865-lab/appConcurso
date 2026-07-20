const express = require('express');
const router = express.Router();

const assinaturaController = require('../controllers/assinaturaController');
const autenticar = require('../middlewares/auth');
const { assinaturaCadastroRules, reembolsoRules, validar } = require('../middlewares/validators');

router.use(autenticar);

/**
 * @route GET /assinaturas/planos
 * @description Lista os planos de assinatura disponíveis.
 */
router.get('/planos', assinaturaController.listarPlanos);

/**
 * @route GET /assinaturas/atual
 * @description Retorna a assinatura mais recente do usuário logado,
 * sincronizando o status com o Mercado Pago quando ainda está pendente.
 */
router.get('/atual', assinaturaController.minhaAssinatura);

/**
 * @route POST /assinaturas
 * @description Cria uma assinatura: cartão (recorrente, via Preapproval,
 * redireciona para checkout) ou Pix (cobrança avulsa, retorna QR code).
 */
router.post('/', assinaturaCadastroRules, validar, assinaturaController.criarAssinatura);

/**
 * @route POST /assinaturas/:id/reembolsar
 * @description Reembolso por direito de arrependimento (CDC art. 49),
 * disponível somente dentro de 7 dias corridos da contratação.
 */
router.post('/:id/reembolsar', reembolsoRules, validar, assinaturaController.reembolsar);

module.exports = router;
