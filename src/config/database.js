/**
 * Configuração e gerenciamento do pool de conexões com o SQL Server.
 * Utiliza o driver "mssql" e mantém uma única instância de pool
 * reaproveitada em toda a aplicação (boa prática de performance).
 */

const sql = require('mssql');
require('dotenv').config();

const dbConfig = {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  server: process.env.DB_SERVER,
  database: process.env.DB_DATABASE,
  options: {
    encrypt: process.env.DB_ENCRYPT === 'true',
    trustServerCertificate: process.env.DB_TRUST_SERVER_CERTIFICATE === 'true',
  },
  pool: {
    max: 10,
    min: 0,
    idleTimeoutMillis: 30000,
  },
};

/**
 * Instância nomeada (comum em SQL Server Express, ex: SQLEXPRESS).
 * Quando informada, a porta é resolvida automaticamente via SQL Server
 * Browser (UDP 1434) e NÃO deve ser fixada manualmente.
 * Caso contrário, usa a porta informada (ou 1433 por padrão).
 */
if (process.env.DB_INSTANCE) {
  dbConfig.options.instanceName = process.env.DB_INSTANCE;
} else {
  dbConfig.port = Number(process.env.DB_PORT) || 1433;
}

let poolPromise = null;

/**
 * Retorna uma instância única (singleton) do pool de conexões.
 * Cria o pool na primeira chamada e reaproveita nas seguintes.
 */
function getPool() {
  if (!poolPromise) {
    poolPromise = new sql.ConnectionPool(dbConfig)
      .connect()
      .then((pool) => {
        console.log('[database] Conectado ao SQL Server com sucesso.');
        return pool;
      })
      .catch((err) => {
        poolPromise = null; // permite nova tentativa em próxima chamada
        console.error('[database] Falha ao conectar ao SQL Server:', err.message);
        throw err;
      });
  }
  return poolPromise;
}

module.exports = {
  sql,
  getPool,
};
