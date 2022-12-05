-- que mostre o nome dos alunos que possuam boleto em atraso 

CREATE VIEW BOLETO_ATRASADO
AS 
    SELECT A.NOME NOME FROM [TABELA ALUNO] A
    JOIN  [TABELA PAGAMENTOS] P
    ON A.ID = P.ID_ALUNO
    WHERE P.SITUACAO = 'ATRASO' 
