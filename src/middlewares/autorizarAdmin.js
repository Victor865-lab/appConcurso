/**
 * Middleware de autorização por papel (RBAC).
 * Deve ser usado SEMPRE depois de `autenticar` (precisa de req.usuario
 * já populado). Bloqueia com 403 quem não é admin — usado nas rotas
 * administrativas (CRUD de questões/temas/alternativas, listagem de
 * usuários), que não devem ficar acessíveis a qualquer aluno logado.
 *
 * Segunda camada de proteção: além de exigir role='admin', exige que o
 * id do usuário bata com ADMIN_USER_ID no .env. Isso significa que,
 * mesmo que a coluna `role` de outra conta seja alterada pra 'admin'
 * (bug, erro manual, acesso indevido ao banco), essa conta ainda não
 * consegue passar por aqui — só o id explicitamente configurado pode.
 * Para adicionar um segundo admin de confiança no futuro, basta colocar
 * os dois ids separados por vírgula em ADMIN_USER_ID.
 */

const { forbidden } = require('../utils/response');

function idsPermitidos() {
  return (process.env.ADMIN_USER_ID || '')
    .split(',')
    .map((v) => Number(v.trim()))
    .filter((v) => Number.isInteger(v) && v > 0);
}

function autorizarAdmin(req, res, next) {
  if (req.usuario?.role !== 'admin') {
    return forbidden(res, 'Acesso restrito a administradores.');
  }

  const permitidos = idsPermitidos();
  if (permitidos.length > 0 && !permitidos.includes(req.usuario.id)) {
    return forbidden(res, 'Acesso restrito a administradores.');
  }

  next();
}

module.exports = autorizarAdmin;
