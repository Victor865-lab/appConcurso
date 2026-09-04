/* =========================================================
   Migração: Status de acesso administrativo por usuário.
   Permite que um admin, individualmente por usuário:
     - "bloqueado": force a exigência de assinatura ativa para
       este usuário, mesmo que EXIGIR_ASSINATURA esteja "false"
       globalmente (ou seja, obriga esse usuário específico a
       pagar para continuar acessando o conteúdo).
     - "premium": libere o acesso deste usuário sem exigir
       assinatura ativa, mesmo que EXIGIR_ASSINATURA esteja
       "true" globalmente (acesso premium concedido manualmente).
     - "padrao" (default): segue a regra global de EXIGIR_ASSINATURA,
       comportamento inalterado em relação ao que já existia.
   Script ADITIVO e IDEMPOTENTE — seguro para rodar em cima de um
   banco ConcursosDB que já está em uso.
   ========================================================= */

USE ConcursosDB;
GO

IF COL_LENGTH('dbo.usuarios', 'statusAcesso') IS NULL
BEGIN
    ALTER TABLE dbo.usuarios
        ADD statusAcesso NVARCHAR(20) NOT NULL
            CONSTRAINT DF_usuarios_statusAcesso DEFAULT ('padrao')
            CONSTRAINT CK_usuarios_statusAcesso CHECK (statusAcesso IN ('padrao', 'bloqueado', 'premium'));
END
GO

PRINT 'Migração de status de acesso aplicada com sucesso.';
