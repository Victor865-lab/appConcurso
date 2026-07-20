/* =========================================================
   Migração: Comentários e Denúncias de questões (Mapeamento).
   Script ADITIVO e IDEMPOTENTE — seguro para rodar em cima
   de um banco ConcursosDB que já está em uso.
   ========================================================= */

USE ConcursosDB;
GO

/* =========================================================
   1) Tabela: comentarios_questao
   ========================================================= */
IF OBJECT_ID('dbo.comentarios_questao', 'U') IS NULL
BEGIN
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
END
GO

/* =========================================================
   2) Tabela: denuncias_questao (reportar erro em uma questão)
   ========================================================= */
IF OBJECT_ID('dbo.denuncias_questao', 'U') IS NULL
BEGIN
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
END
GO

PRINT 'Migração de comentários e denúncias aplicada com sucesso.';
