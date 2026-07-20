/**
 * Controller de Simulado.
 * Fluxo: gerar (sorteio de questões) -> responder/finalizar (correção
 * em lote) -> consultar histórico e resultado detalhado.
 */

const simuladoModel = require('../models/simuladoModel');
const { ok, created, notFound, fail, serverError } = require('../utils/response');

async function gerar(req, res) {
  try {
    const idUsuario = req.usuario.id;
    const { idTema, banca, dificuldade, quantidade } = req.body;

    const resultado = await simuladoModel.criar({
      idUsuario,
      idTema: idTema || null,
      banca: banca || null,
      dificuldade: dificuldade || null,
      quantidade,
    });

    if (resultado?.erro) return fail(res, resultado.erro, 400);

    return created(res, resultado, `Simulado gerado com ${resultado.questoes.length} questão(ões).`);
  } catch (err) {
    return serverError(res, 'Erro ao gerar simulado.');
  }
}

async function buscarPorId(req, res) {
  try {
    const simulado = await simuladoModel.buscarPorId(req.params.id, req.usuario.id);
    if (!simulado) return notFound(res, 'Simulado não encontrado.');
    return ok(res, simulado, 'Simulado encontrado.');
  } catch (err) {
    return serverError(res, 'Erro ao buscar simulado.');
  }
}

async function finalizar(req, res) {
  try {
    const { respostas } = req.body;
    const resultado = await simuladoModel.finalizar(req.params.id, req.usuario.id, respostas);

    if (resultado?.erro) return fail(res, resultado.erro, 400);

    return ok(res, resultado, 'Simulado finalizado com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao finalizar simulado.');
  }
}

async function listar(req, res) {
  try {
    const simulados = await simuladoModel.listarPorUsuario(req.usuario.id);
    return ok(res, simulados, 'Histórico de simulados obtido com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao listar simulados.');
  }
}

module.exports = { gerar, buscarPorId, finalizar, listar };
