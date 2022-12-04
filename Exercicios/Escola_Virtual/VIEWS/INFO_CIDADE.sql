-- Crie uma view que faça um select mostrando todas as cidades,
-- da tabela aluno e da tabela professor (use o UNION)

CREATE OR ALTER VIEW INFO_CIDADE AS
SELECT DISTINCT CIDADE
FROM [ALUNO]
UNION
SELECT DISTINCT CIDADE
FROM [PROFESSOR]
