/**
 * Configuração do PM2 para produção.
 * Uso: pm2 start ecosystem.config.js --env production
 */

module.exports = {
  apps: [
    {
      name: 'api-concursos',
      script: 'server.js',
      cwd: __dirname,

      // Mantém 1 instância só: o rate limit (express-rate-limit) guarda
      // as contagens em memória por processo, e não há sticky-session/
      // shared-store configurado — rodar em modo cluster com várias
      // instâncias enfraqueceria o rate limit (cada uma teria sua
      // própria contagem). Se precisar escalar, ajuste isso primeiro.
      instances: 1,
      exec_mode: 'fork',

      autorestart: true,
      max_restarts: 10,
      min_uptime: '15s',
      restart_delay: 3000,

      // Reinicia sozinho se vazar memória e passar de 400MB.
      max_memory_restart: '400M',

      // Em produção, o próprio server.js já carrega o .env via dotenv;
      // isso aqui só garante NODE_ENV mesmo que o .env não defina.
      env_production: {
        NODE_ENV: 'production',
      },

      watch: false,
      out_file: './logs/pm2-out.log',
      error_file: './logs/pm2-error.log',
      log_date_format: 'YYYY-MM-DD HH:mm:ss',
      merge_logs: true,
    },
  ],
};
