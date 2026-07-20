const express = require('express');
const { param } = require('express-validator');
const router = express.Router();

const alternativaController = require('../controllers/alternativaController');
const autenticar = require('../middlewares/auth');
const autorizarAdmin = require('../middlewares/autorizarAdmin');
const {
  alternativaCadastroRules,
  alternativaAtualizacaoRules,
  idParamRule,
  validar,
} = require('../middlewares/validators');

router.use(autenticar);

router.post('/', autorizarAdmin, alternativaCadastroRules, validar, alternativaController.cadastrar);
router.get(
  '/questao/:idQuestao',
  param('idQuestao').isInt({ min: 1 }).withMessage('ID de questão inválido.'),
  validar,
  alternativaController.listarPorQuestao
);
router.get('/:id', idParamRule, validar, alternativaController.buscarPorId);
router.put('/:id', autorizarAdmin, alternativaAtualizacaoRules, validar, alternativaController.atualizar);
router.delete('/:id', autorizarAdmin, idParamRule, validar, alternativaController.excluir);

module.exports = router;
