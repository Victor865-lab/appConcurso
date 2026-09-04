/**
 * Middleware que bloqueia o acesso a rotas do painel do usuário para
 * quem não tem assinatura ativa.
 *
 * Dois níveis de controle:
 *  - Global: EXIGIR_ASSINATURA (env) — liga/desliga a exigência para
 *    todo mundo de uma vez. Deixe "false" em ambiente de teste.
 *  - Individual: usuarios.statusAcesso, definido pelo admin por usuário
 *    (ver autorizarAdmin/usuarioController.atualizarAcesso):
 *      - "bloqueado" força a exigência de assinatura ativa PARA ESTE
 *        usuário, mesmo com EXIGIR_ASSINATURA=false globalmente.
 *      - "premium" libera o acesso deste usuário sem exigir assinatura,
 *        mesmo com EXIGIR_ASSINATURA=true globalmente.
 *      - "padrao" (default) segue a regra global normalmente.
 *
 * Busca o status direto no banco (não confia no JWT) para que uma
 * mudança feita pelo admin tenha efeito imediato, sem esperar o usuário
 * deslogar e logar de novo.
 */

const usuarioModel = require('../models/usuarioModel');
const assinaturaModel = require('../models/assinaturaModel');
const { forbidden, serverError, notFound } = require('../utils/response');

async function verificarAssinaturaAtiva(req, res, next) {
  try {
    const usuario = await usuarioModel.buscarPorId(req.usuario.id);
    if (!usuario) return notFound(res, 'Usuário não encontrado.');

    if (usuario.statusAcesso === 'premium') return next();

    const exigirParaEsteUsuario = usuario.statusAcesso === 'bloqueado' || process.env.EXIGIR_ASSINATURA === 'true';
    if (!exigirParaEsteUsuario) return next();

    const assinatura = await assinaturaModel.buscarMaisRecentePorUsuario(req.usuario.id);
    const ativa = !!assinatura
      && assinatura.status === 'autorizada'
      && (!assinatura.dataFim || new Date(assinatura.dataFim) >= new Date());

    if (!ativa) {
      // codigo distinto do texto da mensagem para o front-end conseguir
      // detectar esse caso específico (e mostrar o "cadeado" com CTA pra
      // assinatura) sem depender de casar a string em português.
      return forbidden(res, 'Assine um plano para acessar este recurso.', 'ASSINATURA_NECESSARIA');
    }
    next();
  } catch (err) {
    return serverError(res, 'Erro ao verificar assinatura.');
  }
}

module.exports = verificarAssinaturaAtiva;
