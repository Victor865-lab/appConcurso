/* =========================================================
   Migração: Assinaturas (planos premium via Mercado Pago).
   Script ADITIVO e IDEMPOTENTE — seguro para rodar em cima
   de um banco ConcursosDB que já está em uso.
   ========================================================= */

USE ConcursosDB;
GO

IF OBJECT_ID('dbo.assinaturas', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.assinaturas (
        id                INT IDENTITY(1,1) PRIMARY KEY,
        idUsuario         INT NOT NULL,
        plano             NVARCHAR(20) NOT NULL,
        valor             DECIMAL(10,2) NOT NULL,
        emailPagador      NVARCHAR(150) NOT NULL,
        idPreapprovalMP   NVARCHAR(100) NULL,
        status            NVARCHAR(20) NOT NULL DEFAULT 'pendente',
        criadoEm          DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
        atualizadoEm      DATETIME2 NULL,
        CONSTRAINT FK_assinaturas_usuarios FOREIGN KEY (idUsuario) REFERENCES dbo.usuarios(id) ON DELETE CASCADE,
        CONSTRAINT CK_assinaturas_plano CHECK (plano IN ('mensal','trimestral','semestral','anual')),
        CONSTRAINT CK_assinaturas_status CHECK (status IN ('pendente','autorizada','cancelada','pausada'))
    );
    CREATE INDEX IX_assinaturas_idUsuario ON dbo.assinaturas(idUsuario);
    CREATE INDEX IX_assinaturas_idPreapprovalMP ON dbo.assinaturas(idPreapprovalMP);
END
GO

PRINT 'Migração de assinaturas aplicada com sucesso.';
