/**
 * Controller de Comentário.
 * Lista e cria comentários de usuários em uma questão específica,
 * usado na aba de mapeamento para interação entre alunos.
 */

const comentarioModel = require('../models/comentarioModel');
const questaoModel = require('../models/questaoModel');
const { ok, created, notFound, serverError } = require('../utils/response');

async function listar(req, res) {
  try {
    const idQuestao = Number(req.query.idQuestao);
    const comentarios = await comentarioModel.listarPorQuestao(idQuestao);
    return ok(res, comentarios, 'Comentários obtidos com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao obter comentários.');
  }
}

async function criar(req, res) {
  try {
    const idUsuario = req.usuario.id;
    const { idQuestao, texto } = req.body;

    const questao = await questaoModel.buscarPorId(idQuestao);
    if (!questao) return notFound(res, 'Questão não encontrada.');

    const comentario = await comentarioModel.criar({ idQuestao, idUsuario, texto });
    return created(res, {
      id: comentario.id,
      texto,
      criadoEm: comentario.criadoEm,
      idUsuario,
      usuarioNome: req.usuario.nome,
    }, 'Comentário publicado com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao publicar comentário.');
  }
}

module.exports = { listar, criar };
