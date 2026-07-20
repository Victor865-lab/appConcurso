/**
 * Middleware de autenticação.
 * Verifica se a requisição contém um Bearer Token válido
 * e injeta os dados do usuário autenticado em req.usuario.
 */

const { verificarToken } = require('../services/jwtService');
const { unauthorized } = require('../utils/response');
const usuarioModel = require('../models/usuarioModel');

function autenticar(req, res, next) {
  const authHeader = req.headers.authorization;

  if (!authHeader || !authHeader.startsWith('Bearer ')) {
    return unauthorized(res, 'Token não informado. Utilize o cabeçalho Authorization: Bearer <token>.');
  }

  const token = authHeader.split(' ')[1];

  try {
    const decoded = verificarToken(token);
    req.usuario = decoded;
    // Fire-and-forget: alimenta o indicador de "usuários online" do painel
    // administrativo sem atrasar a resposta da requisição atual.
    usuarioModel.registrarAtividade(decoded.id).catch(() => {});
    next();
  } catch (err) {
    if (err.name === 'TokenExpiredError') {
      return unauthorized(res, 'Sessão expirada. Faça login novamente.');
    }
    return unauthorized(res, 'Token inválido.');
  }
}

module.exports = autenticar;
