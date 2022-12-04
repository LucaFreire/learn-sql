-- Crie uma trigger para a tabela aluno e uma para a 
-- professor que não permita deletes e ao invés disso 
-- atualize a coluna ATIVO para 0

CREATE OR ALTER TRIGGER DELETE_PROFESSOR 
ON [PROFESSOR]
INSTEAD OF DELETE 
AS
    BEGIN
        DECLARE @NOME_PROF VARCHAR(100)
        SELECT @NOME_PROF = NOME FROM DELETED
        UPDATE [PROFESSOR] 
        SET ATIVO = 0
        WHERE NOME = @NOME_PROF
    END
