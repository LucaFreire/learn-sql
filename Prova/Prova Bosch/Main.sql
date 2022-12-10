--4 Selecione todos os funcionários que começam com a letra D,
-- exiba o nome, nome do setor e entre esses qual tem o maior salário.
SELECT TOP 1 F.NOME,
D.DEP_NOME SETOR,
F.SALARIO 
FROM [FUNCIONARIOS] F

JOIN [DEPARTAMENTOS] D
    ON D.ID = F.DEP_ID
WHERE F.NOME LIKE 'D%' 
ORDER BY F.SALARIO DESC


-- 5. Exiba o nome, o nome do departamento e o local de trabalho de cada funcionário. 
SELECT F.NOME,
D.DEP_NOME DEPARTAMENTO,
D.DEP_LOCAL [LOCAL]
FROM [FUNCIONARIOS] F

JOIN [DEPARTAMENTOS] D
    ON D.ID = F.DEP_ID

-- 6. O líder Jonas abriu o próprio negócio, levou seus liderados com ele.
-- Delete esses funcionários do banco, some o valor dos seus salários,
-- reparta igualmente entre o restante dos funcionários do setor e atualize na tabela.



-- 7. Verifique o nome, edv e líder do funcionário mais velho, 
-- e confira em qual grade salarial ele pertence.

SELECT * FROM FUNCIONARIOS F
WHERE DATA_CONTRATACAO = (SELECT MIN(DATA_CONTRATACAO))

