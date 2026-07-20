const express = require('express');
const { body, param } = require('express-validator');
const router = express.Router();

const temaController = require('../controllers/temaController');
const autenticar = require('../middlewares/auth');
const autorizarAdmin = require('../middlewares/autorizarAdmin');
const { validar } = require('../middlewares/validators');

router.use(autenticar);

router.get('/', temaController.listar);
router.post(
  '/',
  autorizarAdmin,
  body('nome').trim().notEmpty().withMessage('O nome do tema é obrigatório.').isLength({ max: 120 }),
  validar,
  temaController.cadastrar
);
router.delete('/:id', autorizarAdmin, param('id').isInt({ min: 1 }).withMessage('ID inválido.'), validar, temaController.excluir);

module.exports = router;
