/**
 * Model de Questão.
 * Contém as operações de acesso a dados, incluindo o uso de
 * transações para garantir atomicidade entre questão + alternativas.
 */

const { sql, getPool } = require('../config/database');

/**
 * Cria uma questão e todas as suas alternativas em uma única transação.
 * Em caso de qualquer falha, realiza rollback completo.
 */
async function criarComAlternativas({ referencia, descricao, ativo, idTema, banca, ano, dificuldade, alternativas }) {
  const pool = await getPool();
  const transaction = new sql.Transaction(pool);

  try {
    await transaction.begin();

    const questaoRequest = new sql.Request(transaction);
    const questaoResult = await questaoRequest
      .input('referencia', sql.NVarChar(150), referencia || null)
      .input('descricao', sql.NVarChar(sql.MAX), descricao)
      .input('ativo', sql.Bit, ativo === undefined ? true : ativo)
      .input('idTema', sql.Int, idTema || null)
      .input('banca', sql.NVarChar(100), banca || null)
      .input('ano', sql.SmallInt, ano || null)
      .input('dificuldade', sql.NVarChar(10), dificuldade || null)
      .query(`
        INSERT INTO questoes (referencia, descricao, ativo, idTema, banca, ano, dificuldade)
        OUTPUT INSERTED.id
        VALUES (@referencia, @descricao, @ativo, @idTema, @banca, @ano, @dificuldade);
      `);

    const idQuestao = questaoResult.recordset[0].id;

    for (const alt of alternativas) {
      const altRequest = new sql.Request(transaction);
      await altRequest
        .input('idQuestao', sql.Int, idQuestao)
        .input('letra', sql.Char(1), alt.letra)
        .input('descricaoAlt', sql.NVarChar(sql.MAX), alt.descricaoAlt)
        .input('correta', sql.Bit, alt.correta)
        .query(`
          INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
          VALUES (@idQuestao, @letra, @descricaoAlt, @correta);
        `);
    }

    await transaction.commit();
    return buscarPorId(idQuestao);
  } catch (err) {
    await transaction.rollback();
    throw err;
  }
}

/**
 * Atualiza os dados da questão e substitui suas alternativas
 * (remove as antigas e insere as novas) dentro de uma transação.
 */
async function atualizarComAlternativas(id, { referencia, descricao, ativo, idTema, banca, ano, dificuldade, alternativas }) {
  const pool = await getPool();
  const transaction = new sql.Transaction(pool);

  try {
    await transaction.begin();

    const updateRequest = new sql.Request(transaction);
    await updateRequest
      .input('id', sql.Int, id)
      .input('referencia', sql.NVarChar(150), referencia || null)
      .input('descricao', sql.NVarChar(sql.MAX), descricao)
      .input('ativo', sql.Bit, ativo === undefined ? true : ativo)
      .input('idTema', sql.Int, idTema || null)
      .input('banca', sql.NVarChar(100), banca || null)
      .input('ano', sql.SmallInt, ano || null)
      .input('dificuldade', sql.NVarChar(10), dificuldade || null)
      .query(`
        UPDATE questoes
        SET referencia = @referencia,
            descricao = @descricao,
            ativo = @ativo,
            idTema = @idTema,
            banca = @banca,
            ano = @ano,
            dificuldade = @dificuldade,
            atualizadoEm = SYSUTCDATETIME()
        WHERE id = @id;
      `);

    if (Array.isArray(alternativas)) {
      const deleteRequest = new sql.Request(transaction);
      await deleteRequest
        .input('id', sql.Int, id)
        .query(`DELETE FROM alternativas WHERE idQuestao = @id;`);

      for (const alt of alternativas) {
        const altRequest = new sql.Request(transaction);
        await altRequest
          .input('idQuestao', sql.Int, id)
          .input('letra', sql.Char(1), alt.letra)
          .input('descricaoAlt', sql.NVarChar(sql.MAX), alt.descricaoAlt)
          .input('correta', sql.Bit, alt.correta)
          .query(`
            INSERT INTO alternativas (idQuestao, letra, descricaoAlt, correta)
            VALUES (@idQuestao, @letra, @descricaoAlt, @correta);
          `);
      }
    }

    await transaction.commit();
    return buscarPorId(id);
  } catch (err) {
    await transaction.rollback();
    throw err;
  }
}

