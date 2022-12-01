
--- EXERCÍCIO 2 ---

-- Crie uma procedure que receba um valor cpf e busque
-- qual valor esse cpf já gastou. Depois faça outro select
-- buscando quais são os CPF's que já gastaram mais que ele.

CREATE OR ALTER PROC VALOR_GASTO @CPF VARCHAR(12)
AS 
    BEGIN

        DECLARE @GASTOS MONEY;
        
        SELECT @GASTOS = SUM(INF.PREÇO) FROM [NOTAS FISCAIS]nf JOIN
	    [ITENS NOTAS FISCAIS]INF ON INF.NUMERO = nf.NUMERO
     	WHERE nf.CPF = @CPF;

     	SELECT C.NOME, NF.CPF, SUM(INF.PREÇO * INF.QUANTIDADE) AS [GASTOS TOTAIS]
            FROM [NOTAS FISCAIS] NF

            JOIN [ITENS NOTAS FISCAIS] INF 
                ON INF.NUMERO = NF.NUMERO

            JOIN [TABELA DE CLIENTES] C 
                ON NF.CPF = C.CPF
                
            GROUP BY C.NOME, NF.CPF HAVING SUM(INF.PREÇO * INF.QUANTIDADE) > @GASTOS
        
        SELECT @GASTOS AS [GASTOS CPF ORIGINAL]

    END

EXEC VALOR_GASTO '19290992743';
