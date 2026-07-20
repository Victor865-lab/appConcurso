const express = require('express');
const router = express.Router();

const progressoController = require('../controllers/progressoController');
const autenticar = require('../middlewares/auth');
const verificarAssinaturaAtiva = require('../middlewares/verificarAssinatura');

router.use(autenticar);
router.use(verificarAssinaturaAtiva);

router.get('/resumo', progressoController.resumo);
router.get('/evolucao', progressoController.graficoEvolucao);
router.get('/calendario', progressoController.calendario);
router.get('/mapa-tema', progressoController.mapaPorTema);

module.exports = router;
