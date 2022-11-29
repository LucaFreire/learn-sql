USE Aula5

-- Criação de valor padrão usando DEFAULT

create table funcionario(
id int,
nome varchar(30),
dia_pgto int default 05)

-- insert sem especificar valor para o campo com default

insert funcionario (id, nome) values(3, 'guilherme')

select * from funcionario

-- insert especificando valor para o campo com default

insert funcionario values(4, 'guilherme', 10)


-- colocando regras para as colunas com o CHECK
-- regra em uma coluna int

create table funcionario2(
id int,
nome varchar(30),
dia_pgto int default 5, 
check( dia_pgto <31) )

insert funcionario2 values(4, 'guilherme', 30)

-- regra em uma coluna char
create table pessoa(
id int,
nome varchar(30),
estado_civil char, 
check( estado_civil= 's'or estado_civil= 'c' 
or estado_civil= 'd'or estado_civil= 'v' ) )

-- variação da mesma regra da tabela anterior porem usando o IN
create table pessoa2(
id int,
nome varchar(30),
estado_civil char, 
check( estado_civil in ('s', 'c', 'd', 'v' ) )
)

insert pessoa values(1, 'guilherme', 'v')


-- criação de Default e Check após a tabela ja criada

create table teste_check(
id int,
estado_civil char,
dia_pgto int)

alter table teste_check
add constraint Default_dia_pgto Default 5 for dia_pgto

alter table teste_check
add constraint check_estado_civil 
check(estado_civil in('s','c','v','d'))

------------------------------------------------------------------
-- USE NOTAS_FISCAIS

-- SELECT

-- Uso de DISTINCT (Não  mostra valores repetidos)
SELECT DISTINCT [NOME DO PRODUTO], EMBALAGEM ,TAMANHO
FROM [TABELA DE PRODUTOS]


-- Uso do comando TOP (Mostra todos os TOP<Num> primeiro valores da tabela)
SELECT TOP 10 * FROM [TABELA DE PRODUTOS]
WHERE [PREÇO DE LISTA] > 7


-- Uso do Order By (Crescente)
SELECT * FROM [TABELA DE PRODUTOS]
WHERE SABOR  = 'laranja'
ORDER BY [PREÇO DE LISTA]

-- Uso do Order By (Decrescente)
SELECT * FROM [TABELA DE PRODUTOS]
WHERE SABOR  = 'laranja'
ORDER BY [PREÇO DE LISTA] DESC

-- Mostre o produto mais caro entre os produtos que sejam pet de 1 litro
SELECT TOP 1 * FROM [TABELA DE PRODUTOS]
WHERE EMBALAGEM = 'PET' AND TAMANHO = '1 Litro'
ORDER BY [PREÇO DE LISTA] DESC



-- SELECT

-- Uso de DISTINCT (Não  mostra valores repetidos)
SELECT DISTINCT [NOME DO PRODUTO], EMBALAGEM ,TAMANHO
FROM [TABELA DE PRODUTOS]


-- Uso do comando TOP (Mostra todos os TOP<Num> primeiro valores da tabela)
SELECT TOP 10 * FROM [TABELA DE PRODUTOS]
WHERE [PREÇO DE LISTA] > 7


-- Uso do Order By (Crescente)
SELECT * FROM [TABELA DE PRODUTOS]
WHERE SABOR  = 'laranja'
ORDER BY [PREÇO DE LISTA]

-- Uso do Order By (Decrescente)
SELECT * FROM [TABELA DE PRODUTOS]
WHERE SABOR  = 'laranja'
ORDER BY [PREÇO DE LISTA] DESC


-- Mostre o produto mais caro entre os produtos que sejam pet de 1 litro
SELECT TOP 1 * FROM [TABELA DE PRODUTOS]
WHERE EMBALAGEM = 'PET' AND TAMANHO = '1 Litro'
ORDER BY [PREÇO DE LISTA] DESC


-- Select mostrando por agrupamento de estado e somando o limite de credito
SELECT ESTADO, SUM([LIMITE DE CREDITO]) AS [LIMITE DE CREDITO]
FROM [TABELA DE CLIENTES]
GROUP BY (ESTADO)
ORDER BY ([LIMITE DE CREDITO]) DESC


-- Mostra os estados que tem a soma do limite de credito maior que 90000
SELECT ESTADO, SUM([LIMITE DE CREDITO]) AS [LIMITE DE CREDITO]
FROM [TABELA DE CLIENTES]
GROUP BY ESTADO HAVING SUM([LIMITE DE CREDITO]) > 90000


-- Select 
SELECT ESTADO, SUM([VOLUME DE COMPRA]) AS Volume
FROM [TABELA DE CLIENTES]
GROUP BY ESTADO HAVING SUM([VOLUME DE COMPRA]) > 150000


-- Qtd. Sexo M e F por estado
SELECT 
	ESTADO,
	COUNT(CASE [SEXO] WHEN 'F' THEN 1 ELSE NULL END) AS 'Qtd. Sexo Femenino',
	COUNT(CASE [SEXO] WHEN 'M' THEN 1 ELSE NULL END) AS 'Qtd. Sexo Masculino'
FROM [TABELA DE CLIENTES]
GROUP BY (ESTADO)


-- Uso do case
SELECT 
	[NOME DO PRODUTO],
	[PREÇO DE LISTA], 
	CASE
		WHEN [PREÇO DE LISTA] >= 12  
			THEN 'Produto Caro'
		WHEN [PREÇO DE LISTA] >=7 AND [PREÇO DE LISTA] <12 
			THEN 'Produto Médio'
		ELSE 'Produto Barato' 
	END AS [Avaliação]
FROM [TABELA DE PRODUTOS]


SELECT
	YEAR([DATA]),
	COUNT(*)
FROM [NOTAS FISCAIS]
GROUP BY YEAR([DATA])

