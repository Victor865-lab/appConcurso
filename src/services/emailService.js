/**
 * Serviço de envio de e-mail via Gmail SMTP (nodemailer).
 * Usado hoje apenas pelo fluxo de "esqueci minha senha".
 */

const nodemailer = require('nodemailer');

let transporter = null;

function getTransporter() {
  if (!transporter) {
    if (!process.env.GMAIL_USER || !process.env.GMAIL_APP_PASSWORD) {
      throw new Error('Envio de e-mail não configurado (GMAIL_USER/GMAIL_APP_PASSWORD ausentes no .env).');
    }
    transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: process.env.GMAIL_USER,
        // Senha de app do Google costuma ser copiada com espaços (formato de
        // exibição "xxxx xxxx xxxx xxxx"), mas a autenticação SMTP exige a
        // string sem espaços — removê-los aqui evita falha de credencial.
        pass: process.env.GMAIL_APP_PASSWORD.replace(/\s+/g, ''),
      },
    });
  }
  return transporter;
}

async function enviarEmailRedefinicaoSenha(destinatario, link) {
  await getTransporter().sendMail({
    from: `"Acerta AI" <${process.env.GMAIL_USER}>`,
    to: destinatario,
    subject: 'Redefinição de senha — Acerta AI',
    html: `
      <div style="font-family: sans-serif; max-width: 480px; margin: 0 auto; color: #172026;">
        <h2 style="color: #0F766E;">Redefinir sua senha</h2>
        <p>Recebemos uma solicitação para redefinir a senha da sua conta na Acerta AI.</p>
        <p>Clique no botão abaixo para criar uma nova senha. Este link é válido por <strong>1 hora</strong>.</p>
        <p style="margin: 24px 0;">
          <a href="${link}" style="background: #0D9488; color: #fff; padding: 12px 24px; border-radius: 8px; text-decoration: none; font-weight: bold; display: inline-block;">
            Criar nova senha
          </a>
        </p>
        <p style="font-size: 0.85rem; color: #64748B;">
          Se você não solicitou essa redefinição, pode ignorar este e-mail com segurança —
          sua senha atual continua válida.
        </p>
      </div>
    `,
  });
}

/**
 * Envia uma reclamação/feedback do painel do usuário para a mesma caixa
 * de e-mail usada para autenticação (GMAIL_USER) — o admin recebe direto
 * no Gmail. `replyTo` fica com o e-mail do próprio usuário (quando ele
 * tiver um cadastrado) para o admin poder responder diretamente.
 */
async function enviarReclamacao({ idUsuario, nomeUsuario, emailUsuario, mensagem }) {
  // Remove quebras de linha do nome/e-mail antes de usá-los em cabeçalhos
  // do e-mail (from/replyTo) — evita injeção de cabeçalho SMTP a partir
  // de dado que, em teoria, o próprio usuário poderia ter cadastrado.
  const nomeSeguro = String(nomeUsuario || 'Usuário').replace(/[\r\n]+/g, ' ').trim();
  const emailSeguro = emailUsuario ? String(emailUsuario).replace(/[\r\n]+/g, ' ').trim() : null;

  await getTransporter().sendMail({
    from: `"Acerta AI — Reclamações" <${process.env.GMAIL_USER}>`,
    to: process.env.GMAIL_USER,
    replyTo: emailSeguro || undefined,
    subject: `Nova reclamação de ${nomeSeguro} (#${idUsuario})`,
    html: `
      <div style="font-family: sans-serif; max-width: 480px; margin: 0 auto; color: #172026;">
        <h2 style="color: #0F766E;">Nova reclamação recebida</h2>
        <p><strong>Usuário:</strong> ${escapeHtml(nomeSeguro)} (ID #${idUsuario})</p>
        <p><strong>E-mail para contato:</strong> ${emailSeguro ? escapeHtml(emailSeguro) : 'não cadastrado'}</p>
        <p style="white-space: pre-wrap; background: #F1F5F9; padding: 12px 16px; border-radius: 8px;">${escapeHtml(mensagem)}</p>
      </div>
    `,
  });
}

function escapeHtml(texto) {
  return String(texto)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;');
}

module.exports = { enviarEmailRedefinicaoSenha, enviarReclamacao };
