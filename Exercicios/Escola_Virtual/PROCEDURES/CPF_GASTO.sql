-- Faça uma procedure que receba um CPF e retorne 
-- (por parâmetro de saída) todo o valor já gasto por este cpf

CREATE OR ALTER PROC CPF_GASTO
@CPF VARCHAR(12),
@VALOR FLOAT OUTPUT
AS 
    BEGIN
        SELECT @VALOR = SUM(C.VALOR) FROM [CURSO] C
        JOIN [TURMA] T
            ON C.ID = T.ID_CURSO
        JOIN [ALUNO_TURMA] TA
            ON TA.ID_TURMA = T.ID
        JOIN [ALUNO] A
            ON TA.ID_ALUNO = A.ID 
        WHERE A.CPF = @CPF
        GROUP BY A.NOME
    END
