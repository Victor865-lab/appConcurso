/**
 * Controller de Progresso.
 * Agrega os dados exibidos na tela principal do painel do usuário:
 * pontuação/nível, gráfico de evolução, calendário de acessos (streak),
 * badges de gamificação e desempenho por tema.
 */

const respostaModel = require('../models/respostaModel');
const progressoModel = require('../models/progressoModel');
const gamificacaoService = require('../services/gamificacaoService');
const { ok, serverError } = require('../utils/response');

async function resumo(req, res) {
  try {
    const idUsuario = req.usuario.id;

    const [estatisticas, usuario] = await Promise.all([
      respostaModel.resumoUsuario(idUsuario),
      progressoModel.buscarUsuarioComStreak(idUsuario),
    ]);

    const nivel = gamificacaoService.calcularNivel(estatisticas.pontos);
    const badges = gamificacaoService.calcularBadges({
      totalRespondidas: estatisticas.totalRespondidas,
      totalAcertos: estatisticas.totalAcertos,
      streakRecorde: usuario?.streakRecorde || 0,
      pontos: estatisticas.pontos,
    });

    const taxaAcerto = estatisticas.totalRespondidas
      ? Math.round((estatisticas.totalAcertos / estatisticas.totalRespondidas) * 100)
      : 0;

    return ok(res, {
      ...estatisticas,
      taxaAcerto,
      nivel,
      streakAtual: usuario?.streakAtual || 0,
      streakRecorde: usuario?.streakRecorde || 0,
      badges,
    }, 'Resumo de progresso obtido com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao obter resumo de progresso.');
  }
}

async function graficoEvolucao(req, res) {
  try {
    const idUsuario = req.usuario.id;
    const dias = req.query.dias ? Number(req.query.dias) : 30;
    const dados = await respostaModel.respostasPorDia(idUsuario, dias);
    return ok(res, dados, 'Evolução obtida com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao obter gráfico de evolução.');
  }
}

async function calendario(req, res) {
  try {
    const idUsuario = req.usuario.id;
    const dias = req.query.dias ? Number(req.query.dias) : 365;
    const dados = await progressoModel.calendarioAcessos(idUsuario, dias);
    return ok(res, dados, 'Calendário de acessos obtido com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao obter calendário de acessos.');
  }
}

async function mapaPorTema(req, res) {
  try {
    const idUsuario = req.usuario.id;
    const dados = await respostaModel.desempenhoPorTema(idUsuario);
    return ok(res, dados, 'Desempenho por tema obtido com sucesso.');
  } catch (err) {
    return serverError(res, 'Erro ao obter desempenho por tema.');
  }
}

module.exports = { resumo, graficoEvolucao, calendario, mapaPorTema };
