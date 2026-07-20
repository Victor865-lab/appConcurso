/**
 * Middleware que bloqueia o acesso a rotas do painel do usuário para
 * quem não tem assinatura ativa. Liga/desliga via variável de ambiente
 * EXIGIR_ASSINATURA — deixe "false" (ou omita) em ambiente de teste
 * para liberar o acesso sem precisar remover o middleware das rotas.
 */

const assinaturaModel = require('../models/assinaturaModel');
const { forbidden, serverError } = require('../utils/response');

async function verificarAssinaturaAtiva(req, res, next) {
  if (process.env.EXIGIR_ASSINATURA !== 'true') return next();

  try {
    const assinatura = await assinaturaModel.buscarMaisRecentePorUsuario(req.usuario.id);
    const ativa = !!assinatura
      && assinatura.status === 'autorizada'
      && (!assinatura.dataFim || new Date(assinatura.dataFim) >= new Date());

    if (!ativa) {
      return forbidden(res, 'Assine um plano para acessar este recurso.');
    }
    next();
  } catch (err) {
    return serverError(res, 'Erro ao verificar assinatura.');
  }
}

module.exports = verificarAssinaturaAtiva;
