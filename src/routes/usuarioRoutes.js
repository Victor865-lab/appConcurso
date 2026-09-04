const express = require('express');
const rateLimit = require('express-rate-limit');
const router = express.Router();

const usuarioController = require('../controllers/usuarioController');
const autenticar = require('../middlewares/auth');
const autorizarAdmin = require('../middlewares/autorizarAdmin');
const {
  usuarioCadastroRules,
  usuarioAtualizacaoRules,
  usuarioAcessoRules,
  idParamRule,
  validar,
} = require('../middlewares/validators');

// Limite dedicado para dificultar criação em massa de contas automatizada.
const limiterCadastro = rateLimit({
  windowMs: 60 * 60 * 1000,
  max: 20,
  standardHeaders: true,
  legacyHeaders: false,
  message: { sucesso: false, mensagem: 'Muitos cadastros a partir deste endereço. Tente novamente mais tarde.' },
});

// Todas as rotas de usuário exigem autenticação, exceto o cadastro inicial.
router.post('/', limiterCadastro, usuarioCadastroRules, validar, usuarioController.cadastrar);

// Listar todos os usuários é uma operação administrativa (expõe dados de
// todo mundo) — GET/PUT/DELETE por :id são self-service e checam, dentro
// do controller, que o usuário só acessa os próprios dados (ou é admin).
router.get('/', autenticar, autorizarAdmin, usuarioController.listar);
router.get('/:id', autenticar, idParamRule, validar, usuarioController.buscarPorId);
router.put('/:id', autenticar, usuarioAtualizacaoRules, validar, usuarioController.atualizar);

// Bloquear/conceder premium individualmente é operação exclusiva de admin
// (diferente do PUT /:id acima, que é self-service e só altera o nome).
router.put('/:id/acesso', autenticar, autorizarAdmin, usuarioAcessoRules, validar, usuarioController.atualizarAcesso);

router.delete('/:id', autenticar, idParamRule, validar, usuarioController.excluir);

module.exports = router;
