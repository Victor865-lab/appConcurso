const express = require('express');
const { body, param } = require('express-validator');
const router = express.Router();

const simuladoController = require('../controllers/simuladoController');
const autenticar = require('../middlewares/auth');
const verificarAssinaturaAtiva = require('../middlewares/verificarAssinatura');
const { validar } = require('../middlewares/validators');

router.use(autenticar);
router.use(verificarAssinaturaAtiva);

router.get('/', simuladoController.listar);

router.post(
  '/',
  body('idTema').optional({ nullable: true }).isInt({ min: 1 }).withMessage('idTema inválido.'),
  body('banca').optional({ nullable: true }).trim(),
  body('dificuldade').optional({ nullable: true }).isIn(['facil', 'medio', 'dificil']).withMessage('Dificuldade inválida.'),
  body('quantidade').isInt({ min: 1, max: 100 }).withMessage('A quantidade deve ser entre 1 e 100.'),
  validar,
  simuladoController.gerar
);

router.get('/:id', param('id').isInt({ min: 1 }).withMessage('ID inválido.'), validar, simuladoController.buscarPorId);

router.post(
  '/:id/finalizar',
  param('id').isInt({ min: 1 }).withMessage('ID inválido.'),
  body('respostas').isArray({ min: 1 }).withMessage('Informe ao menos uma resposta.'),
  body('respostas.*.idQuestao').isInt({ min: 1 }).withMessage('idQuestao inválido em uma das respostas.'),
  body('respostas.*.idAlternativa').isInt({ min: 1 }).withMessage('idAlternativa inválido em uma das respostas.'),
  validar,
  simuladoController.finalizar
);

module.exports = router;
