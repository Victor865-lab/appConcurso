const express = require('express');
const router = express.Router();

const rankingController = require('../controllers/rankingController');
const autenticar = require('../middlewares/auth');
const verificarAssinaturaAtiva = require('../middlewares/verificarAssinatura');

router.use(autenticar);
router.use(verificarAssinaturaAtiva);

router.get('/', rankingController.listar);

module.exports = router;
