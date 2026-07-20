/**
 * Model de Simulado.
 * Um simulado é gerado a partir de critérios (tema/banca/dificuldade)
 * e mantém um "snapshot" das questões sorteadas em simulado_questoes,
 * garantindo que o conteúdo do simulado não mude mesmo se as questões
 * originais forem editadas depois.
 */

const { sql, getPool } = require('../config/database');
const questaoModel = require('./questaoModel');

/**
 * Cria um novo simulado: sorteia as questões que atendem aos critérios
 * e grava o simulado + o snapshot das questões em uma única transação.
 */
async function criar({ idUsuario, idTema, banca, dificuldade, quantidade }) {
  const idsQuestoes = await questaoModel.selecionarAleatorias({ idTema, banca, dificuldade, quantidade });

  if (!idsQuestoes.length) {
    return { erro: 'Nenhuma questão ativa encontrada com os critérios informados.' };
  }

  const pool = await getPool();
  const transaction = new sql.Transaction(pool);

  try {
    await transaction.begin();

    const simuladoRequest = new sql.Request(transaction);
    const simuladoResult = await simuladoRequest
      .input('idUsuario', sql.Int, idUsuario)
      .input('idTema', sql.Int, idTema || null)
      .input('banca', sql.NVarChar(100), banca || null)
      .input('dificuldade', sql.NVarChar(10), dificuldade || null)
      .input('totalQuestoes', sql.Int, idsQuestoes.length)
      .query(`
        INSERT INTO simulados (idUsuario, idTema, banca, dificuldade, totalQuestoes)
        OUTPUT INSERTED.id
        VALUES (@idUsuario, @idTema, @banca, @dificuldade, @totalQuestoes);
      `);

    const idSimulado = simuladoResult.recordset[0].id;

    for (let i = 0; i < idsQuestoes.length; i++) {
      const req = new sql.Request(transaction);
      await req
        .input('idSimulado', sql.Int, idSimulado)
        .input('idQuestao', sql.Int, idsQuestoes[i])
        .input('ordem', sql.Int, i + 1)
        .query(`
          INSERT INTO simulado_questoes (idSimulado, idQuestao, ordem)
          VALUES (@idSimulado, @idQuestao, @ordem);
        `);
    }

    await transaction.commit();
    return buscarPorId(idSimulado, idUsuario);
  } catch (err) {
    await transaction.rollback();
    throw err;
  }
}

/**
 * Busca um simulado e suas questões (sem revelar qual alternativa é a
 * correta enquanto o simulado estiver em andamento).
 */
async function buscarPorId(idSimulado, idUsuario) {
  const pool = await getPool();

  const simuladoResult = await pool
    .request()
    .input('id', sql.Int, idSimulado)
    .input('idUsuario', sql.Int, idUsuario)
    .query(`
      SELECT s.*, t.nome AS temaNome
      FROM simulados s
      LEFT JOIN temas t ON t.id = s.idTema
      WHERE s.id = @id AND s.idUsuario = @idUsuario;
    `);

  const simulado = simuladoResult.recordset[0];
  if (!simulado) return null;

  const questoesResult = await pool
    .request()
    .input('idSimulado', sql.Int, idSimulado)
    .query(`
      SELECT sq.ordem, q.id, q.referencia, q.descricao, q.banca, q.ano, q.dificuldade
      FROM simulado_questoes sq
      JOIN questoes q ON q.id = sq.idQuestao
      WHERE sq.idSimulado = @idSimulado
      ORDER BY sq.ordem ASC;
    `);

  const idsQuestoes = questoesResult.recordset.map((q) => q.id);
  let alternativasResult = { recordset: [] };
  if (idsQuestoes.length) {
    const requestAlternativas = pool.request();
    const placeholders = idsQuestoes.map((id, i) => {
      requestAlternativas.input(`q${i}`, sql.Int, id);
      return `@q${i}`;
    });
    alternativasResult = await requestAlternativas.query(`
      SELECT id, idQuestao, letra, descricaoAlt
      FROM alternativas
      WHERE idQuestao IN (${placeholders.join(',')})
      ORDER BY letra ASC;
    `);
  }

  const alternativasPorQuestao = {};
  alternativasResult.recordset.forEach((alt) => {
    if (!alternativasPorQuestao[alt.idQuestao]) alternativasPorQuestao[alt.idQuestao] = [];
    alternativasPorQuestao[alt.idQuestao].push(alt);
  });

  simulado.questoes = questoesResult.recordset.map((q) => ({
    ...q,
    alternativas: alternativasPorQuestao[q.id] || [],
  }));

  return simulado;
}

