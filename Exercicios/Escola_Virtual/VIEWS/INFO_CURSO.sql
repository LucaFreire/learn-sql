-- Crie uma view que faça um select mostrando o nome de todos
-- os cursos que já iniciaram (data de inicio maior que a data atual)
-- e que terminam antes do dia 01/06/2023

CREATE OR ALTER VIEW INFO_CURSO AS
SELECT C.NOME FROM [CURSO] C
    JOIN [TURMA] T
        ON T.ID_CURSO = C.ID
    WHERE T.DATA_INICIO >= GETDATE() AND
        T.DATA_FIM < '01/06/2023';
