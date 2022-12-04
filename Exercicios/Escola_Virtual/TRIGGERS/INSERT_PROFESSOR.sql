-- Crie uma trigger para as tabelas Aluno e Professor,
-- para que quando forem inseridos dados nestas tabelas,
-- faça também um insert na tabela HISTORICO_INSERCAO,
-- inserindo nesta o Id da pessoas que acabou de ser inerida,
-- a função (se o insert veio da tabela aluno insira “aluno” e
-- se veio da tabela professor insira “professor”) e a data atual.

CREATE TRIGGER HISTORICO_INSERCAO_PROFESSOR
ON PROFESSOR
AFTER INSERT
AS 
BEGIN
    DECLARE @ID_PROFESSOR INT
    SELECT @ID_PROFESSOR = ID FROM INSERTED

    INSERT INTO HISTORICO_INSERCAO(PROFESSOR_ID_HISTORICO,FUNCAO)
    VALUES(@ID_PROFESSOR,'PROFESSOR')
END