async function buscarPorId(id) {
  const pool = await getPool();
  const questaoResult = await pool
    .request()
    .input('id', sql.Int, id)
    .query(`
      SELECT q.*, t.nome AS temaNome
      FROM questoes q
      LEFT JOIN temas t ON t.id = q.idTema
      WHERE q.id = @id;
    `);

  const questao = questaoResult.recordset[0];
  if (!questao) return null;

  const altResult = await pool
    .request()
    .input('idQuestao', sql.Int, id)
    .query(`
      SELECT id, idQuestao, letra, descricaoAlt, correta
      FROM alternativas
      WHERE idQuestao = @idQuestao
      ORDER BY letra ASC;
    `);

  questao.alternativas = altResult.recordset;
  return questao;
}

/**
 * Listagem com filtros, paginação e ordenação dinâmica.
 * Colunas de ordenação são validadas via whitelist para evitar SQL Injection.
 */
async function listar({
  pagina = 1,
  limite = 10,
  ativo,
  respondida,
  referencia,
  palavraChave,
  idTema,
  banca,
  ano,
  dificuldade,
  ordenarPor = 'id',
  direcao = 'desc',
  idUsuarioAtual,
  priorizarNaoRespondidas = false,
}) {
  const pool = await getPool();
  const offset = (pagina - 1) * limite;

  const colunasPermitidas = ['id', 'referencia', 'criadoEm', 'ano'];
  const coluna = colunasPermitidas.includes(ordenarPor) ? ordenarPor : 'id';
  const dir = direcao?.toLowerCase() === 'asc' ? 'ASC' : 'DESC';

  const request = pool.request();
  const condicoes = [];

  if (ativo !== undefined) {
    request.input('ativo', sql.Bit, ativo);
    condicoes.push('q.ativo = @ativo');
  }
  if (respondida !== undefined) {
    request.input('respondida', sql.Bit, respondida);
    condicoes.push('q.respondida = @respondida');
  }
  if (referencia) {
    request.input('referencia', sql.NVarChar(150), `%${referencia}%`);
    condicoes.push('q.referencia LIKE @referencia');
  }
  if (palavraChave) {
    request.input('palavraChave', sql.NVarChar(sql.MAX), `%${palavraChave}%`);
    condicoes.push('(q.descricao LIKE @palavraChave OR q.referencia LIKE @palavraChave)');
  }
  if (idTema) {
    request.input('idTema', sql.Int, idTema);
    condicoes.push('q.idTema = @idTema');
  }
  if (banca) {
    request.input('banca', sql.NVarChar(100), `%${banca}%`);
    condicoes.push('q.banca LIKE @banca');
  }
  if (ano) {
    request.input('ano', sql.SmallInt, ano);
    condicoes.push('q.ano = @ano');
  }
  if (dificuldade) {
    request.input('dificuldade', sql.NVarChar(10), dificuldade);
    condicoes.push('q.dificuldade = @dificuldade');
  }

  const whereClause = condicoes.length ? `WHERE ${condicoes.join(' AND ')}` : '';

  request.input('offset', sql.Int, offset);
  request.input('limite', sql.Int, Number(limite));

  // Prioriza questões que o usuário logado ainda não respondeu (feed do
  // aluno) — a resposta é por usuário (respostas_usuario), diferente do
  // campo q.respondida, que é uma marcação global/administrativa.
  const usarPrioridade = priorizarNaoRespondidas && idUsuarioAtual;
  let colunaPrioridade = '';
  let ordemPrioridade = '';
  if (usarPrioridade) {
    request.input('idUsuarioAtual', sql.Int, idUsuarioAtual);
    colunaPrioridade = `,
           CASE WHEN EXISTS (
             SELECT 1 FROM respostas_usuario r
             WHERE r.idQuestao = q.id AND r.idUsuario = @idUsuarioAtual
           ) THEN 1 ELSE 0 END AS jaRespondidaPeloUsuario`;
    ordemPrioridade = 'jaRespondidaPeloUsuario ASC, ';
  }

  const result = await request.query(`
    SELECT q.id, q.referencia, q.descricao, q.respondida, q.ativo, q.criadoEm, q.atualizadoEm,
           q.idTema, t.nome AS temaNome, q.banca, q.ano, q.dificuldade,
           COUNT(*) OVER() AS totalRegistros${colunaPrioridade}
    FROM questoes q
    LEFT JOIN temas t ON t.id = q.idTema
    ${whereClause}
    ORDER BY ${ordemPrioridade}q.${coluna} ${dir}
    OFFSET @offset ROWS FETCH NEXT @limite ROWS ONLY;
  `);

  const total = result.recordset[0]?.totalRegistros || 0;
  const registros = result.recordset.map(({ totalRegistros, jaRespondidaPeloUsuario, ...q }) => q);

  return {
    registros,
    paginacao: {
      pagina: Number(pagina),
      limite: Number(limite),
      total,
      totalPaginas: Math.ceil(total / limite) || 1,
    },
  };
}

