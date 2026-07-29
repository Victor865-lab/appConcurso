/**
 * Regras de validação de entrada para cada recurso da API.
 * Utiliza express-validator. O middleware `validar` deve ser
 * encadeado após as regras em cada rota.
 */

const { body, param, query, validationResult } = require('express-validator');
const { fail } = require('../utils/response');

/**
 * Middleware que verifica o resultado das validações anteriores
 * e retorna 400 com mensagens amigáveis caso existam erros.
 */
function validar(req, res, next) {
  const erros = validationResult(req);
  if (!erros.isEmpty()) {
    const mensagens = erros.array().map((e) => ({
      campo: e.path,
      mensagem: e.msg,
    }));
    return fail(res, 'Dados inválidos. Verifique os campos informados.', 400, mensagens);
  }
  next();
}

/* ================= USUÁRIOS ================= */

const usuarioCadastroRules = [
  body('nome')
    .trim()
    .notEmpty().withMessage('O nome é obrigatório.')
    .isLength({ min: 3, max: 150 }).withMessage('O nome deve ter entre 3 e 150 caracteres.'),
  body('senha')
    .notEmpty().withMessage('A senha é obrigatória.')
    .isLength({ min: 8 }).withMessage('A senha deve ter no mínimo 8 caracteres.'),
];

const usuarioAtualizacaoRules = [
  param('id').isInt({ min: 1 }).withMessage('ID de usuário inválido.'),
  body('nome')
    .optional()
    .trim()
    .isLength({ min: 3, max: 150 }).withMessage('O nome deve ter entre 3 e 150 caracteres.'),
];

const trocaSenhaRules = [
  body('senhaAtual').notEmpty().withMessage('Informe a senha atual.'),
  body('novaSenha')
    .notEmpty().withMessage('Informe a nova senha.')
    .isLength({ min: 8 }).withMessage('A nova senha deve ter no mínimo 8 caracteres.'),
];

const loginRules = [
  body('nome').trim().notEmpty().withMessage('Informe o nome de usuário.'),
  body('senha').notEmpty().withMessage('Informe a senha.'),
];

/* ================= QUESTÕES ================= */

const letrasValidas = ['A', 'B', 'C', 'D', 'E'];

const questaoCadastroRules = [
  body('descricao').trim().notEmpty().withMessage('A descrição da questão é obrigatória.'),
  body('referencia').optional({ nullable: true }).trim(),
  body('ativo').optional().isBoolean().withMessage('O campo ativo deve ser verdadeiro ou falso.'),
  body('idTema').optional({ nullable: true }).isInt({ min: 1 }).withMessage('idTema inválido.'),
  body('banca').optional({ nullable: true }).trim().isLength({ max: 100 }).withMessage('Banca deve ter no máximo 100 caracteres.'),
  body('ano').optional({ nullable: true }).isInt({ min: 1900, max: 2100 }).withMessage('Ano inválido.'),
  body('dificuldade').optional({ nullable: true }).isIn(['facil', 'medio', 'dificil']).withMessage('Dificuldade deve ser facil, medio ou dificil.'),
  body('alternativas')
    .isArray({ min: 1 }).withMessage('É necessário informar ao menos uma alternativa.'),
  body('alternativas.*.letra')
    .isIn(letrasValidas).withMessage('A letra da alternativa deve ser A, B, C, D ou E.'),
  body('alternativas.*.descricaoAlt')
    .trim().notEmpty().withMessage('A descrição da alternativa é obrigatória.'),
  body('alternativas.*.correta')
    .isBoolean().withMessage('O campo correta deve ser verdadeiro ou falso.'),
  body('alternativas').custom((alternativas) => {
    if (!Array.isArray(alternativas)) return true;
    const corretas = alternativas.filter((a) => a.correta === true);
    if (corretas.length !== 1) {
      throw new Error('A questão deve possuir exatamente uma alternativa correta.');
    }
    const letras = alternativas.map((a) => a.letra);
    const letrasUnicas = new Set(letras);
    if (letrasUnicas.size !== letras.length) {
      throw new Error('Não é permitido repetir a letra de uma alternativa.');
    }
    return true;
  }),
];

const questaoAtualizacaoRules = [
  param('id').isInt({ min: 1 }).withMessage('ID de questão inválido.'),
  body('descricao').optional().trim().notEmpty().withMessage('A descrição não pode ser vazia.'),
  body('idTema').optional({ nullable: true }).isInt({ min: 1 }).withMessage('idTema inválido.'),
  body('banca').optional({ nullable: true }).trim().isLength({ max: 100 }).withMessage('Banca deve ter no máximo 100 caracteres.'),
  body('ano').optional({ nullable: true }).isInt({ min: 1900, max: 2100 }).withMessage('Ano inválido.'),
  body('dificuldade').optional({ nullable: true }).isIn(['facil', 'medio', 'dificil']).withMessage('Dificuldade deve ser facil, medio ou dificil.'),
  body('alternativas').optional().isArray({ min: 1 }).withMessage('É necessário informar ao menos uma alternativa.'),
  body('alternativas.*.letra')
    .optional()
    .isIn(letrasValidas).withMessage('A letra da alternativa deve ser A, B, C, D ou E.'),
  body('alternativas.*.correta')
    .optional()
    .isBoolean().withMessage('O campo correta deve ser verdadeiro ou falso.'),
  body('alternativas').custom((alternativas) => {
    if (!Array.isArray(alternativas)) return true;
    const corretas = alternativas.filter((a) => a.correta === true);
    if (corretas.length !== 1) {
      throw new Error('A questão deve possuir exatamente uma alternativa correta.');
    }
    return true;
  }),
];

