/**
 * Definição da documentação Swagger/OpenAPI da API.
 * Disponível em GET /docs quando o servidor estiver rodando.
 */

const swaggerJsdoc = require('swagger-jsdoc');

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'API Concursos',
      version: '1.0.0',
      description:
        'API REST para gerenciamento de questões de concursos públicos, com autenticação JWT, ' +
        'cadastro transacional de questões com alternativas e painel administrativo.',
    },
    servers: [{ url: 'http://localhost:3000', description: 'Servidor local' }],
    components: {
      securitySchemes: {
        bearerAuth: {
          type: 'http',
          scheme: 'bearer',
          bearerFormat: 'JWT',
        },
      },
      schemas: {
        Usuario: {
          type: 'object',
          properties: {
            id: { type: 'integer', example: 1 },
            nome: { type: 'string', example: 'joao.silva' },
          },
        },
        Alternativa: {
          type: 'object',
          properties: {
            letra: { type: 'string', example: 'A' },
            descricaoAlt: { type: 'string', example: 'Texto da alternativa' },
            correta: { type: 'boolean', example: false },
          },
        },
        Questao: {
          type: 'object',
          properties: {
            referencia: { type: 'string', example: 'CESPE 2024' },
            descricao: { type: 'string', example: 'Enunciado da questão' },
            ativo: { type: 'boolean', example: true },
            alternativas: {
              type: 'array',
              items: { $ref: '#/components/schemas/Alternativa' },
            },
          },
        },
      },
    },
    security: [{ bearerAuth: [] }],
    paths: {
      '/auth/login': {
        post: {
          tags: ['Autenticação'],
          summary: 'Autentica um usuário e retorna um token JWT',
          security: [],
          requestBody: {
            required: true,
            content: {
              'application/json': {
                schema: {
                  type: 'object',
                  properties: {
                    nome: { type: 'string' },
                    senha: { type: 'string' },
                  },
                  required: ['nome', 'senha'],
                },
              },
            },
          },
          responses: {
            200: { description: 'Login realizado com sucesso' },
            401: { description: 'Credenciais inválidas' },
          },
        },
      },
      '/usuarios': {
        post: {
          tags: ['Usuários'],
          summary: 'Cadastra um novo usuário',
          security: [],
          requestBody: {
            required: true,
            content: {
              'application/json': {
                schema: { $ref: '#/components/schemas/Usuario' },
              },
            },
          },
          responses: { 201: { description: 'Usuário criado' } },
        },
        get: {
          tags: ['Usuários'],
          summary: 'Lista todos os usuários',
          responses: { 200: { description: 'Lista de usuários' } },
        },
      },
      '/questoes': {
        get: {
          tags: ['Questões'],
          summary: 'Lista questões com filtros, paginação e ordenação',
          parameters: [
            { name: 'pagina', in: 'query', schema: { type: 'integer' } },
            { name: 'limite', in: 'query', schema: { type: 'integer' } },
            { name: 'ativo', in: 'query', schema: { type: 'boolean' } },
            { name: 'respondida', in: 'query', schema: { type: 'boolean' } },
            { name: 'referencia', in: 'query', schema: { type: 'string' } },
            { name: 'palavraChave', in: 'query', schema: { type: 'string' } },
            { name: 'ordenarPor', in: 'query', schema: { type: 'string' } },
            { name: 'direcao', in: 'query', schema: { type: 'string' } },
          ],
          responses: { 200: { description: 'Lista paginada de questões' } },
        },
        post: {
          tags: ['Questões'],
          summary: 'Cadastra uma questão e suas alternativas em uma transação',
          requestBody: {
            required: true,
            content: {
              'application/json': {
                schema: { $ref: '#/components/schemas/Questao' },
              },
            },
          },
          responses: { 201: { description: 'Questão criada' } },
        },
      },
      '/questoes/{id}': {
        get: {
          tags: ['Questões'],
          summary: 'Busca questão por ID',
          parameters: [{ name: 'id', in: 'path', required: true, schema: { type: 'integer' } }],
          responses: { 200: { description: 'Questão encontrada' }, 404: { description: 'Não encontrada' } },
        },
        put: {
          tags: ['Questões'],
          summary: 'Atualiza questão e alternativas em uma transação',
          parameters: [{ name: 'id', in: 'path', required: true, schema: { type: 'integer' } }],
          responses: { 200: { description: 'Questão atualizada' } },
        },
        delete: {
          tags: ['Questões'],
          summary: 'Exclui questão (alternativas em cascata)',
          parameters: [{ name: 'id', in: 'path', required: true, schema: { type: 'integer' } }],
          responses: { 200: { description: 'Questão excluída' } },
        },
      },
    },
  },
  apis: [],
};

module.exports = swaggerJsdoc(options);
