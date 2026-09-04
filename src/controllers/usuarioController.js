/**
 * Controller de Usuário.
 * Orquestra validação de regras de negócio e delega o acesso
 * a dados para o usuarioModel.
 */

const bcrypt = require('bcrypt');
const usuarioModel = require('../models/usuarioModel');
const { ok, created, notFound, fail, forbidden, serverError } = require('../utils/response');

function podeAcessar(req, idAlvo) {
  return req.usuario.role === 'admin' || req.usuario.id === Number(idAlvo);
}

const SALT_ROUNDS = 10;

async function cadastrar(req, res) {
  try {
    const { nome, email, senha } = req.body;

    const existenteNome = await usuarioModel.buscarPorNome(nome);
    if (existenteNome) {
      return fail(res, 'Já existe um usuário cadastrado com este nome.', 409);
    }
    const existenteEmail = await usuarioModel.buscarPorEmail(email);
    if (existenteEmail) {
      return fail(res, 'Já existe um usuário cadastrado com este e-mail.', 409);
    }

    const senhaHash = await bcrypt.hash(senha, SALT_ROUNDS);
    const usuario = await usuarioModel.criar({ nome, email, senhaHash });

    return created(res, usuario, 'Usuário cadastrado com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao cadastrar usuário.');
  }
}

async function listar(req, res) {
  try {
    const usuarios = await usuarioModel.listarTodos();
    return ok(res, usuarios, 'Usuários listados com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao listar usuários.');
  }
}

async function buscarPorId(req, res) {
  try {
    if (!podeAcessar(req, req.params.id)) return forbidden(res, 'Você só pode acessar os próprios dados.');

    const usuario = await usuarioModel.buscarPorId(req.params.id);
    if (!usuario) return notFound(res, 'Usuário não encontrado.');
    return ok(res, usuario, 'Usuário encontrado.');
  } catch (err) {
    return serverError(res, 'Erro ao buscar usuário.');
  }
}

async function atualizar(req, res) {
  try {
    const { id } = req.params;
    if (!podeAcessar(req, id)) return forbidden(res, 'Você só pode editar os próprios dados.');

    const { nome } = req.body;

    const existente = await usuarioModel.buscarPorId(id);
    if (!existente) return notFound(res, 'Usuário não encontrado.');

    if (nome && nome !== existente.nome) {
      const nomeEmUso = await usuarioModel.buscarPorNome(nome);
      if (nomeEmUso) {
        return fail(res, 'Já existe um usuário cadastrado com este nome.', 409);
      }
    }

    const usuarioAtualizado = await usuarioModel.atualizar(id, { nome: nome || existente.nome });
    return ok(res, usuarioAtualizado, 'Usuário atualizado com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao atualizar usuário.');
  }
}

const STATUS_ACESSO_VALIDOS = ['padrao', 'bloqueado', 'premium'];

/**
 * Exclusivo de admin: define o status de acesso de um usuário específico
 * ("bloqueado" força exigência de assinatura para ele mesmo com o
 * sistema liberado globalmente; "premium" libera o acesso dele mesmo
 * sem assinatura paga). Ver middlewares/verificarAssinatura.js.
 */
async function atualizarAcesso(req, res) {
  try {
    const { id } = req.params;
    const { statusAcesso } = req.body;

    if (!STATUS_ACESSO_VALIDOS.includes(statusAcesso)) {
      return fail(res, 'statusAcesso deve ser "padrao", "bloqueado" ou "premium".', 422);
    }

    const existente = await usuarioModel.buscarPorId(id);
    if (!existente) return notFound(res, 'Usuário não encontrado.');

    const atualizado = await usuarioModel.atualizarStatusAcesso(id, statusAcesso);
    return ok(res, atualizado, 'Status de acesso atualizado com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao atualizar status de acesso.');
  }
}

async function excluir(req, res) {
  try {
    const { id } = req.params;
    if (!podeAcessar(req, id)) return forbidden(res, 'Você só pode excluir a própria conta.');

    const existente = await usuarioModel.buscarPorId(id);
    if (!existente) return notFound(res, 'Usuário não encontrado.');

    await usuarioModel.excluir(id);
    return ok(res, null, 'Usuário excluído com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao excluir usuário.');
  }
}

module.exports = { cadastrar, listar, buscarPorId, atualizar, atualizarAcesso, excluir };
