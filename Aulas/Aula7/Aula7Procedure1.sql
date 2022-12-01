------------- PROCEDURE -------------

CREATE OR ALTER PROCEDURE MostrarClientes @estado varchar(2)
AS 
    BEGIN
        SELECT * FROM [TABELA DE CLIENTES] WHERE ESTADO = @estado
    END 

EXECUTE MostrarClientes 'SP'  -- Vai mostrar todos os clientes que atendem o parâmetro ESTADO
