/**
 * Controller de Autenticação.
 * Responsável por login, logout (stateless) e troca de senha.
 */

const bcrypt = require('bcrypt');
const usuarioModel = require('../models/usuarioModel');
const { gerarToken } = require('../services/jwtService');
const gamificacaoService = require('../services/gamificacaoService');
const { ok, unauthorized, notFound, serverError } = require('../utils/response');

const SALT_ROUNDS = 10;

async function login(req, res) {
  try {
    const { nome, senha } = req.body;

    const usuario = await usuarioModel.buscarPorNome(nome);
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
      usuario: { id: usuario.id, nome: usuario.nome, role: usuario.role },
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

module.exports = { login, logout, trocarSenha };
