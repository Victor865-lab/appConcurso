const express = require('express');
const { body } = require('express-validator');
const router = express.Router();

const respostaController = require('../controllers/respostaController');
const autenticar = require('../middlewares/auth');
const verificarAssinaturaAtiva = require('../middlewares/verificarAssinatura');
const { validar } = require('../middlewares/validators');

router.use(autenticar);
router.use(verificarAssinaturaAtiva);

router.get('/status', respostaController.status);

router.post(
  '/',
  body('idQuestao').isInt({ min: 1 }).withMessage('idQuestao é obrigatório.'),
  body('idAlternativa').isInt({ min: 1 }).withMessage('idAlternativa é obrigatório.'),
  validar,
  respostaController.responder
);

module.exports = router;
