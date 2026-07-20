/**
 * Ponto de entrada da aplicação.
 * Responsável por inicializar o servidor HTTP e validar
 * a conexão com o banco antes de começar a aceitar requisições.
 */

require('dotenv').config();
const app = require('./src/app');
const { getPool } = require('./src/config/database');
const { agendarRenovacaoPix } = require('./src/services/renovacaoPixService');

const PORT = process.env.PORT || 3000;

async function iniciar() {
  try {
    await getPool(); // valida a conexão com o SQL Server no boot
    app.listen(PORT, () => {
      console.log(`[server] API Concursos rodando na porta ${PORT}`);
      console.log(`[server] Documentação disponível em http://localhost:${PORT}/docs`);
    });
    agendarRenovacaoPix();
  } catch (err) {
    console.error('[server] Não foi possível iniciar o servidor: falha na conexão com o banco.');
    process.exit(1);
  }
}

iniciar();
