-- Crie uma trigger para a tabela aluno e uma para a 
-- professor que não permita deletes e ao invés disso 
-- atualize a coluna ATIVO para 0

CREATE OR ALTER TRIGGER DELETE_ALUNO
ON [ALUNO]
INSTEAD OF DELETE 
AS
    BEGIN
        DECLARE @NOME_ALUNO VARCHAR(100)
        SELECT @NOME_ALUNO = NOME FROM DELETED
        UPDATE [ALUNO] 
        SET ATIVO = 0
        WHERE NOME = @NOME_ALUNO
    END