async function excluir(id) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .query(`DELETE FROM questoes WHERE id = @id;`); // alternativas removidas via ON DELETE CASCADE
  return result.rowsAffected[0] > 0;
}

async function atualizarStatus(id, campo, valor) {
  const colunasPermitidas = ['ativo', 'respondida'];
  if (!colunasPermitidas.includes(campo)) {
    throw new Error('Campo de status inválido.');
  }
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .input('valor', sql.Bit, valor)
    .query(`
      UPDATE questoes
      SET ${campo} = @valor, atualizadoEm = SYSUTCDATETIME()
      OUTPUT INSERTED.id, INSERTED.${campo}
      WHERE id = @id;
    `);
  return result.recordset[0] || null;
}

async function contarPorStatus() {
  const pool = await getPool();
  const result = await pool.request().query(`
    SELECT
      COUNT(*) AS total,
      SUM(CASE WHEN ativo = 1 THEN 1 ELSE 0 END) AS ativas,
      SUM(CASE WHEN respondida = 1 THEN 1 ELSE 0 END) AS respondidas,
      SUM(CASE WHEN respondida = 0 THEN 1 ELSE 0 END) AS pendentes
    FROM questoes;
  `);
  return result.recordset[0];
}

/**
 * Retorna os valores distintos disponíveis para os filtros do
 * mapeamento de questões (bancas e anos cadastrados).
 */
async function listarValoresFiltro() {
  const pool = await getPool();
  const [bancas, anos] = await Promise.all([
    pool.request().query(`
      SELECT DISTINCT banca FROM questoes WHERE banca IS NOT NULL AND banca <> '' ORDER BY banca;
    `),
    pool.request().query(`
      SELECT DISTINCT ano FROM questoes WHERE ano IS NOT NULL ORDER BY ano DESC;
    `),
  ]);
  return {
    bancas: bancas.recordset.map((r) => r.banca),
    anos: anos.recordset.map((r) => r.ano),
    dificuldades: ['facil', 'medio', 'dificil'],
  };
}

/**
 * Seleciona aleatoriamente questões ativas que atendam aos critérios
 * informados. Usado na geração de simulados.
 */
async function selecionarAleatorias({ idTema, banca, dificuldade, quantidade }) {
  const pool = await getPool();
  const request = pool.request();
  const condicoes = ['q.ativo = 1'];

  if (idTema) {
    request.input('idTema', sql.Int, idTema);
    condicoes.push('q.idTema = @idTema');
  }
  if (banca) {
    request.input('banca', sql.NVarChar(100), banca);
    condicoes.push('q.banca = @banca');
  }
  if (dificuldade) {
    request.input('dificuldade', sql.NVarChar(10), dificuldade);
    condicoes.push('q.dificuldade = @dificuldade');
  }

  request.input('quantidade', sql.Int, quantidade);

  const result = await request.query(`
    SELECT TOP (@quantidade) q.id
    FROM questoes q
    WHERE ${condicoes.join(' AND ')}
    ORDER BY NEWID();
  `);

  return result.recordset.map((r) => r.id);
}

module.exports = {
  criarComAlternativas,
  atualizarComAlternativas,
  buscarPorId,
  listar,
  excluir,
  atualizarStatus,
  contarPorStatus,
  listarValoresFiltro,
  selecionarAleatorias,
};
