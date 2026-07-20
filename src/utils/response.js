/**
 * Padroniza o formato das respostas HTTP da API,
 * garantindo consistência entre todos os endpoints.
 */

function ok(res, data, message = 'Operação realizada com sucesso.', status = 200) {
  return res.status(status).json({
    sucesso: true,
    mensagem: message,
    dados: data,
  });
}

function created(res, data, message = 'Recurso criado com sucesso.') {
  return ok(res, data, message, 201);
}

function noContent(res) {
  return res.status(204).send();
}

function fail(res, message = 'Não foi possível concluir a operação.', status = 400, erros = null) {
  const payload = {
    sucesso: false,
    mensagem: message,
  };
  if (erros) payload.erros = erros;
  return res.status(status).json(payload);
}

function notFound(res, message = 'Recurso não encontrado.') {
  return fail(res, message, 404);
}

function unauthorized(res, message = 'Não autorizado.') {
  return fail(res, message, 401);
}

function forbidden(res, message = 'Acesso negado.') {
  return fail(res, message, 403);
}

function serverError(res, message = 'Erro interno no servidor.') {
  return fail(res, message, 500);
}

module.exports = {
  ok,
  created,
  noContent,
  fail,
  notFound,
  unauthorized,
  forbidden,
  serverError,
};
