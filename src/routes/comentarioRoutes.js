const express = require('express');
const router = express.Router();

const comentarioController = require('../controllers/comentarioController');
const autenticar = require('../middlewares/auth');
const { comentarioCadastroRules, listagemComentariosRules, validar } = require('../middlewares/validators');

router.use(autenticar);

/**
 * @route GET /comentarios?idQuestao=123
 * @description Lista os comentários de uma questão, em ordem cronológica.
 */
router.get('/', listagemComentariosRules, validar, comentarioController.listar);

/**
 * @route POST /comentarios
 * @description Publica um comentário em uma questão.
 */
router.post('/', comentarioCadastroRules, validar, comentarioController.criar);

module.exports = router;
