/**
 * Serviço de Gamificação.
 * Centraliza a lógica de streak (sequência de entradas no site)
 * e o cálculo de nível a partir da pontuação do usuário.
 */

const { sql, getPool } = require('../config/database');

const PONTOS_POR_ACERTO = 10;

/**
 * Registra o acesso do usuário no dia atual e recalcula o streak.
 * Deve ser chamado no momento do login.
 *
 * Regra do streak:
 * - Primeiro acesso do dia de hoje: incrementa contagem do dia.
 * - Se o último acesso foi ontem: streak += 1.
 * - Se o último acesso foi hoje: streak não muda.
 * - Se o último acesso foi antes de ontem (ou nunca houve): streak reinicia em 1.
 */
async function registrarAcesso(idUsuario) {
  const pool = await getPool();

  const usuarioResult = await pool
    .request()
    .input('id', sql.Int, idUsuario)
    .query(`SELECT streakAtual, streakRecorde, ultimoAcesso FROM usuarios WHERE id = @id;`);

  const usuario = usuarioResult.recordset[0];
  if (!usuario) return null;

  const hoje = new Date();
  const hojeStr = formatarData(hoje);
  const ultimoAcessoStr = usuario.ultimoAcesso ? formatarData(new Date(usuario.ultimoAcesso)) : null;

  let novoStreak = usuario.streakAtual;

  if (ultimoAcessoStr !== hojeStr) {
    if (ultimoAcessoStr === formatarData(diaAnterior(hoje))) {
      novoStreak = usuario.streakAtual + 1;
    } else {
      novoStreak = 1;
    }
  }

  const novoRecorde = Math.max(novoStreak, usuario.streakRecorde);

  await pool
    .request()
    .input('id', sql.Int, idUsuario)
    .input('streakAtual', sql.Int, novoStreak)
    .input('streakRecorde', sql.Int, novoRecorde)
    .input('hoje', sql.Date, hojeStr)
    .query(`
      UPDATE usuarios
      SET streakAtual = @streakAtual, streakRecorde = @streakRecorde, ultimoAcesso = @hoje
      WHERE id = @id;
    `);

  // Upsert do registro do dia (para o calendário de acessos)
  await pool
    .request()
    .input('idUsuario', sql.Int, idUsuario)
    .input('data', sql.Date, hojeStr)
    .query(`
      MERGE dbo.acessos_usuario AS destino
      USING (SELECT @idUsuario AS idUsuario, @data AS dataAcesso) AS origem
      ON destino.idUsuario = origem.idUsuario AND destino.dataAcesso = origem.dataAcesso
      WHEN MATCHED THEN
        UPDATE SET quantidade = destino.quantidade + 1
      WHEN NOT MATCHED THEN
        INSERT (idUsuario, dataAcesso, quantidade) VALUES (origem.idUsuario, origem.dataAcesso, 1);
    `);

  return { streakAtual: novoStreak, streakRecorde: novoRecorde };
}

/**
 * Calcula o nível do usuário a partir da pontuação total.
 * Fórmula simples: 100 pontos por nível, com nomes temáticos.
 */
const NOMES_NIVEL = [
  'Aspirante', 'Iniciante', 'Dedicado', 'Estrategista', 'Concentrado',
  'Avançado', 'Especialista', 'Mestre', 'Referência', 'Lenda dos Concursos',
];

function calcularNivel(pontos) {
  const nivel = Math.min(Math.floor(pontos / 100) + 1, NOMES_NIVEL.length);
  const pontosParaProximo = nivel < NOMES_NIVEL.length ? (nivel) * 100 - pontos : 0;
  return {
    nivel,
    nome: NOMES_NIVEL[nivel - 1],
    pontosAtuais: pontos,
    pontosParaProximoNivel: Math.max(pontosParaProximo, 0),
    proximoNivelNome: nivel < NOMES_NIVEL.length ? NOMES_NIVEL[nivel] : null,
  };
}

/**
 * Retorna a lista de badges (conquistas), indicando quais já
 * foram desbloqueadas com base nas estatísticas do usuário.
 */
function calcularBadges({ totalRespondidas, totalAcertos, streakRecorde, pontos }) {
  const definicoes = [
    { id: 'primeira_resposta', nome: 'Primeiro Passo', descricao: 'Responda sua primeira questão.', icone: 'bi-flag', criterio: () => totalRespondidas >= 1 },
    { id: 'cem_questoes', nome: 'Maratonista', descricao: 'Responda 100 questões.', icone: 'bi-trophy', criterio: () => totalRespondidas >= 100 },
    { id: 'quinhentas_questoes', nome: 'Incansável', descricao: 'Responda 500 questões.', icone: 'bi-award', criterio: () => totalRespondidas >= 500 },
    { id: 'streak_3', nome: 'Constância', descricao: 'Sequência de 3 dias seguidos.', icone: 'bi-fire', criterio: () => streakRecorde >= 3 },
    { id: 'streak_7', nome: 'Disciplina', descricao: 'Sequência de 7 dias seguidos.', icone: 'bi-fire', criterio: () => streakRecorde >= 7 },
    { id: 'streak_30', nome: 'Ferro na Rotina', descricao: 'Sequência de 30 dias seguidos.', icone: 'bi-fire', criterio: () => streakRecorde >= 30 },
    { id: 'cem_acertos', nome: 'Afiado', descricao: '100 respostas corretas.', icone: 'bi-bullseye', criterio: () => totalAcertos >= 100 },
    { id: 'mil_pontos', nome: 'Mil Pontos', descricao: 'Alcance 1000 pontos.', icone: 'bi-gem', criterio: () => pontos >= 1000 },
  ];

  return definicoes.map((b) => ({
    id: b.id,
    nome: b.nome,
    descricao: b.descricao,
    icone: b.icone,
    desbloqueada: b.criterio(),
  }));
}

function formatarData(data) {
  return data.toISOString().slice(0, 10);
}

function diaAnterior(data) {
  const d = new Date(data);
  d.setDate(d.getDate() - 1);
  return d;
}

module.exports = {
  PONTOS_POR_ACERTO,
  registrarAcesso,
  calcularNivel,
  calcularBadges,
};
