/* =========================================================
   Migração: rastreamento de atividade do usuário (para o
   indicador de "usuários online" no painel administrativo).
   Script ADITIVO e IDEMPOTENTE — seguro para rodar em cima
   de um banco ConcursosDB que já está em uso.
   ========================================================= */

USE ConcursosDB;
GO

IF COL_LENGTH('dbo.usuarios', 'ultimaAtividade') IS NULL
    ALTER TABLE dbo.usuarios ADD ultimaAtividade DATETIME2 NULL;
GO

PRINT 'Migração de atividade do usuário aplicada com sucesso.';
