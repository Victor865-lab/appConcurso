const express = require('express');
const rateLimit = require('express-rate-limit');
const router = express.Router();

const authController = require('../controllers/authController');
const autenticar = require('../middlewares/auth');
const {
  loginRules, trocaSenhaRules, solicitarRedefinicaoSenhaRules, redefinirSenhaRules, validar,
} = require('../middlewares/validators');

// Limite dedicado e mais restritivo que o global, para dificultar
// força bruta de senha (não conta por sucesso, só por tentativa).
const limiterLogin = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 10,
  standardHeaders: true,
  legacyHeaders: false,
  message: { sucesso: false, mensagem: 'Muitas tentativas de login. Aguarde alguns minutos e tente novamente.' },
});

// Limite mais apertado ainda: cada tentativa dispara um envio de e-mail,
// então evita tanto força bruta quanto spam na caixa de entrada de terceiros.
const limiterRedefinicaoSenha = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 5,
  standardHeaders: true,
  legacyHeaders: false,
  message: { sucesso: false, mensagem: 'Muitas solicitações. Aguarde alguns minutos e tente novamente.' },
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

/**
 * @route POST /auth/esqueci-senha
 * @description Solicita o envio de um link de redefinição de senha por e-mail.
 */
router.post('/esqueci-senha', limiterRedefinicaoSenha, solicitarRedefinicaoSenhaRules, validar, authController.solicitarRedefinicaoSenha);

/**
 * @route POST /auth/redefinir-senha
 * @description Confirma a redefinição de senha a partir do token recebido por e-mail.
 */
router.post('/redefinir-senha', limiterRedefinicaoSenha, redefinirSenhaRules, validar, authController.redefinirSenha);

module.exports = router;
