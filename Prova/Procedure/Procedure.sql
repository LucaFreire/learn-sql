--- Faça um update na tabela pagamento, colocando na coluna ‘situação’
-- o status de ‘em atraso’ para todos os boleto cujo a data seja maior 
-- que a data atual e a coluna ‘situação’ esteja como ‘pendente’

CREATE PROC ATUALIZA_SIT
AS
    BEGIN
        DECLARE @SIT VARCHAR(50) 
        DECLARE @DATA DATE

        SELECT @SIT = SITUACAO FROM [TABELA PAGAMENTOS]
        SELECT @DATA = BOLETO FROM [TABELA PAGAMENTOS]
        
        IF @SIT = 'PENDENTE' AND @DATA < GETDATE()
            UPDATE [TABELA PAGAMENTOS]
            SET SITUACAO = 'EM ATRASO' 
    END


