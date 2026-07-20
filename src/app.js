/**
 * Configuração central da aplicação Express.
 * Registra middlewares globais, rotas e tratamento de erros.
 */

const express = require('express');
const path = require('path');
const cors = require('cors');
const helmet = require('helmet');
const rateLimit = require('express-rate-limit');
const swaggerUi = require('swagger-ui-express');

const swaggerSpec = require('./swagger');
const authRoutes = require('./routes/authRoutes');
const usuarioRoutes = require('./routes/usuarioRoutes');
const questaoRoutes = require('./routes/questaoRoutes');
const alternativaRoutes = require('./routes/alternativaRoutes');
const temaRoutes = require('./routes/temaRoutes');
const respostaRoutes = require('./routes/respostaRoutes');
const progressoRoutes = require('./routes/progressoRoutes');
const simuladoRoutes = require('./routes/simuladoRoutes');
const rankingRoutes = require('./routes/rankingRoutes');
const comentarioRoutes = require('./routes/comentarioRoutes');
const denunciaRoutes = require('./routes/denunciaRoutes');
const assinaturaRoutes = require('./routes/assinaturaRoutes');
const webhookRoutes = require('./routes/webhookRoutes');
const { errorHandler, rotaNaoEncontrada } = require('./middlewares/errorHandler');

const app = express();

// Necessário quando a aplicação roda atrás de um proxy reverso (Nginx,
// balanceador do provedor de hospedagem, etc.) — sem isso, o rate limit e
// os logs de IP enxergam apenas o IP do proxy, não o do cliente real.
// Só habilite (TRUST_PROXY=true) se a hospedagem realmente usa um proxy
// confiável na frente; caso contrário, um cliente poderia forjar o header
// X-Forwarded-For para burlar o rate limit.
if (process.env.TRUST_PROXY === 'true') {
  app.set('trust proxy', 1);
}

/* ===== Middlewares globais de segurança e utilidade ===== */
// scriptSrcAttr precisa liberar 'unsafe-inline' porque os painéis estáticos
// (public/ e public-usuario/) usam onclick="" como padrão de interatividade.
// script-src precisa liberar o cdnjs, de onde os painéis carregam Bootstrap
// e Chart.js — sem isso o navegador bloqueia esses <script src>, "bootstrap"
// fica undefined e nenhum modal (ex: responder questão) chega a funcionar.
app.use(helmet({
  contentSecurityPolicy: {
    directives: {
      ...helmet.contentSecurityPolicy.getDefaultDirectives(),
      'script-src': ["'self'", 'https://cdnjs.cloudflare.com'],
      'script-src-attr': ["'unsafe-inline'"],
    },
  },
}));

// Como os painéis (public/ e public-usuario/) são servidos pela própria API
// na mesma origem, restringimos o CORS à(s) origem(ns) configurada(s) —
// impede que outros sites façam chamadas autenticadas diretas à API usando
// um token roubado por outro meio. Em desenvolvimento, sem CORS_ORIGENS
// configurado, cai em localhost.
const origensPermitidas = (process.env.CORS_ORIGENS || process.env.APP_BASE_URL || 'http://localhost:3000')
  .split(',')
  .map((origem) => origem.trim())
  .filter(Boolean);
app.use(cors({ origin: origensPermitidas }));

app.use(express.json({ limit: '1mb' }));

const limiter = rateLimit({
  windowMs: Number(process.env.RATE_LIMIT_WINDOW_MS) || 15 * 60 * 1000,
  max: Number(process.env.RATE_LIMIT_MAX) || 100,
  message: {
    sucesso: false,
    mensagem: 'Muitas requisições. Tente novamente mais tarde.',
  },
});
app.use('/', limiter);

/* ===== Documentação ===== */
app.use('/docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

/* ===== Painel administrativo (front-end estático) ===== */
app.use('/admin', express.static(path.join(__dirname, '..', 'public')));

/* ===== Painel do usuário / estudante (front-end estático) ===== */
app.use('/app', express.static(path.join(__dirname, '..', 'public-usuario')));

/* ===== Rotas ===== */
app.get('/', (req, res) => {
  res.json({
    sucesso: true,
    mensagem: 'API Concursos rodando. Consulte /docs para a documentação, /admin para o painel administrativo e /app para o painel do usuário.',
  });
});

app.use('/auth', authRoutes);
app.use('/usuarios', usuarioRoutes);
app.use('/questoes', questaoRoutes);
app.use('/alternativas', alternativaRoutes);
app.use('/temas', temaRoutes);
app.use('/respostas', respostaRoutes);
app.use('/progresso', progressoRoutes);
app.use('/simulados', simuladoRoutes);
app.use('/ranking', rankingRoutes);
app.use('/comentarios', comentarioRoutes);
app.use('/denuncias', denunciaRoutes);
app.use('/assinaturas', assinaturaRoutes);
app.use('/webhooks', webhookRoutes);

/* ===== Tratamento de erros ===== */
app.use(rotaNaoEncontrada);
app.use(errorHandler);

module.exports = app;
