-- 4 – Crie uma trigger para que quando uma disciplina  ou curso for inativado,
-- os registros da tabela ‘disciplina x curso’ que fazem referência à eles sejam
-- atualizadas na coluna ‘ativa’ para o valor ‘0’. E outra trigger para que quando
-- a coluna ‘ativa’ da tabela ‘disciplina x curso’ for atualizada para ‘0’,
-- todos os registros da tabela ‘turma’ que fazem referência à ela também sejam 
-- atualizadas para ‘0’ 


CREATE TRIGGER INATIVA2
ON [TABELA DISCIPLINA X CURSO] -- TRIGGER P/ DISCIPLINA X CURSO
AFTER UPDATE
AS 
    BEGIN
        DECLARE @S_N BIT

        SELECT @S_N = ATIVA FROM INSERTED

        IF @S_N = 0
            DECLARE @IDCURSO INT
            SELECT @IDCURSO = ID FROM INSERTED

            UPDATE [TABELA TURMA]
            SET ATIVA = 0
            WHERE ID_DISCIPLINA_CURSO = @IDCURSO
    END
