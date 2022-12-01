use NOTAS_FISCAIS

-- Maneira que fiz
SELECT * FROM [TABELA DE CLIENTES] AS TC
LEFT JOIN [NOTAS FISCAIS] AS NF
ON NF.CPF = TC.CPF
WHERE NF.CPF IS NULL

-- Mesma coisa com group by
SELECT C.NOME, COUNT(NF.CPF) AS 'Quantidade'
FROM [TABELA DE CLIENTES] AS C LEFT JOIN [NOTAS FISCAIS] NF
ON C.CPF = NF.CPF
GROUP BY C.NOME
HAVING COUNT(NF.CPF) = 0;

-- Mesma coisa com order by
SELECT C.NOME, COUNT(NF.CPF) AS 'Quantidade'
FROM [TABELA DE CLIENTES] AS C LEFT JOIN [NOTAS FISCAIS] NF
ON C.CPF = NF.CPF
GROUP BY C.NOME
order by (COUNT(NF.CPF)) desc

-- Comando UNION (JUNTA OS SELECTS) (DISTINCT COMO PADRÃO)
SELECT [TABELA DE CLIENTES].BAIRRO FROM [TABELA DE CLIENTES]
UNION
SELECT [TABELA DE VENDEDORES].BAIRRO FROM [TABELA DE VENDEDORES]

-- Comando UNION (SEM O DISTINCT COMO PADRÃO)
SELECT [TABELA DE CLIENTES].BAIRRO FROM [TABELA DE CLIENTES]
UNION ALL
SELECT [TABELA DE VENDEDORES].BAIRRO FROM [TABELA DE VENDEDORES]

-- Comando IN  Mostra clientes que moram em mesmo bairro que vendedores
SELECT NOME, BAIRRO FROM [TABELA DE CLIENTES]
WHERE BAIRRO IN (SELECT BAIRRO FROM [TABELA DE VENDEDORES])

---------------------------------------------------------------------------
---- Exercício ----

-- Encontrar todos os livros de uma editora (sem usar o join)

CREATE DATABASE AULA6_2

USE AULA6_2

CREATE TABLE EDITORA(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    NOME VARCHAR(40) 
);

CREATE TABLE LIVROS(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    NOME VARCHAR(40),
    ID_EDITORA INT FOREIGN KEY REFERENCES EDITORA(ID)
);


INSERT INTO EDITORA(NOME)
VALUES
    ('Editora 1'),
    ('cia das letras'),
    ('outra editora ae');

INSERT INTO LIVROS(NOME,ID_EDITORA)
VALUES
    ('Livro 1',1),
    ('Pequeno Príncipe',2),
    ('1984',3),
    ('Senhor das Moscas',1),
    ('Pai Rico Pai Pobre',2),
    ('Outro Livro ae',3),
    ('Livro Random',1),
    ('Mitologia Nórdica',2),
    ('Bíblia',1),
    ('Glossário',2);


SELECT * FROM [LIVROS]
WHERE ID_EDITORA = (
    SELECT ID FROM [EDITORA]
        WHERE NOME = 'cia das letras');

---------------------------------------------------------------------------
---- Exercício ----

-- Inserir valores em uma tabela com select -- 

USE NOTAS_FISCAIS

CREATE TABLE PRODUTOS_CAROS
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    NOME VARCHAR(100),
    PRECO SMALLMONEY
)

-- Inserindo Valores com uma condição
INSERT INTO PRODUTOS_CAROS(NOME,PRECO)
(
    SELECT [NOME DO PRODUTO], [PREÇO DE LISTA] FROM [TABELA DE PRODUTOS] AS T
    WHERE T.[PREÇO DE LISTA] > 15
) 

SELECT * FROM PRODUTOS_CAROS

use NOTAS_FISCAIS

-- SELECT * FROM MOSTRAR -- VIEW Aula 7
