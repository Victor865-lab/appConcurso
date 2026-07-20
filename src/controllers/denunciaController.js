/**
 * Controller de Denúncia.
 * Permite ao usuário reportar um problema em uma questão
 * (ex: gabarito errado, enunciado com erro), na aba de mapeamento.
 */

const denunciaModel = require('../models/denunciaModel');
const questaoModel = require('../models/questaoModel');
const { created, notFound, serverError } = require('../utils/response');

async function criar(req, res) {
  try {
    const idUsuario = req.usuario.id;
    const { idQuestao, motivo } = req.body;

    const questao = await questaoModel.buscarPorId(idQuestao);
    if (!questao) return notFound(res, 'Questão não encontrada.');

    const denuncia = await denunciaModel.criar({ idQuestao, idUsuario, motivo });
    return created(res, denuncia, 'Denúncia enviada. Nossa equipe vai revisar essa questão.');
  } catch (err) {
    return serverError(res, 'Erro ao registrar denúncia.');
  }
}

module.exports = { criar };
