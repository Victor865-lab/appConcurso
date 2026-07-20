/* =========================================================
   Migração: papel de acesso (RBAC) — distingue administrador
   de aluno, necessário para proteger rotas administrativas
   (CRUD de questões/temas/alternativas, listagem de usuários).
   Script ADITIVO e IDEMPOTENTE — seguro para rodar em cima
   de um banco ConcursosDB que já está em uso.

   Todo usuário existente ou novo entra como 'aluno' por padrão;
   promover a 'admin' é uma ação manual e deliberada (ver rodapé).
   ========================================================= */

USE ConcursosDB;
GO

IF COL_LENGTH('dbo.usuarios', 'role') IS NULL
    ALTER TABLE dbo.usuarios ADD role NVARCHAR(20) NOT NULL DEFAULT 'aluno';
GO

IF NOT EXISTS (SELECT 1 FROM sys.check_constraints WHERE name = 'CK_usuarios_role')
BEGIN
    ALTER TABLE dbo.usuarios
    ADD CONSTRAINT CK_usuarios_role CHECK (role IN ('aluno','admin'));
END
GO

PRINT 'Migração de RBAC (role) aplicada com sucesso.';

-- Para promover um usuário a admin manualmente:
-- UPDATE dbo.usuarios SET role = 'admin' WHERE nome = 'nome_do_usuario';
