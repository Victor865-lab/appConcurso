const express = require('express');
const rateLimit = require('express-rate-limit');
const router = express.Router();

const reclamacaoController = require('../controllers/reclamacaoController');
const autenticar = require('../middlewares/auth');
const { reclamacaoCadastroRules, validar } = require('../middlewares/validators');

// Cada envio dispara um e-mail real — limite dedicado evita spam na
// caixa de entrada do admin.
const limiterReclamacao = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 5,
  standardHeaders: true,
  legacyHeaders: false,
  message: { sucesso: false, mensagem: 'Muitas reclamações enviadas. Aguarde alguns minutos e tente novamente.' },
});

router.use(autenticar);

/**
 * @route POST /reclamacoes
 * @description Envia uma reclamação/feedback do usuário por e-mail para o admin.
 */
router.post('/', limiterReclamacao, reclamacaoCadastroRules, validar, reclamacaoController.enviar);

module.exports = router;
