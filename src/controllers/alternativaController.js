/**
 * Controller de Alternativa.
 * Permite manipular alternativas individualmente, respeitando
 * a regra de "apenas uma alternativa correta por questão".
 */

const alternativaModel = require('../models/alternativaModel');
const questaoModel = require('../models/questaoModel');
const { ok, created, notFound, fail, serverError } = require('../utils/response');

async function cadastrar(req, res) {
  try {
    const { idQuestao, letra, descricaoAlt, correta } = req.body;

    const questao = await questaoModel.buscarPorId(idQuestao);
    if (!questao) return notFound(res, 'Questão informada não existe.');

    if (correta) {
      const jaExisteCorreta = await alternativaModel.existeCorretaNaQuestao(idQuestao);
      if (jaExisteCorreta) {
        return fail(res, 'Esta questão já possui uma alternativa correta.', 409);
      }
    }

    const alternativa = await alternativaModel.criar({ idQuestao, letra, descricaoAlt, correta });
    return created(res, alternativa, 'Alternativa cadastrada com sucesso.');
  } catch (err) {
    if (err.number === 2627 || err.number === 2601) {
      return fail(res, 'Já existe uma alternativa com esta letra para esta questão.', 409);
    }
    return serverError(res, 'Erro ao cadastrar alternativa.');
  }
}

async function listarPorQuestao(req, res) {
  try {
    const alternativas = await alternativaModel.listarPorQuestao(req.params.idQuestao);
    return ok(res, alternativas, 'Alternativas listadas com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao listar alternativas.');
  }
}

async function buscarPorId(req, res) {
  try {
    const alternativa = await alternativaModel.buscarPorId(req.params.id);
    if (!alternativa) return notFound(res, 'Alternativa não encontrada.');
    return ok(res, alternativa, 'Alternativa encontrada.');
  } catch (err) {
    return serverError(res, 'Erro ao buscar alternativa.');
  }
}

async function atualizar(req, res) {
  try {
    const { id } = req.params;
    const existente = await alternativaModel.buscarPorId(id);
    if (!existente) return notFound(res, 'Alternativa não encontrada.');

    const { letra, descricaoAlt, correta } = req.body;

    if (correta === true) {
      const jaExisteCorreta = await alternativaModel.existeCorretaNaQuestao(existente.idQuestao, id);
      if (jaExisteCorreta) {
        return fail(res, 'Esta questão já possui outra alternativa marcada como correta.', 409);
      }
    }

    const atualizada = await alternativaModel.atualizar(id, { letra, descricaoAlt, correta });
    return ok(res, atualizada, 'Alternativa atualizada com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao atualizar alternativa.');
  }
}

async function excluir(req, res) {
  try {
    const { id } = req.params;
    const existente = await alternativaModel.buscarPorId(id);
    if (!existente) return notFound(res, 'Alternativa não encontrada.');

    const restantes = await alternativaModel.listarPorQuestao(existente.idQuestao);
    if (restantes.length <= 1) {
      return fail(res, 'Não é possível excluir a única alternativa da questão.', 409);
    }

    await alternativaModel.excluir(id);
    return ok(res, null, 'Alternativa excluída com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao excluir alternativa.');
  }
}

module.exports = { cadastrar, listarPorQuestao, buscarPorId, atualizar, excluir };
