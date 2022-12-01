
-- SELECT * FROM [TABELA DE PRODUTOS]
-- SELECT * FROM [TABELA DE VENDEDORES]
-- SELECT * FROM [TABELA DE CLIENTES]


-- SELECT CLIENTE, SUM(TOTAL) FROM MOSTRAR GROUP BY(CLIENTE) -- Mostra o total de cada cliente 

-- SELECT * FROM MOSTRAR -- Caso chamado no próprio código, da erro (chame em outro lugar)



-- CREATE TABLE x (id int primary key identity, nome varchar(50))

-- Procedure com retorno

CREATE OR ALTER PROC RETURNID
    @nome VARCHAR(50),
    @id INT OUTPUT
AS
    BEGIN
        INSERT INTO x (nome) VALUES (@NOME)
        SELECT id FROM x ORDER BY  id DESC
    END 

declare @id int
exec RETURNID 'guilherme', @id=@id output
select @id
