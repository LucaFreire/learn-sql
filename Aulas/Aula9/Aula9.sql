
CREATE TABLE FATURAMENTO
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    DATAPRODUTO DATE DEFAULT GETDATE(),
    VALORATUAL MONEY 
);

INSERT INTO [ITENS NOTAS FISCAIS] -- Inserindo valores para popular a tabela da trigger
    VALUES(105, 1101035, 5, 50)

SELECT * FROM FATURAMENTO -- Mostrando a tabela da trigger 
