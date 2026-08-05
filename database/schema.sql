/* =========================================================
   Sistema de Estudos para Concursos - Script de Banco de Dados
   SGBD: SQL Server
   ========================================================= */

IF DB_ID('ConcursosDB') IS NULL
BEGIN
    CREATE DATABASE ConcursosDB;
END
GO

USE ConcursosDB;
GO

/* =========================================================
   Tabela: usuarios
   ========================================================= */
IF OBJECT_ID('dbo.usuarios', 'U') IS NOT NULL
    DROP TABLE dbo.usuarios;
GO

CREATE TABLE dbo.usuarios (
    id            INT IDENTITY(1,1) PRIMARY KEY,
    nome          NVARCHAR(150)   NOT NULL,
    email         NVARCHAR(255)   NULL,
    senhaHash     NVARCHAR(255)   NOT NULL,
    criadoEm      DATETIME2       NOT NULL DEFAULT SYSUTCDATETIME(),
    atualizadoEm  DATETIME2       NULL,
    CONSTRAINT UQ_usuarios_nome UNIQUE (nome)
);
GO

-- Índice único filtrado: e-mail é opcional (contas antigas podem não ter),
-- mas quando presente não pode se repetir entre contas.
CREATE UNIQUE INDEX UQ_usuarios_email ON dbo.usuarios(email) WHERE email IS NOT NULL;
GO

/* =========================================================
   Tabela: redefinicoes_senha
   Tokens de uso único (com expiração) para o fluxo de
   "esqueci minha senha" via link enviado por e-mail.
   ========================================================= */
IF OBJECT_ID('dbo.redefinicoes_senha', 'U') IS NOT NULL
    DROP TABLE dbo.redefinicoes_senha;
GO

CREATE TABLE dbo.redefinicoes_senha (
    id            INT IDENTITY(1,1) PRIMARY KEY,
    idUsuario     INT             NOT NULL,
    token         NVARCHAR(255)   NOT NULL,
    criadoEm      DATETIME2       NOT NULL DEFAULT SYSUTCDATETIME(),
    expiraEm      DATETIME2       NOT NULL,
    usadoEm       DATETIME2       NULL,
    CONSTRAINT FK_redefinicoes_senha_usuario FOREIGN KEY (idUsuario)
        REFERENCES dbo.usuarios(id) ON DELETE CASCADE,
    CONSTRAINT UQ_redefinicoes_senha_token UNIQUE (token)
);
GO

/* =========================================================
   Tabela: questoes
   ========================================================= */
IF OBJECT_ID('dbo.questoes', 'U') IS NOT NULL
    DROP TABLE dbo.questoes;
GO

CREATE TABLE dbo.questoes (
    id            INT IDENTITY(1,1) PRIMARY KEY,
    referencia    NVARCHAR(150)   NULL,
    descricao     NVARCHAR(MAX)   NOT NULL,
    respondida    BIT             NOT NULL DEFAULT 0,
    ativo         BIT             NOT NULL DEFAULT 1,
    criadoEm      DATETIME2       NOT NULL DEFAULT SYSUTCDATETIME(),
    atualizadoEm  DATETIME2       NULL
);
GO

/* =========================================================
   Tabela: alternativas
   ========================================================= */
IF OBJECT_ID('dbo.alternativas', 'U') IS NOT NULL
    DROP TABLE dbo.alternativas;
GO

CREATE TABLE dbo.alternativas (
    id            INT IDENTITY(1,1) PRIMARY KEY,
    idQuestao     INT             NOT NULL,
    letra         CHAR(1)         NOT NULL,
    descricaoAlt  NVARCHAR(MAX)   NOT NULL,
    correta       BIT             NOT NULL DEFAULT 0,
    criadoEm      DATETIME2       NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_alternativas_questoes FOREIGN KEY (idQuestao)
        REFERENCES dbo.questoes(id) ON DELETE CASCADE,
    CONSTRAINT CK_alternativas_letra CHECK (letra IN ('A','B','C','D','E')),
    CONSTRAINT UQ_alternativas_questao_letra UNIQUE (idQuestao, letra)
);
GO

