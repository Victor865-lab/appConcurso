/**
 * Controller de Ranking.
 * Suporta período geral, semanal (7 dias) e mensal (30 dias).
 */

const rankingModel = require('../models/rankingModel');
const { ok, serverError } = require('../utils/response');

const DIAS_POR_PERIODO = { semanal: 7, mensal: 30, geral: undefined };

async function listar(req, res) {
  try {
    const periodo = ['semanal', 'mensal', 'geral'].includes(req.query.periodo) ? req.query.periodo : 'geral';
    const dias = DIAS_POR_PERIODO[periodo];

    const [ranking, minhaPosicao] = await Promise.all([
      rankingModel.listar({ dias, limite: 50 }),
      rankingModel.posicaoUsuario(req.usuario.id, { dias }),
    ]);

    return ok(res, { periodo, ranking, minhaPosicao }, 'Ranking obtido com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao obter ranking.');
  }
}

module.exports = { listar };
