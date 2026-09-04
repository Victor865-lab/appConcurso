/**
 * Controller de Reclamação.
 * Formulário de contato do painel do usuário ("Reclame Aqui") — não fica
 * salvo em tabela própria, é enviado direto por e-mail para a mesma
 * caixa usada para autenticação (GMAIL_USER), com replyTo do usuário
 * para o admin poder responder diretamente pelo próprio Gmail.
 */

const usuarioModel = require('../models/usuarioModel');
const { enviarReclamacao } = require('../services/emailService');
const { ok, notFound, serverError } = require('../utils/response');

async function enviar(req, res) {
  try {
    const idUsuario = req.usuario.id;
    const { mensagem } = req.body;

    const usuario = await usuarioModel.buscarPorId(idUsuario);
    if (!usuario) return notFound(res, 'Usuário não encontrado.');

    await enviarReclamacao({
      idUsuario: usuario.id,
      nomeUsuario: usuario.nome,
      emailUsuario: usuario.email,
      mensagem,
    });

    return ok(res, null, 'Reclamação enviada com sucesso. Nossa equipe vai analisar em breve.');
  } catch (err) {
    console.error('[reclamacaoController] Falha ao enviar reclamação:', err.message);
    return serverError(res, 'Não foi possível enviar sua reclamação agora. Tente novamente mais tarde.');
  }
}

module.exports = { enviar };