/* Índices auxiliares para busca/filtro/paginação */
CREATE INDEX IX_questoes_ativo       ON dbo.questoes(ativo);
CREATE INDEX IX_questoes_respondida  ON dbo.questoes(respondida);
CREATE INDEX IX_questoes_referencia  ON dbo.questoes(referencia);
CREATE INDEX IX_alternativas_idQuestao ON dbo.alternativas(idQuestao);
GO

/* =========================================================
   Trigger: garante apenas UMA alternativa correta por questão
   (regra de negócio reforçada também na aplicação)
   ========================================================= */
IF OBJECT_ID('dbo.TRG_alternativas_unica_correta', 'TR') IS NOT NULL
    DROP TRIGGER dbo.TRG_alternativas_unica_correta;
GO

CREATE TRIGGER dbo.TRG_alternativas_unica_correta
ON dbo.alternativas
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT idQuestao
        FROM dbo.alternativas
        WHERE idQuestao IN (SELECT idQuestao FROM inserted)
          AND correta = 1
        GROUP BY idQuestao
        HAVING COUNT(*) > 1
    )
    BEGIN
        RAISERROR('Uma questão não pode ter mais de uma alternativa correta.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END
GO

PRINT 'Banco de dados ConcursosDB criado com sucesso.';
GO

/* =========================================================
   Painel do Usuário: temas, gamificação, simulados
   (mesmas estruturas do database/migration_painel_usuario.sql,
   incluídas aqui para quem estiver fazendo instalação limpa)
   ========================================================= */

CREATE TABLE dbo.temas (
    id        INT IDENTITY(1,1) PRIMARY KEY,
    nome      NVARCHAR(120) NOT NULL,
    criadoEm  DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT UQ_temas_nome UNIQUE (nome)
);
GO

ALTER TABLE dbo.questoes ADD
    idTema      INT NULL,
    banca       NVARCHAR(100) NULL,
    ano         SMALLINT NULL,
    dificuldade NVARCHAR(10) NULL;
GO

ALTER TABLE dbo.questoes ADD CONSTRAINT FK_questoes_temas FOREIGN KEY (idTema) REFERENCES dbo.temas(id);
ALTER TABLE dbo.questoes ADD CONSTRAINT CK_questoes_dificuldade CHECK (dificuldade IN ('facil','medio','dificil'));
GO

CREATE INDEX IX_questoes_idTema ON dbo.questoes(idTema);
CREATE INDEX IX_questoes_banca ON dbo.questoes(banca);
CREATE INDEX IX_questoes_ano ON dbo.questoes(ano);
CREATE INDEX IX_questoes_dificuldade ON dbo.questoes(dificuldade);
GO

ALTER TABLE dbo.usuarios ADD
    streakAtual   INT NOT NULL DEFAULT 0,
    streakRecorde INT NOT NULL DEFAULT 0,
    ultimoAcesso  DATE NULL;
GO

/* =========================================================
   Colunas de usuarios: papel de acesso (RBAC) e atividade
   (mesmas estruturas de migration_seguranca_rbac.sql e
   migration_atividade_usuario.sql)
   ========================================================= */
ALTER TABLE dbo.usuarios ADD
    role             NVARCHAR(20)  NOT NULL DEFAULT 'aluno',
    ultimaAtividade  DATETIME2     NULL;
GO

ALTER TABLE dbo.usuarios
    ADD CONSTRAINT CK_usuarios_role CHECK (role IN ('aluno','admin'));
GO

CREATE TABLE dbo.acessos_usuario (
    id          INT IDENTITY(1,1) PRIMARY KEY,
    idUsuario   INT NOT NULL,
    dataAcesso  DATE NOT NULL,
    quantidade  INT NOT NULL DEFAULT 1,
    CONSTRAINT FK_acessos_usuario FOREIGN KEY (idUsuario) REFERENCES dbo.usuarios(id) ON DELETE CASCADE,
    CONSTRAINT UQ_acessos_usuario_data UNIQUE (idUsuario, dataAcesso)
);
CREATE INDEX IX_acessos_usuario_idUsuario ON dbo.acessos_usuario(idUsuario);
GO

CREATE TABLE dbo.simulados (
    id             INT IDENTITY(1,1) PRIMARY KEY,
    idUsuario      INT NOT NULL,
    idTema         INT NULL,
    banca          NVARCHAR(100) NULL,
    dificuldade    NVARCHAR(10) NULL,
    totalQuestoes  INT NOT NULL,
    acertos        INT NULL,
    status         NVARCHAR(20) NOT NULL DEFAULT 'em_andamento',
    criadoEm       DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    finalizadoEm   DATETIME2 NULL,
    CONSTRAINT FK_simulados_usuarios FOREIGN KEY (idUsuario) REFERENCES dbo.usuarios(id) ON DELETE CASCADE,
    CONSTRAINT FK_simulados_temas FOREIGN KEY (idTema) REFERENCES dbo.temas(id),
    CONSTRAINT CK_simulados_status CHECK (status IN ('em_andamento','finalizado'))
);
CREATE INDEX IX_simulados_idUsuario ON dbo.simulados(idUsuario);
GO

CREATE TABLE dbo.simulado_questoes (
    id          INT IDENTITY(1,1) PRIMARY KEY,
    idSimulado  INT NOT NULL,
    idQuestao   INT NOT NULL,
    ordem       INT NOT NULL,
    CONSTRAINT FK_simuladoQuestoes_simulados FOREIGN KEY (idSimulado) REFERENCES dbo.simulados(id) ON DELETE CASCADE,
    CONSTRAINT FK_simuladoQuestoes_questoes FOREIGN KEY (idQuestao) REFERENCES dbo.questoes(id),
    CONSTRAINT UQ_simulado_questao UNIQUE (idSimulado, idQuestao)
);
CREATE INDEX IX_simuladoQuestoes_idSimulado ON dbo.simulado_questoes(idSimulado);
GO

CREATE TABLE dbo.respostas_usuario (
    id             INT IDENTITY(1,1) PRIMARY KEY,
    idUsuario      INT NOT NULL,
    idQuestao      INT NOT NULL,
    idAlternativa  INT NOT NULL,
    correta        BIT NOT NULL,
    idSimulado     INT NULL,
    respondidoEm   DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_respostas_usuarios FOREIGN KEY (idUsuario) REFERENCES dbo.usuarios(id) ON DELETE CASCADE,
    CONSTRAINT FK_respostas_questoes FOREIGN KEY (idQuestao) REFERENCES dbo.questoes(id),
    CONSTRAINT FK_respostas_alternativas FOREIGN KEY (idAlternativa) REFERENCES dbo.alternativas(id),
    CONSTRAINT FK_respostas_simulados FOREIGN KEY (idSimulado) REFERENCES dbo.simulados(id)
);
CREATE INDEX IX_respostas_idUsuario ON dbo.respostas_usuario(idUsuario);
CREATE INDEX IX_respostas_idQuestao ON dbo.respostas_usuario(idQuestao);
CREATE INDEX IX_respostas_respondidoEm ON dbo.respostas_usuario(respondidoEm);
CREATE INDEX IX_respostas_idSimulado ON dbo.respostas_usuario(idSimulado);
GO

/* =========================================================
   Mapeamento: comentários e denúncias de questões
   (mesmas estruturas do database/migration_comentarios_denuncias.sql)
   ========================================================= */

CREATE TABLE dbo.comentarios_questao (
    id          INT IDENTITY(1,1) PRIMARY KEY,
    idQuestao   INT NOT NULL,
    idUsuario   INT NOT NULL,
    texto       NVARCHAR(500) NOT NULL,
    criadoEm    DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_comentarios_questoes FOREIGN KEY (idQuestao) REFERENCES dbo.questoes(id),
    CONSTRAINT FK_comentarios_usuarios FOREIGN KEY (idUsuario) REFERENCES dbo.usuarios(id) ON DELETE CASCADE
);
CREATE INDEX IX_comentarios_idQuestao ON dbo.comentarios_questao(idQuestao);
GO

CREATE TABLE dbo.denuncias_questao (
    id          INT IDENTITY(1,1) PRIMARY KEY,
    idQuestao   INT NOT NULL,
    idUsuario   INT NOT NULL,
    motivo      NVARCHAR(500) NOT NULL,
    status      NVARCHAR(20) NOT NULL DEFAULT 'pendente',
    criadoEm    DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_denuncias_questoes FOREIGN KEY (idQuestao) REFERENCES dbo.questoes(id),
    CONSTRAINT FK_denuncias_usuarios FOREIGN KEY (idUsuario) REFERENCES dbo.usuarios(id) ON DELETE CASCADE,
    CONSTRAINT CK_denuncias_status CHECK (status IN ('pendente','revisado','ignorado'))
);
CREATE INDEX IX_denuncias_idQuestao ON dbo.denuncias_questao(idQuestao);
GO

/* =========================================================
   Assinaturas (planos premium via Mercado Pago)
   (mesmas estruturas do database/migration_assinaturas.sql)
   ========================================================= */

CREATE TABLE dbo.assinaturas (
    id                INT IDENTITY(1,1) PRIMARY KEY,
    idUsuario         INT NOT NULL,
    plano             NVARCHAR(20) NOT NULL,
    valor             DECIMAL(10,2) NOT NULL,
    emailPagador      NVARCHAR(150) NOT NULL,
    metodoPagamento   NVARCHAR(20) NULL,
    idPreapprovalMP   NVARCHAR(100) NULL,
    status            NVARCHAR(20) NOT NULL DEFAULT 'pendente',
    dataInicio        DATETIME2 NULL,
    dataFim           DATETIME2 NULL,
    criadoEm          DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    atualizadoEm      DATETIME2 NULL,
    CONSTRAINT FK_assinaturas_usuarios FOREIGN KEY (idUsuario) REFERENCES dbo.usuarios(id) ON DELETE CASCADE,
    CONSTRAINT CK_assinaturas_plano CHECK (plano IN ('mensal','trimestral','semestral','anual')),
    CONSTRAINT CK_assinaturas_status CHECK (status IN ('pendente','autorizada','pausada','cancelada','reembolsada')),
    CONSTRAINT CK_assinaturas_metodoPagamento CHECK (metodoPagamento IS NULL OR metodoPagamento IN ('cartao', 'pix'))
);
CREATE INDEX IX_assinaturas_idUsuario ON dbo.assinaturas(idUsuario);
CREATE INDEX IX_assinaturas_idPreapprovalMP ON dbo.assinaturas(idPreapprovalMP);
GO

/* =========================================================
   Pagamentos e reembolsos das assinaturas
   (mesmas estruturas do database/migration_pagamentos_reembolsos.sql)
   ========================================================= */

CREATE TABLE dbo.pagamentos (
    id                  INT IDENTITY(1,1) PRIMARY KEY,
    idAssinatura        INT NOT NULL,
    idTransacaoGateway  NVARCHAR(100) NOT NULL,
    metodo              NVARCHAR(20) NOT NULL,
    valor               DECIMAL(10,2) NOT NULL,
    status              NVARCHAR(20) NOT NULL DEFAULT 'pendente',
    dataPagamento       DATETIME2 NULL,
    criadoEm            DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    atualizadoEm        DATETIME2 NULL,
    CONSTRAINT FK_pagamentos_assinaturas FOREIGN KEY (idAssinatura) REFERENCES dbo.assinaturas(id) ON DELETE CASCADE,
    CONSTRAINT UQ_pagamentos_idTransacaoGateway UNIQUE (idTransacaoGateway),
    CONSTRAINT CK_pagamentos_metodo CHECK (metodo IN ('pix','cartao_credito','cartao_debito')),
    CONSTRAINT CK_pagamentos_status CHECK (status IN ('aprovado','pendente','rejeitado','estornado'))
);
CREATE INDEX IX_pagamentos_idAssinatura ON dbo.pagamentos(idAssinatura);
GO

CREATE TABLE dbo.reembolsos (
    id                INT IDENTITY(1,1) PRIMARY KEY,
    idPagamento       INT NOT NULL,
    dataReembolso     DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    motivo            NVARCHAR(500) NULL,
    comprovanteUrl    NVARCHAR(300) NULL,
    comprovanteJson   NVARCHAR(MAX) NULL,
    CONSTRAINT FK_reembolsos_pagamentos FOREIGN KEY (idPagamento) REFERENCES dbo.pagamentos(id)
);
CREATE INDEX IX_reembolsos_idPagamento ON dbo.reembolsos(idPagamento);
GO

PRINT 'Estruturas do painel do usuário criadas com sucesso.';
