const express = require('express');
const rateLimit = require('express-rate-limit');
const router = express.Router();

const authController = require('../controllers/authController');
const autenticar = require('../middlewares/auth');
const { loginRules, trocaSenhaRules, validar } = require('../middlewares/validators');

// Limite dedicado e mais restritivo que o global, para dificultar
// força bruta de senha (não conta por sucesso, só por tentativa).
const limiterLogin = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 10,
  standardHeaders: true,
  legacyHeaders: false,
  message: { sucesso: false, mensagem: 'Muitas tentativas de login. Aguarde alguns minutos e tente novamente.' },
});

/**
 * @route POST /auth/login
 * @description Autentica o usuário e retorna um token JWT.
 */
router.post('/login', limiterLogin, loginRules, validar, authController.login);

/**
 * @route POST /auth/logout
 * @description Encerra a sessão (stateless - orienta descarte do token).
 */
router.post('/logout', autenticar, authController.logout);

/**
 * @route PUT /auth/senha
 * @description Troca a senha do usuário autenticado.
 */
router.put('/senha', autenticar, trocaSenhaRules, validar, authController.trocarSenha);

module.exports = router;
