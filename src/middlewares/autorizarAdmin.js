/**
 * Middleware de autorização por papel (RBAC).
 * Deve ser usado SEMPRE depois de `autenticar` (precisa de req.usuario
 * já populado). Bloqueia com 403 quem não é admin — usado nas rotas
 * administrativas (CRUD de questões/temas/alternativas, listagem de
 * usuários), que não devem ficar acessíveis a qualquer aluno logado.
 */

const { forbidden } = require('../utils/response');

function autorizarAdmin(req, res, next) {
  if (req.usuario?.role !== 'admin') {
    return forbidden(res, 'Acesso restrito a administradores.');
  }
  next();
}

module.exports = autorizarAdmin;
