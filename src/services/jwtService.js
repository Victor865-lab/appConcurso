/**
 * Serviço centralizado de geração e verificação de tokens JWT.
 * Mantém a lógica de token isolada dos controllers/middlewares.
 */

const jwt = require('jsonwebtoken');
require('dotenv').config();

const SECRET = process.env.JWT_SECRET;
const EXPIRES_IN = process.env.JWT_EXPIRES_IN || '1h';

/**
 * Gera um token JWT contendo os dados essenciais do usuário.
 * Nunca inclui a senha (nem o hash) no payload.
 */
function gerarToken(usuario) {
  const payload = {
    id: usuario.id,
    nome: usuario.nome,
    role: usuario.role || 'aluno',
  };
  return jwt.sign(payload, SECRET, { expiresIn: EXPIRES_IN });
}

/**
 * Verifica e decodifica um token JWT.
 * Lança erro caso o token seja inválido ou tenha expirado.
 */
function verificarToken(token) {
  return jwt.verify(token, SECRET);
}

module.exports = {
  gerarToken,
  verificarToken,
};
