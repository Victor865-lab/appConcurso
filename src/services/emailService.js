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
        pass: process.env.GMAIL_APP_PASSWORD,
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

module.exports = { enviarEmailRedefinicaoSenha };
