const express = require('express');
const router = express.Router();

const denunciaController = require('../controllers/denunciaController');
const autenticar = require('../middlewares/auth');
const { denunciaCadastroRules, validar } = require('../middlewares/validators');

router.use(autenticar);

/**
 * @route POST /denuncias
 * @description Reporta um problema em uma questão (ex: gabarito errado).
 */
router.post('/', denunciaCadastroRules, validar, denunciaController.criar);

module.exports = router;
