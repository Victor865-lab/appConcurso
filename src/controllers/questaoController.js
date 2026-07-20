/**
 * Controller de Questão.
 * Contém as regras de negócio de cadastro/edição (transacional
 * com alternativas), filtros de listagem e ações de status.
 */

const questaoModel = require('../models/questaoModel');
const { ok, created, notFound, serverError } = require('../utils/response');

async function cadastrar(req, res) {
  try {
    const { referencia, descricao, ativo, idTema, banca, ano, dificuldade, alternativas } = req.body;
    const questao = await questaoModel.criarComAlternativas({
      referencia, descricao, ativo, idTema, banca, ano, dificuldade, alternativas,
    });
    return created(res, questao, 'Questão cadastrada com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao cadastrar questão. Nenhuma alteração foi salva.');
  }
}

async function atualizar(req, res) {
  try {
    const { id } = req.params;
    const existente = await questaoModel.buscarPorId(id);
    if (!existente) return notFound(res, 'Questão não encontrada.');

    const { referencia, descricao, ativo, idTema, banca, ano, dificuldade, alternativas } = req.body;
    const questao = await questaoModel.atualizarComAlternativas(id, {
      referencia: referencia !== undefined ? referencia : existente.referencia,
      descricao: descricao !== undefined ? descricao : existente.descricao,
      ativo: ativo !== undefined ? ativo : existente.ativo,
      idTema: idTema !== undefined ? idTema : existente.idTema,
      banca: banca !== undefined ? banca : existente.banca,
      ano: ano !== undefined ? ano : existente.ano,
      dificuldade: dificuldade !== undefined ? dificuldade : existente.dificuldade,
      alternativas,
    });

    return ok(res, questao, 'Questão atualizada com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao atualizar questão. Nenhuma alteração foi salva.');
  }
}

async function buscarPorId(req, res) {
  try {
    const questao = await questaoModel.buscarPorId(req.params.id);
    if (!questao) return notFound(res, 'Questão não encontrada.');
    return ok(res, questao, 'Questão encontrada.');
  } catch (err) {
    return serverError(res, 'Erro ao buscar questão.');
  }
}

/**
 * Listagem única e flexível: aceita query params para filtrar por
 * ativo, respondida, referência, palavra-chave, além de paginação e ordenação.
 * Ex: GET /questoes?ativo=true&respondida=false&pagina=2&limite=20
 */
async function listar(req, res) {
  try {
    const { pagina, limite, ativo, respondida, referencia, palavraChave, idTema, banca, ano, dificuldade, ordenarPor, direcao } = req.query;

    const resultado = await questaoModel.listar({
      pagina: pagina ? Number(pagina) : 1,
      limite: limite ? Number(limite) : 10,
      ativo: ativo !== undefined ? ativo === 'true' : undefined,
      respondida: respondida !== undefined ? respondida === 'true' : undefined,
      referencia,
      palavraChave,
      idTema: idTema ? Number(idTema) : undefined,
      banca,
      ano: ano ? Number(ano) : undefined,
      dificuldade,
      ordenarPor,
      direcao,
    });

    return ok(res, resultado, 'Questões listadas com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao listar questões.');
  }
}

async function valoresFiltro(req, res) {
  try {
    const valores = await questaoModel.listarValoresFiltro();
    return ok(res, valores, 'Valores de filtro obtidos com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao obter valores de filtro.');
  }
}

async function excluir(req, res) {
  try {
    const { id } = req.params;
    const existente = await questaoModel.buscarPorId(id);
    if (!existente) return notFound(res, 'Questão não encontrada.');

    await questaoModel.excluir(id); // alternativas removidas via ON DELETE CASCADE
    return ok(res, null, 'Questão excluída com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao excluir questão.');
  }
}

async function ativar(req, res) {
  return alterarStatus(req, res, 'ativo', true, 'Questão ativada com sucesso.');
}

async function desativar(req, res) {
  return alterarStatus(req, res, 'ativo', false, 'Questão desativada com sucesso.');
}

async function marcarRespondida(req, res) {
  return alterarStatus(req, res, 'respondida', true, 'Questão marcada como respondida.');
}

async function desmarcarRespondida(req, res) {
  return alterarStatus(req, res, 'respondida', false, 'Questão desmarcada como respondida.');
}

async function alterarStatus(req, res, campo, valor, mensagem) {
  try {
    const { id } = req.params;
    const existente = await questaoModel.buscarPorId(id);
    if (!existente) return notFound(res, 'Questão não encontrada.');

    const atualizado = await questaoModel.atualizarStatus(id, campo, valor);
    return ok(res, atualizado, mensagem);
  } catch (err) {
    return serverError(res, 'Erro ao atualizar status da questão.');
  }
}

async function dashboard(req, res) {
  try {
    const usuarioModel = require('../models/usuarioModel');
    const [estatisticasQuestoes, usuarios] = await Promise.all([
      questaoModel.contarPorStatus(),
      usuarioModel.listarTodos(),
    ]);

    return ok(res, {
      questoes: estatisticasQuestoes,
      totalUsuarios: usuarios.length,
    }, 'Dados do dashboard obtidos com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao obter dados do dashboard.');
  }
}

module.exports = {
  cadastrar,
  atualizar,
  buscarPorId,
  listar,
  valoresFiltro,
  excluir,
  ativar,
  desativar,
  marcarRespondida,
  desmarcarRespondida,
  dashboard,
};
