----------------- Criando uma view ----------------------------

-- SELECT que mostra o nome do cliente , vendedor e o nome do produto vendido
 -- USE [NOTAS FISCAIS]
CREATE OR ALTER VIEW MOSTRAR AS 

    SELECT V.NOME AS [VENDEDOR], C.NOME AS [CLIENTE], P.[NOME DO PRODUTO], 
    INF.QUANTIDADE AS [QTD.], INF.PREÇO,  INF.QUANTIDADE * INF.PREÇO AS TOTAL
    FROM [TABELA DE VENDEDORES] V

        JOIN [NOTAS FISCAIS] AS NF
            ON V.MATRICULA = NF.MATRICULA

        JOIN [ITENS NOTAS FISCAIS] AS INF
            ON INF.NUMERO = NF.NUMERO

        JOIN [TABELA DE CLIENTES] AS C
            ON C.CPF = NF.CPF

        JOIN [TABELA DE PRODUTOS] AS P
            ON P.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO] 
        
