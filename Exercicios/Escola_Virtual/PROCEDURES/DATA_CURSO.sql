-- Faça uma procedure que receba uma data e mostre os
-- cursos que começaram antes dessa data e ainda não terminaram.

CREATE OR ALTER PROC DATA_CURSO @DATA DATE
AS 
    BEGIN
        SELECT * FROM [CURSO] C
        JOIN [TURMA] T
        ON C.ID = T.ID_CURSO
        WHERE T.DATA_INICIO < @DATA AND T.DATA_FIM > @DATA
    END
