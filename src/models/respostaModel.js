/**
 * Model de Resposta do Usuário.
 * Registra cada resposta dada (avulsa ou dentro de um simulado) e
 * fornece as agregações usadas em progresso, ranking e mapeamento.
 */

const { sql, getPool } = require('../config/database');

/**
 * Registra a resposta de um usuário a uma questão.
 * A alternativa correta é sempre conferida no servidor (nunca confia no cliente).
 */
async function registrar({ idUsuario, idQuestao, idAlternativa, idSimulado = null }) {
  const pool = await getPool();

  const altResult = await pool
    .request()
    .input('id', sql.Int, idAlternativa)
    .input('idQuestao', sql.Int, idQuestao)
    .query(`
      SELECT id, correta FROM alternativas WHERE id = @id AND idQuestao = @idQuestao;
    `);

  const alternativa = altResult.recordset[0];
  if (!alternativa) return null; // alternativa não pertence à questão informada

  const correta = !!alternativa.correta;

  await pool
    .request()
    .input('idUsuario', sql.Int, idUsuario)
    .input('idQuestao', sql.Int, idQuestao)
    .input('idAlternativa', sql.Int, idAlternativa)
    .input('correta', sql.Bit, correta)
    .input('idSimulado', sql.Int, idSimulado)
    .query(`
      INSERT INTO respostas_usuario (idUsuario, idQuestao, idAlternativa, correta, idSimulado)
      VALUES (@idUsuario, @idQuestao, @idAlternativa, @correta, @idSimulado);
    `);

  return { correta };
}

/**
 * Retorna o resumo agregado de progresso de um usuário:
 * total de respostas, acertos, pontos (10 por acerto) e taxa de acerto.
 */
async function resumoUsuario(idUsuario) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idUsuario', sql.Int, idUsuario)
    .query(`
      SELECT
        COUNT(*) AS totalRespondidas,
        SUM(CASE WHEN correta = 1 THEN 1 ELSE 0 END) AS totalAcertos,
        SUM(CASE WHEN correta = 1 THEN 10 ELSE 0 END) AS pontos
      FROM respostas_usuario
      WHERE idUsuario = @idUsuario;
    `);
  const linha = result.recordset[0];
  return {
    totalRespondidas: linha.totalRespondidas || 0,
    totalAcertos: linha.totalAcertos || 0,
    pontos: linha.pontos || 0,
  };
}

/**
 * Agrega desempenho por tema — usado na aba de mapeamento para mostrar
 * pontos fortes e fracos do usuário.
 */
async function desempenhoPorTema(idUsuario) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idUsuario', sql.Int, idUsuario)
    .query(`
      SELECT
        t.id AS idTema, t.nome AS temaNome,
        COUNT(r.id) AS totalRespondidas,
        SUM(CASE WHEN r.correta = 1 THEN 1 ELSE 0 END) AS totalAcertos
      FROM respostas_usuario r
      JOIN questoes q ON q.id = r.idQuestao
      LEFT JOIN temas t ON t.id = q.idTema
      WHERE r.idUsuario = @idUsuario
      GROUP BY t.id, t.nome
      ORDER BY totalRespondidas DESC;
    `);
  return result.recordset;
}

/**
 * Retorna a contagem de respostas por dia (para o gráfico de progresso),
 * dentro de uma janela de dias.
 */
async function respostasPorDia(idUsuario, dias = 30) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idUsuario', sql.Int, idUsuario)
    .input('dias', sql.Int, dias)
    .query(`
      SELECT
        CAST(respondidoEm AS DATE) AS dia,
        COUNT(*) AS total,
        SUM(CASE WHEN correta = 1 THEN 1 ELSE 0 END) AS acertos
      FROM respostas_usuario
      WHERE idUsuario = @idUsuario
        AND respondidoEm >= DATEADD(DAY, -@dias, CAST(SYSUTCDATETIME() AS DATE))
      GROUP BY CAST(respondidoEm AS DATE)
      ORDER BY dia ASC;
    `);
  return result.recordset;
}

/**
 * Verifica se o usuário já respondeu determinadas questões e se acertou,
 * usado para exibir status na aba de mapeamento.
 */
async function statusPorQuestoes(idUsuario, idsQuestoes) {
  if (!idsQuestoes.length) return {};
  const pool = await getPool();
  const request = pool.request().input('idUsuario', sql.Int, idUsuario);

  const placeholders = idsQuestoes.map((id, i) => {
    request.input(`q${i}`, sql.Int, id);
    return `@q${i}`;
  });

  const result = await request.query(`
    SELECT idQuestao, MAX(CAST(correta AS INT)) AS acertouAlgumaVez, COUNT(*) AS tentativas
    FROM respostas_usuario
    WHERE idUsuario = @idUsuario AND idQuestao IN (${placeholders.join(',')})
    GROUP BY idQuestao;
  `);

  const mapa = {};
  result.recordset.forEach((r) => {
    mapa[r.idQuestao] = { acertouAlgumaVez: !!r.acertouAlgumaVez, tentativas: r.tentativas };
  });
  return mapa;
}

module.exports = {
  registrar,
  resumoUsuario,
  desempenhoPorTema,
  respostasPorDia,
  statusPorQuestoes,
};