/**
 * Finaliza um simulado: registra todas as respostas dentro de uma
 * transação, calcula os acertos e retorna o resultado detalhado
 * (questão a questão) para exibir o gabarito ao usuário.
 */
async function finalizar(idSimulado, idUsuario, respostas) {
  const pool = await getPool();

  const simuladoCheck = await pool
    .request()
    .input('id', sql.Int, idSimulado)
    .input('idUsuario', sql.Int, idUsuario)
    .query(`SELECT * FROM simulados WHERE id = @id AND idUsuario = @idUsuario;`);

  const simulado = simuladoCheck.recordset[0];
  if (!simulado) return { erro: 'Simulado não encontrado.' };
  if (simulado.status === 'finalizado') return { erro: 'Este simulado já foi finalizado.' };

  const questoesSnapshot = await pool
    .request()
    .input('idSimulado', sql.Int, idSimulado)
    .query(`SELECT idQuestao FROM simulado_questoes WHERE idSimulado = @idSimulado;`);
  const idsValidos = new Set(questoesSnapshot.recordset.map((r) => r.idQuestao));

  const transaction = new sql.Transaction(pool);
  const resultadoDetalhado = [];
  let acertos = 0;

  try {
    await transaction.begin();

    for (const resposta of respostas) {
      if (!idsValidos.has(resposta.idQuestao)) continue; // ignora questões que não pertencem a este simulado

      const altRequest = new sql.Request(transaction);
      const altResult = await altRequest
        .input('id', sql.Int, resposta.idAlternativa)
        .input('idQuestao', sql.Int, resposta.idQuestao)
        .query(`SELECT id, correta FROM alternativas WHERE id = @id AND idQuestao = @idQuestao;`);

      const alternativa = altResult.recordset[0];
      if (!alternativa) continue;

      const correta = !!alternativa.correta;
      if (correta) acertos++;

      const insertRequest = new sql.Request(transaction);
      await insertRequest
        .input('idUsuario', sql.Int, idUsuario)
        .input('idQuestao', sql.Int, resposta.idQuestao)
        .input('idAlternativa', sql.Int, resposta.idAlternativa)
        .input('correta', sql.Bit, correta)
        .input('idSimulado', sql.Int, idSimulado)
        .query(`
          INSERT INTO respostas_usuario (idUsuario, idQuestao, idAlternativa, correta, idSimulado)
          VALUES (@idUsuario, @idQuestao, @idAlternativa, @correta, @idSimulado);
        `);

      const corretaResult = await new sql.Request(transaction)
        .input('idQuestao', sql.Int, resposta.idQuestao)
        .query(`SELECT id FROM alternativas WHERE idQuestao = @idQuestao AND correta = 1;`);

      resultadoDetalhado.push({
        idQuestao: resposta.idQuestao,
        idAlternativaEscolhida: resposta.idAlternativa,
        idAlternativaCorreta: corretaResult.recordset[0]?.id,
        correta,
      });
    }

    const finalizarRequest = new sql.Request(transaction);
    await finalizarRequest
      .input('id', sql.Int, idSimulado)
      .input('acertos', sql.Int, acertos)
      .query(`
        UPDATE simulados
        SET status = 'finalizado', acertos = @acertos, finalizadoEm = SYSUTCDATETIME()
        WHERE id = @id;
      `);

    await transaction.commit();

    return {
      idSimulado,
      totalQuestoes: simulado.totalQuestoes,
      acertos,
      pontosGanhos: acertos * 10,
      resultadoDetalhado,
    };
  } catch (err) {
    await transaction.rollback();
    throw err;
  }
}

async function listarPorUsuario(idUsuario) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('idUsuario', sql.Int, idUsuario)
    .query(`
      SELECT s.id, s.totalQuestoes, s.acertos, s.status, s.criadoEm, s.finalizadoEm,
             s.banca, s.dificuldade, t.nome AS temaNome
      FROM simulados s
      LEFT JOIN temas t ON t.id = s.idTema
      WHERE s.idUsuario = @idUsuario
      ORDER BY s.criadoEm DESC;
    `);
  return result.recordset;
}

module.exports = { criar, buscarPorId, finalizar, listarPorUsuario };
