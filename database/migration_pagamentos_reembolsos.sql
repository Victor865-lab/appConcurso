/* =========================================================
   Migração: Pagamentos e Reembolsos das assinaturas.
   Script ADITIVO e IDEMPOTENTE — seguro para rodar em cima
   de um banco ConcursosDB que já está em uso (mesmo que a
   tabela dbo.assinaturas já exista de uma migração anterior).
   ========================================================= */

USE ConcursosDB;
GO

/* =========================================================
   1) assinaturas: período de acesso (dataInicio/dataFim) e
      novo status "reembolsada" (direito de arrependimento,
      CDC art. 49).
   ========================================================= */
IF COL_LENGTH('dbo.assinaturas', 'dataInicio') IS NULL
    ALTER TABLE dbo.assinaturas ADD dataInicio DATETIME2 NULL;
GO

IF COL_LENGTH('dbo.assinaturas', 'dataFim') IS NULL
    ALTER TABLE dbo.assinaturas ADD dataFim DATETIME2 NULL;
GO

IF COL_LENGTH('dbo.assinaturas', 'metodoPagamento') IS NULL
    ALTER TABLE dbo.assinaturas ADD metodoPagamento NVARCHAR(20) NULL;
GO

IF EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = 'CK_assinaturas_status')
    ALTER TABLE dbo.assinaturas DROP CONSTRAINT CK_assinaturas_status;
GO

ALTER TABLE dbo.assinaturas
ADD CONSTRAINT CK_assinaturas_status CHECK (status IN ('pendente','autorizada','pausada','cancelada','reembolsada'));
GO

IF NOT EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = 'CK_assinaturas_metodoPagamento')
BEGIN
    ALTER TABLE dbo.assinaturas
    ADD CONSTRAINT CK_assinaturas_metodoPagamento CHECK (metodoPagamento IS NULL OR metodoPagamento IN ('cartao', 'pix'));
END
GO

/* =========================================================
   2) Tabela: pagamentos (cada cobrança individual, recorrente
      ou avulsa, de uma assinatura)
   ========================================================= */
IF OBJECT_ID('dbo.pagamentos', 'U') IS NULL
BEGIN
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
END
GO

/* =========================================================
   3) Tabela: reembolsos (estorno de um pagamento específico,
      com o comprovante bruto devolvido pelo gateway)
   ========================================================= */
IF OBJECT_ID('dbo.reembolsos', 'U') IS NULL
BEGIN
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
END
GO

PRINT 'Migração de pagamentos e reembolsos aplicada com sucesso.';
