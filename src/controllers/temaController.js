/**
 * Controller de Tema.
 */

const temaModel = require('../models/temaModel');
const { ok, created, fail, notFound, serverError } = require('../utils/response');

async function cadastrar(req, res) {
  try {
    const { nome } = req.body;
    const existente = await temaModel.buscarPorNome(nome);
    if (existente) return fail(res, 'Já existe um tema com este nome.', 409);

    const tema = await temaModel.criar(nome);
    return created(res, tema, 'Tema cadastrado com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao cadastrar tema.');
  }
}

async function listar(req, res) {
  try {
    const temas = await temaModel.listarTodos();
    return ok(res, temas, 'Temas listados com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao listar temas.');
  }
}

async function excluir(req, res) {
  try {
    const { id } = req.params;
    const existente = await temaModel.buscarPorId(id);
    if (!existente) return notFound(res, 'Tema não encontrado.');

    await temaModel.excluir(id);
    return ok(res, null, 'Tema excluído com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao excluir tema. Verifique se não há questões vinculadas.');
  }
}

module.exports = { cadastrar, listar, excluir };
