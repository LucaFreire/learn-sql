-- Faça uma procedure que receba um cpf e um valor do tipo BIT.
-- Se o valor do BIT for 1 mostre os cursos em que esse CPF
-- está inscrito e que já terminaram, se o valor do BIT for 0,
-- mostre os cursos em que esse CPF está inscrito e que 
-- ainda estão em andamento

CREATE OR ALTER PROC CPF_BIT @CPF VARCHAR(12), @BIT BIT
AS 
    BEGIN
        IF @BIT = 1
        (
            SELECT C.NOME FROM [CURSO] C
            JOIN [TURMA] T
                ON C.ID = T.ID_CURSO
            JOIN [ALUNO_TURMA] TA
                ON T.ID = TA.ID_TURMA
            JOIN [ALUNO] A
                ON TA.ID_ALUNO = A.ID 
            WHERE A.CPF = @CPF AND T.DATA_FIM < GETDATE()
        )
        ELSE
        (
            SELECT C.NOME FROM [CURSO] C
            JOIN [TURMA] T
                ON C.ID = T.ID_CURSO
            JOIN [ALUNO_TURMA] TA
                ON T.ID = TA.ID_TURMA
            JOIN [ALUNO] A
                ON TA.ID_ALUNO = A.ID 
            WHERE A.CPF = @CPF AND T.DATA_FIM > GETDATE()
        )
    END
    