/**
 * Model de Usuário.
 * Responsável exclusivamente pelo acesso a dados (queries parametrizadas).
 * Nenhuma regra de negócio deve residir aqui.
 */

const { sql, getPool } = require('../config/database');

async function criar({ nome, email, senhaHash }) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('nome', sql.NVarChar(150), nome)
    .input('email', sql.NVarChar(255), email || null)
    .input('senhaHash', sql.NVarChar(255), senhaHash)
    .query(`
      INSERT INTO usuarios (nome, email, senhaHash)
      OUTPUT INSERTED.id, INSERTED.nome, INSERTED.email, INSERTED.criadoEm
      VALUES (@nome, @email, @senhaHash);
    `);
  return result.recordset[0];
}

async function listarTodos() {
  const pool = await getPool();
  const result = await pool.request().query(`
    SELECT id, nome, role, statusAcesso, criadoEm, atualizadoEm, ultimaAtividade,
      CASE WHEN ultimaAtividade >= DATEADD(MINUTE, -5, SYSUTCDATETIME()) THEN 1 ELSE 0 END AS online
    FROM usuarios
    ORDER BY nome ASC;
  `);
  return result.recordset;
}

async function buscarPorId(id) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .query(`
      SELECT id, nome, email, role, statusAcesso, criadoEm, atualizadoEm
      FROM usuarios
      WHERE id = @id;
    `);
  return result.recordset[0] || null;
}

async function buscarPorNome(nome) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('nome', sql.NVarChar(150), nome)
    .query(`
      SELECT id, nome, email, senhaHash, role, criadoEm
      FROM usuarios
      WHERE nome = @nome;
    `);
  return result.recordset[0] || null;
}

async function buscarPorEmail(email) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('email', sql.NVarChar(255), email)
    .query(`
      SELECT id, nome, email, senhaHash, role, criadoEm
      FROM usuarios
      WHERE email = @email;
    `);
  return result.recordset[0] || null;
}

/**
 * Login aceita tanto o nome de usuário quanto o e-mail no mesmo campo —
 * contas antigas (sem e-mail cadastrado) continuam entrando pelo nome.
 */
async function buscarPorNomeOuEmail(identificador) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('identificador', sql.NVarChar(255), identificador)
    .query(`
      SELECT id, nome, email, senhaHash, role, criadoEm
      FROM usuarios
      WHERE nome = @identificador OR email = @identificador;
    `);
  return result.recordset[0] || null;
}

async function atualizar(id, { nome }) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .input('nome', sql.NVarChar(150), nome)
    .query(`
      UPDATE usuarios
      SET nome = @nome, atualizadoEm = SYSUTCDATETIME()
      OUTPUT INSERTED.id, INSERTED.nome, INSERTED.atualizadoEm
      WHERE id = @id;
    `);
  return result.recordset[0] || null;
}

async function atualizarSenha(id, senhaHash) {
  const pool = await getPool();
  await pool
    .request()
    .input('id', sql.Int, id)
    .input('senhaHash', sql.NVarChar(255), senhaHash)
    .query(`
      UPDATE usuarios
      SET senhaHash = @senhaHash, atualizadoEm = SYSUTCDATETIME()
      WHERE id = @id;
    `);
  return true;
}

/**
 * Define o status de acesso administrativo do usuário ("padrao",
 * "bloqueado" ou "premium" — ver migration_status_acesso.sql). Operação
 * exclusiva de admin, feita por rota separada da atualização de perfil.
 */
async function atualizarStatusAcesso(id, statusAcesso) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .input('statusAcesso', sql.NVarChar(20), statusAcesso)
    .query(`
      UPDATE usuarios
      SET statusAcesso = @statusAcesso, atualizadoEm = SYSUTCDATETIME()
      OUTPUT INSERTED.id, INSERTED.nome, INSERTED.statusAcesso, INSERTED.atualizadoEm
      WHERE id = @id;
    `);
  return result.recordset[0] || null;
}

async function registrarAtividade(id) {
  const pool = await getPool();
  await pool
    .request()
    .input('id', sql.Int, id)
    .query(`UPDATE usuarios SET ultimaAtividade = SYSUTCDATETIME() WHERE id = @id;`);
}

async function excluir(id) {
  const pool = await getPool();
  const result = await pool
    .request()
    .input('id', sql.Int, id)
    .query(`DELETE FROM usuarios WHERE id = @id;`);
  return result.rowsAffected[0] > 0;
}

module.exports = {
  criar,
  listarTodos,
  buscarPorId,
  buscarPorNome,
  buscarPorEmail,
  buscarPorNomeOuEmail,
  atualizar,
  atualizarSenha,
  atualizarStatusAcesso,
  registrarAtividade,
  excluir,
};
