CREATE OR ALTER PROC FindIdentity @ENTIDADE VARCHAR(20)
AS 
    BEGIN
        IF @ENTIDADE = 'CLIENTE'
            SELECT * FROM [TABELA DE CLIENTES]
        ELSE IF @ENTIDADE = 'VENDEDOR'
            SELECT * FROM [TABELA DE VENDEDORES]
        ELSE
            SELECT * FROM [TABELA DE PRODUTOS]
    END

EXEC FindIdentity 'CLIENTE' -- Vai mostrar a tabela do parâmetro
