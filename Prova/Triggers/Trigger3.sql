-- 4 – Crie uma trigger para que quando uma disciplina  ou curso for inativado,
-- os registros da tabela ‘disciplina x curso’ que fazem referência à eles sejam
-- atualizadas na coluna ‘ativa’ para o valor ‘0’. E outra trigger para que quando
-- a coluna ‘ativa’ da tabela ‘disciplina x curso’ for atualizada para ‘0’,
-- todos os registros da tabela ‘turma’ que fazem referência à ela também sejam 
-- atualizadas para ‘0’ 

CREATE TRIGGER INATIVA -- TRIGGER P/ CURSO
ON [TABELA CURSO]
AFTER UPDATE
AS 
    BEGIN
        DECLARE @IDCURSO INT
        DECLARE @S_N BIT

        SELECT @S_N = ATIVO FROM INSERTED

        IF @S_N = 1
            SELECT @IDCURSO = ID FROM INSERTED

            UPDATE [TABELA DISCIPLINA X CURSO]
            SET ATIVA = 0
            WHERE ID_CURSO = @IDCURSO
    END
