/**
 * Middleware global de tratamento de erros.
 * Deve ser o ÚLTIMO middleware registrado em app.js.
 * Garante que nenhum erro não tratado derrube o processo
 * ou vaze detalhes sensíveis (stack trace) em produção.
 */

const { fail } = require('../utils/response');

// eslint-disable-next-line no-unused-vars
function errorHandler(err, req, res, next) {
  console.error('[errorHandler]', err);

  // Erros de negócio lançados propositalmente com { status, message }
  if (err.status) {
    return fail(res, err.message, err.status);
  }

  // Erro de sintaxe de JSON no corpo da requisição
  if (err.type === 'entity.parse.failed') {
    return fail(res, 'Corpo da requisição em formato JSON inválido.', 400);
  }

  const isDev = process.env.NODE_ENV !== 'production';
  return fail(
    res,
    isDev ? err.message : 'Erro interno no servidor.',
    500
  );
}

/**
 * Middleware para capturar rotas inexistentes (404).
 */
function rotaNaoEncontrada(req, res) {
  return fail(res, `Rota ${req.method} ${req.originalUrl} não encontrada.`, 404);
}

module.exports = { errorHandler, rotaNaoEncontrada };
