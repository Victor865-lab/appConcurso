-- Adiciona e-mail como identificador alternativo de login.
-- "nome" continua existindo (nome de exibição); "email" é opcional para
-- contas antigas (login aceita nome OU email) e passa a ser exigido no
-- cadastro de contas novas a partir de agora.

USE ConcursosDB;
GO

IF NOT EXISTS (SELECT 1 FROM sys.columns WHERE object_id = OBJECT_ID('dbo.usuarios') AND name = 'email')
BEGIN
    ALTER TABLE dbo.usuarios ADD email NVARCHAR(255) NULL;
END
GO

-- Índice único filtrado: permite várias contas antigas com email NULL,
-- mas impede duplicidade entre contas que têm email cadastrado.
IF NOT EXISTS (SELECT 1 FROM sys.indexes WHERE name = 'UQ_usuarios_email' AND object_id = OBJECT_ID('dbo.usuarios'))
BEGIN
    CREATE UNIQUE INDEX UQ_usuarios_email ON dbo.usuarios(email) WHERE email IS NOT NULL;
END
GO
