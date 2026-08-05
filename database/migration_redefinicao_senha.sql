-- Suporte a "esqueci minha senha": tokens de uso único, com expiração,
-- para o fluxo de redefinição de senha via link enviado por e-mail.

USE ConcursosDB;
GO

IF OBJECT_ID('dbo.redefinicoes_senha', 'U') IS NULL
BEGIN
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
END
GO
