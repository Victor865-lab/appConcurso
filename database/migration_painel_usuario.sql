/* =========================================================
   Migração: Painel do Usuário (gamificação, mapeamento,
   simulados e ranking).
   Script ADITIVO e IDEMPOTENTE — seguro para rodar em cima
   de um banco ConcursosDB que já está em uso.
   ========================================================= */

USE ConcursosDB;
GO

/* =========================================================
   1) Tabela: temas
   ========================================================= */
IF OBJECT_ID('dbo.temas', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.temas (
        id        INT IDENTITY(1,1) PRIMARY KEY,
        nome      NVARCHAR(120) NOT NULL,
        criadoEm  DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        CONSTRAINT UQ_temas_nome UNIQUE (nome)
    );
END
GO

/* =========================================================
   2) Novas colunas em questoes: idTema, banca, ano, dificuldade
   ========================================================= */
IF COL_LENGTH('dbo.questoes', 'idTema') IS NULL
    ALTER TABLE dbo.questoes ADD idTema INT NULL;
GO

IF COL_LENGTH('dbo.questoes', 'banca') IS NULL
    ALTER TABLE dbo.questoes ADD banca NVARCHAR(100) NULL;
GO

IF COL_LENGTH('dbo.questoes', 'ano') IS NULL
    ALTER TABLE dbo.questoes ADD ano SMALLINT NULL;
GO

IF COL_LENGTH('dbo.questoes', 'dificuldade') IS NULL
    ALTER TABLE dbo.questoes ADD dificuldade NVARCHAR(10) NULL;
GO

IF NOT EXISTS (SELECT 1 FROM sys.foreign_keys WHERE name = 'FK_questoes_temas')
BEGIN
    ALTER TABLE dbo.questoes
    ADD CONSTRAINT FK_questoes_temas FOREIGN KEY (idTema) REFERENCES dbo.temas(id);
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = 'CK_questoes_dificuldade')
BEGIN
    ALTER TABLE dbo.questoes
    ADD CONSTRAINT CK_questoes_dificuldade CHECK (dificuldade IN ('facil','medio','dificil'));
END
GO

IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_questoes_idTema')
    CREATE INDEX IX_questoes_idTema ON dbo.questoes(idTema);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_questoes_banca')
    CREATE INDEX IX_questoes_banca ON dbo.questoes(banca);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_questoes_ano')
    CREATE INDEX IX_questoes_ano ON dbo.questoes(ano);
GO
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'IX_questoes_dificuldade')
    CREATE INDEX IX_questoes_dificuldade ON dbo.questoes(dificuldade);
GO

/* =========================================================
   3) Novas colunas em usuarios: streak de acessos
   ========================================================= */
IF COL_LENGTH('dbo.usuarios', 'streakAtual') IS NULL
    ALTER TABLE dbo.usuarios ADD streakAtual INT NOT NULL DEFAULT 0;
GO
IF COL_LENGTH('dbo.usuarios', 'streakRecorde') IS NULL
    ALTER TABLE dbo.usuarios ADD streakRecorde INT NOT NULL DEFAULT 0;
GO
IF COL_LENGTH('dbo.usuarios', 'ultimoAcesso') IS NULL
    ALTER TABLE dbo.usuarios ADD ultimoAcesso DATE NULL;
GO

/* =========================================================
   4) Tabela: acessos_usuario (calendário de entradas no site)
   ========================================================= */
IF OBJECT_ID('dbo.acessos_usuario', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.acessos_usuario (
        id          INT IDENTITY(1,1) PRIMARY KEY,
        idUsuario   INT NOT NULL,
        dataAcesso  DATE NOT NULL,
        quantidade  INT NOT NULL DEFAULT 1,
        CONSTRAINT FK_acessos_usuario FOREIGN KEY (idUsuario) REFERENCES dbo.usuarios(id) ON DELETE CASCADE,
        CONSTRAINT UQ_acessos_usuario_data UNIQUE (idUsuario, dataAcesso)
    );
    CREATE INDEX IX_acessos_usuario_idUsuario ON dbo.acessos_usuario(idUsuario);
END
GO

/* =========================================================
   5) Tabela: simulados
   ========================================================= */
IF OBJECT_ID('dbo.simulados', 'U') IS NULL
BEGIN
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
END
GO

/* =========================================================
   6) Tabela: simulado_questoes (snapshot das questões sorteadas)
   ========================================================= */
IF OBJECT_ID('dbo.simulado_questoes', 'U') IS NULL
BEGIN
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
END
GO

/* =========================================================
   7) Tabela: respostas_usuario (histórico de respostas,
      base de pontuação, progresso e mapeamento)
   ========================================================= */
IF OBJECT_ID('dbo.respostas_usuario', 'U') IS NULL
BEGIN
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
        CONSTRAINT FK_respostas_simulados FOREIGN KEY (idSimulado) REFERENCES dbo.simulados(id) ON DELETE NO ACTION
    );
    CREATE INDEX IX_respostas_idUsuario ON dbo.respostas_usuario(idUsuario);
    CREATE INDEX IX_respostas_idQuestao ON dbo.respostas_usuario(idQuestao);
    CREATE INDEX IX_respostas_respondidoEm ON dbo.respostas_usuario(respondidoEm);
    CREATE INDEX IX_respostas_idSimulado ON dbo.respostas_usuario(idSimulado);
END
GO

PRINT 'Migração do painel do usuário aplicada com sucesso.';
