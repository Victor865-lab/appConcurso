-- Limpa completamente as questões e tudo que depende delas, preparando
-- o banco para reinserção do zero (via database/resetar_questoes.js).
--
-- ATENÇÃO: apaga também simulados, respostas, comentários e denúncias
-- de TODOS os usuários — só rode isso se não houver progresso real de
-- aluno que precise ser preservado (confirmar antes de rodar em produção).

USE ConcursosDB;
GO

BEGIN TRANSACTION;
BEGIN TRY
    IF OBJECT_ID('dbo.respostas_usuario', 'U') IS NOT NULL
        DELETE FROM dbo.respostas_usuario;

    IF OBJECT_ID('dbo.simulado_questoes', 'U') IS NOT NULL
        DELETE FROM dbo.simulado_questoes;

    IF OBJECT_ID('dbo.comentarios_questao', 'U') IS NOT NULL
        DELETE FROM dbo.comentarios_questao;

    IF OBJECT_ID('dbo.denuncias_questao', 'U') IS NOT NULL
        DELETE FROM dbo.denuncias_questao;

    IF OBJECT_ID('dbo.simulados', 'U') IS NOT NULL
        DELETE FROM dbo.simulados;

    IF OBJECT_ID('dbo.alternativas', 'U') IS NOT NULL
        DELETE FROM dbo.alternativas;

    IF OBJECT_ID('dbo.questoes', 'U') IS NOT NULL
        DELETE FROM dbo.questoes;

    -- Reseta os contadores de identidade para os IDs recomeçarem do 1,
    -- deixando o banco como se estivesse recém-instalado.
    IF OBJECT_ID('dbo.questoes', 'U') IS NOT NULL
        DBCC CHECKIDENT ('dbo.questoes', RESEED, 0);
    IF OBJECT_ID('dbo.alternativas', 'U') IS NOT NULL
        DBCC CHECKIDENT ('dbo.alternativas', RESEED, 0);
    IF OBJECT_ID('dbo.simulados', 'U') IS NOT NULL
        DBCC CHECKIDENT ('dbo.simulados', RESEED, 0);
    IF OBJECT_ID('dbo.simulado_questoes', 'U') IS NOT NULL
        DBCC CHECKIDENT ('dbo.simulado_questoes', RESEED, 0);
    IF OBJECT_ID('dbo.respostas_usuario', 'U') IS NOT NULL
        DBCC CHECKIDENT ('dbo.respostas_usuario', RESEED, 0);
    IF OBJECT_ID('dbo.comentarios_questao', 'U') IS NOT NULL
        DBCC CHECKIDENT ('dbo.comentarios_questao', RESEED, 0);
    IF OBJECT_ID('dbo.denuncias_questao', 'U') IS NOT NULL
        DBCC CHECKIDENT ('dbo.denuncias_questao', RESEED, 0);

    -- Os temas (dbo.temas) são preservados de propósito — cada arquivo
    -- de insert os recria via "IF NOT EXISTS" e reaproveita os mesmos
    -- nomes/ids onde já existirem.

    COMMIT TRANSACTION;
    PRINT 'Questões, alternativas, simulados, respostas, comentários e denúncias apagados. IDs resetados.';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
    THROW;
END CATCH;
GO
