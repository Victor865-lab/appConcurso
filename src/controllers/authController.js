/**
 * Controller de Autenticação.
 * Responsável por login, logout (stateless) e troca de senha.
 */

const bcrypt = require('bcrypt');
const crypto = require('crypto');
const usuarioModel = require('../models/usuarioModel');
const redefinicaoSenhaModel = require('../models/redefinicaoSenhaModel');
const { gerarToken } = require('../services/jwtService');
const gamificacaoService = require('../services/gamificacaoService');
const { enviarEmailRedefinicaoSenha } = require('../services/emailService');
const { ok, unauthorized, notFound, serverError } = require('../utils/response');

const SALT_ROUNDS = 10;
const VALIDADE_TOKEN_MS = 60 * 60 * 1000; // 1 hora

async function login(req, res) {
  try {
    const { nome, senha } = req.body;

    // "nome" aqui é o identificador de login — aceita tanto o nome de
    // usuário (contas antigas) quanto o e-mail (contas novas).
    const usuario = await usuarioModel.buscarPorNomeOuEmail(nome);
    if (!usuario) {
      return unauthorized(res, 'Usuário ou senha inválidos.');
    }

    const senhaValida = await bcrypt.compare(senha, usuario.senhaHash);
    if (!senhaValida) {
      return unauthorized(res, 'Usuário ou senha inválidos.');
    }

    const token = gerarToken(usuario);

    const streak = await gamificacaoService.registrarAcesso(usuario.id).catch(() => null);

    return ok(res, {
      token,
      usuario: { id: usuario.id, nome: usuario.nome, email: usuario.email, role: usuario.role },
      streak,
    }, 'Login realizado com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao realizar login.');
  }
}

/**
 * Logout no modelo stateless (JWT) apenas orienta o cliente
 * a descartar o token. Não há blacklist de token nesta versão.
 */
async function logout(req, res) {
  return ok(res, null, 'Logout realizado. Descarte o token no cliente.');
}

async function trocarSenha(req, res) {
  try {
    const idUsuario = req.usuario.id;
    const { senhaAtual, novaSenha } = req.body;

    const usuarioCompleto = await usuarioModel.buscarPorNome(req.usuario.nome);
    if (!usuarioCompleto) {
      return notFound(res, 'Usuário não encontrado.');
    }

    const senhaValida = await bcrypt.compare(senhaAtual, usuarioCompleto.senhaHash);
    if (!senhaValida) {
      return unauthorized(res, 'Senha atual incorreta.');
    }

    const novoHash = await bcrypt.hash(novaSenha, SALT_ROUNDS);
    await usuarioModel.atualizarSenha(idUsuario, novoHash);

    return ok(res, null, 'Senha alterada com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao trocar a senha.');
  }
}

/**
 * Solicita a redefinição de senha. Por segurança, a resposta é sempre a
 * mesma genérica, independentemente de o e-mail existir ou não na base
 * (evita que alguém descubra quais e-mails estão cadastrados). O e-mail
 * só é efetivamente enviado se a conta existir e tiver um e-mail salvo.
 */
async function solicitarRedefinicaoSenha(req, res) {
  const MENSAGEM_GENERICA = 'Se esse e-mail estiver cadastrado, você receberá um link para redefinir sua senha.';
  try {
    const { email } = req.body;

    const usuario = await usuarioModel.buscarPorEmail(email);
    if (usuario) {
      const token = crypto.randomBytes(32).toString('hex');
      const expiraEm = new Date(Date.now() + VALIDADE_TOKEN_MS);
      await redefinicaoSenhaModel.criar({ idUsuario: usuario.id, token, expiraEm });

      const baseUrl = process.env.APP_BASE_URL || 'http://localhost:3000';
      const link = `${baseUrl}/app/redefinir-senha.html?token=${token}`;

      // Não deixa uma falha no envio de e-mail vazar detalhes nem
      // travar a resposta — o usuário sempre vê a mensagem genérica.
      await enviarEmailRedefinicaoSenha(usuario.email, link).catch((err) => {
        console.error('[emailService] Falha ao enviar e-mail de redefinição:', err.message);
      });
    }

    return ok(res, null, MENSAGEM_GENERICA);
  } catch (err) {
    console.error('[authController] Erro ao solicitar redefinição de senha:', err.message);
    return ok(res, null, MENSAGEM_GENERICA);
  }
}

/**
 * Confirma a redefinição de senha a partir do token recebido por e-mail.
 */
async function redefinirSenha(req, res) {
  try {
    const { token, novaSenha } = req.body;

    const registro = await redefinicaoSenhaModel.buscarTokenValido(token);
    if (!registro) {
      return unauthorized(res, 'Link inválido ou expirado. Solicite uma nova redefinição de senha.');
    }

    const novoHash = await bcrypt.hash(novaSenha, SALT_ROUNDS);
    await usuarioModel.atualizarSenha(registro.idUsuario, novoHash);
    await redefinicaoSenhaModel.marcarComoUsado(registro.id);

    return ok(res, null, 'Senha redefinida com sucesso. Você já pode entrar com a nova senha.');
  } catch (err) {
    return serverError(res, 'Erro ao redefinir a senha.');
  }
}

module.exports = { login, logout, trocarSenha, solicitarRedefinicaoSenha, redefinirSenha };