const idParamRule = [param('id').isInt({ min: 1 }).withMessage('ID inválido.')];

const listagemQuestoesRules = [
  query('pagina').optional().isInt({ min: 1 }).withMessage('A página deve ser um número inteiro positivo.'),
  query('limite').optional().isInt({ min: 1, max: 100 }).withMessage('O limite deve estar entre 1 e 100.'),
  query('ordenarPor').optional().isIn(['id', 'referencia', 'criadoEm', 'ano']).withMessage('Campo de ordenação inválido.'),
  query('direcao').optional().isIn(['asc', 'desc']).withMessage('Direção de ordenação inválida.'),
  query('idTema').optional().isInt({ min: 1 }).withMessage('idTema inválido.'),
  query('ano').optional().isInt({ min: 1900, max: 2100 }).withMessage('Ano inválido.'),
  query('dificuldade').optional().isIn(['facil', 'medio', 'dificil']).withMessage('Dificuldade inválida.'),
  query('priorizarNaoRespondidas').optional().isBoolean().withMessage('priorizarNaoRespondidas deve ser verdadeiro ou falso.'),
];

/* ================= ALTERNATIVAS ================= */

const alternativaCadastroRules = [
  body('idQuestao').isInt({ min: 1 }).withMessage('idQuestao é obrigatório e deve ser um número inteiro.'),
  body('letra').isIn(letrasValidas).withMessage('A letra deve ser A, B, C, D ou E.'),
  body('descricaoAlt').trim().notEmpty().withMessage('A descrição da alternativa é obrigatória.'),
  body('correta').isBoolean().withMessage('O campo correta deve ser verdadeiro ou falso.'),
];

const alternativaAtualizacaoRules = [
  param('id').isInt({ min: 1 }).withMessage('ID de alternativa inválido.'),
  body('letra').optional().isIn(letrasValidas).withMessage('A letra deve ser A, B, C, D ou E.'),
  body('descricaoAlt').optional().trim().notEmpty().withMessage('A descrição não pode ser vazia.'),
  body('correta').optional().isBoolean().withMessage('O campo correta deve ser verdadeiro ou falso.'),
];

/* ================= COMENTÁRIOS ================= */

const comentarioCadastroRules = [
  body('idQuestao').isInt({ min: 1 }).withMessage('idQuestao é obrigatório.'),
  body('texto')
    .trim()
    .notEmpty().withMessage('O comentário não pode ficar vazio.')
    .isLength({ max: 500 }).withMessage('O comentário deve ter no máximo 500 caracteres.'),
];

const listagemComentariosRules = [
  query('idQuestao').isInt({ min: 1 }).withMessage('idQuestao é obrigatório.'),
];

/* ================= DENÚNCIAS ================= */

const denunciaCadastroRules = [
  body('idQuestao').isInt({ min: 1 }).withMessage('idQuestao é obrigatório.'),
  body('motivo')
    .trim()
    .notEmpty().withMessage('Descreva o problema encontrado na questão.')
    .isLength({ max: 500 }).withMessage('O motivo deve ter no máximo 500 caracteres.'),
];

/* ================= ASSINATURAS ================= */

const assinaturaCadastroRules = [
  body('plano').isIn(['mensal', 'trimestral', 'semestral', 'anual']).withMessage('Plano inválido.'),
  body('emailPagador').trim().isEmail().withMessage('Informe um e-mail válido para a cobrança.'),
  body('metodoPagamento').isIn(['cartao', 'pix']).withMessage('Método de pagamento deve ser cartao ou pix.'),
];

const reembolsoRules = [
  param('id').isInt({ min: 1 }).withMessage('ID de assinatura inválido.'),
  body('motivo').optional().trim().isLength({ max: 500 }).withMessage('O motivo deve ter no máximo 500 caracteres.'),
];

module.exports = {
  validar,
  usuarioCadastroRules,
  usuarioAtualizacaoRules,
  trocaSenhaRules,
  loginRules,
  questaoCadastroRules,
  questaoAtualizacaoRules,
  listagemQuestoesRules,
  idParamRule,
  alternativaCadastroRules,
  alternativaAtualizacaoRules,
  comentarioCadastroRules,
  listagemComentariosRules,
  denunciaCadastroRules,
  assinaturaCadastroRules,
  reembolsoRules,
};
