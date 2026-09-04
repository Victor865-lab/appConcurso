const express = require('express');
const router = express.Router();

const questaoController = require('../controllers/questaoController');
const autenticar = require('../middlewares/auth');
const autorizarAdmin = require('../middlewares/autorizarAdmin');
const verificarAssinaturaAtiva = require('../middlewares/verificarAssinatura');
const {
  questaoCadastroRules,
  questaoAtualizacaoRules,
  listagemQuestoesRules,
  idParamRule,
  validar,
} = require('../middlewares/validators');

router.use(autenticar);

/**
 * @route GET /questoes/dashboard
 * @description Estatísticas agregadas para o painel administrativo.
 */
router.get('/dashboard', autorizarAdmin, questaoController.dashboard);

/**
 * @route GET /questoes/filtros
 * @description Valores distintos disponíveis (bancas, anos, dificuldades) para popular filtros.
 */
router.get('/filtros', questaoController.valoresFiltro);

/**
 * @route GET /questoes
 * @description Listagem única com suporte a filtros (ativo, respondida,
 * referencia, palavraChave), paginação (pagina, limite) e ordenação
 * (ordenarPor, direcao). Rota compartilhada com o painel administrativo
 * (que passa direto por verificarAssinaturaAtiva, ver o bypass de
 * role='admin' nesse middleware) — para o aluno, o conteúdo das questões
 * só é liberado com assinatura ativa.
 */
router.get('/', verificarAssinaturaAtiva, listagemQuestoesRules, validar, questaoController.listar);

router.get('/:id', verificarAssinaturaAtiva, idParamRule, validar, questaoController.buscarPorId);

/**
 * @route POST /questoes
 * @description Cadastra uma questão e suas alternativas em uma única transação.
 */
router.post('/', autorizarAdmin, questaoCadastroRules, validar, questaoController.cadastrar);

/**
 * @route PUT /questoes/:id
 * @description Atualiza questão e substitui alternativas, tudo em transação.
 */
router.put('/:id', autorizarAdmin, questaoAtualizacaoRules, validar, questaoController.atualizar);

router.delete('/:id', autorizarAdmin, idParamRule, validar, questaoController.excluir);

router.patch('/:id/ativar', autorizarAdmin, idParamRule, validar, questaoController.ativar);
router.patch('/:id/desativar', autorizarAdmin, idParamRule, validar, questaoController.desativar);
router.patch('/:id/marcar-respondida', autorizarAdmin, idParamRule, validar, questaoController.marcarRespondida);
router.patch('/:id/desmarcar-respondida', autorizarAdmin, idParamRule, validar, questaoController.desmarcarRespondida);

module.exports = router;
