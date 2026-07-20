/**
 * Controller de Resposta.
 * Permite ao usuário responder uma questão fora do contexto de
 * um simulado (usado na aba de mapeamento de questões).
 */

const respostaModel = require('../models/respostaModel');
const questaoModel = require('../models/questaoModel');
const gamificacaoService = require('../services/gamificacaoService');
const { ok, fail, notFound, serverError } = require('../utils/response');

async function responder(req, res) {
  try {
    const idUsuario = req.usuario.id;
    const { idQuestao, idAlternativa } = req.body;

    const questao = await questaoModel.buscarPorId(idQuestao);
    if (!questao) return notFound(res, 'Questão não encontrada.');

    const resultado = await respostaModel.registrar({ idUsuario, idQuestao, idAlternativa });
    if (!resultado) {
      return fail(res, 'A alternativa informada não pertence a esta questão.', 400);
    }

    const alternativaCorreta = questao.alternativas.find((a) => a.correta);

    return ok(res, {
      correta: resultado.correta,
      pontosGanhos: resultado.correta ? gamificacaoService.PONTOS_POR_ACERTO : 0,
      idAlternativaCorreta: alternativaCorreta?.id,
    }, resultado.correta ? 'Resposta correta!' : 'Resposta incorreta.');
  } catch (err) {
    return serverError(res, 'Erro ao registrar resposta.');
  }
}

/**
 * Retorna, em lote, se o usuário já respondeu cada uma das questões
 * informadas (e se acertou), usado nos cards da aba de mapeamento.
 * Ex: GET /respostas/status?ids=1,2,3
 */
async function status(req, res) {
  try {
    const idUsuario = req.usuario.id;
    const ids = (req.query.ids || '')
      .split(',')
      .map((v) => Number(v.trim()))
      .filter((v) => Number.isInteger(v) && v > 0);

    const mapa = await respostaModel.statusPorQuestoes(idUsuario, ids);
    return ok(res, mapa, 'Status obtido com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao obter status das respostas.');
  }
}

module.exports = { responder, status };
