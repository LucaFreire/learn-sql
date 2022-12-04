-- Crie uma view que faça um select que mostre os nomes dos alunos,
-- o nome do curso que estão inscritos e o nome do professor responsável.
-- Ordene por nome do curso

CREATE OR ALTER VIEW INFO_ALUNOS AS
SELECT
    A.NOME ALUNO,
    C.NOME CURSO,
    P.NOME PROFESSOR
FROM [ALUNO] A
JOIN [ALUNO_TURMA] TA
    ON A.ID = TA.ID_TURMA
JOIN [TURMA] T
    ON TA.ID_TURMA = T.ID
JOIN [CURSO] C
    ON T.ID_CURSO = C.ID
JOIN [PROFESSOR] P
    ON T.ID_PROFESSOR = P.ID
    