--- EXERCÍCIO 1 ---

-- Crie uma procedure que receba um CPF e um ano e retorne
-- por parametro de saida a quantidade de notas fiscais que ele
-- teve neste ano e tambem qual foi o valor que ele gastou nesse ano

CREATE OR ALTER PROC CPF_ANO 

@CPF VARCHAR(12),
@ANO DATE,
@QTD_NOTAS INT OUTPUT,
@VALOR_GASTO MONEY OUTPUT

AS 
    BEGIN

        SELECT @QTD_NOTAS = COUNT(*) FROM [NOTAS FISCAIS] AS N
            WHERE YEAR(N.DATA) = YEAR(@ANO) AND N.CPF = @CPF
    

        SELECT @VALOR_GASTO = SUM(INF.PREÇO * INF.QUANTIDADE) 
            FROM [NOTAS FISCAIS] AS NF 
            JOIN [TABELA DE CLIENTES] AS C
                ON NF.CPF = C.CPF
            JOIN [ITENS NOTAS FISCAIS] AS INF
                ON NF.NUMERO = INF.NUMERO
            WHERE @CPF = NF.CPF

    END
    

DECLARE @VALOR_GASTO2 MONEY

DECLARE @QTD_NOTAS2 INT

EXEC CPF_ANO '19290992743','10/10/2015', @QTD_NOTAS = @QTD_NOTAS2 OUTPUT, @VALOR_GASTO = @VALOR_GASTO2 OUTPUT

SELECT @VALOR_GASTO2 AS [VALOR GASTO]

SELECT @QTD_NOTAS2 AS [QUANTIDADE DE NOTAS]
