-- USE MASTER

CREATE DATABASE ESTACIONAMENTO

USE ESTACIONAMENTO


CREATE TABLE CLIENTE(
    CPF VARCHAR(12) PRIMARY KEY,
    NOME VARCHAR(30),
    DT_NASC DATE
);

CREATE TABLE MODELO(
    ID INT IDENTITY (1,1) PRIMARY KEY,
    NOME VARCHAR(40)
);

CREATE TABLE PATIO(
    ID INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
    ENDERECO VARCHAR(40),
    CAPACIDADE INT
);

CREATE TABLE VEICULO(
    ID VARCHAR(9) PRIMARY KEY,
    MODELO_COD INT FOREIGN KEY REFERENCES MODELO(ID),
    CLIENTE_CPF VARCHAR(12) FOREIGN KEY REFERENCES CLIENTE(CPF),
    COR VARCHAR(20)
);

CREATE TABLE ESTACIONA(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    PATIO_ID INT FOREIGN KEY REFERENCES PATIO(ID),
    VEICULO_ID VARCHAR(9) NOT NULL FOREIGN KEY REFERENCES VEICULO(ID),
    DT_ENTRADA DATE NOT NULL DEFAULT GETDATE(),
    DT_SAIDA DATE,
    HORAS_ENTRADA TIME NOT NULL DEFAULT GETDATE(),
);


INSERT INTO CLIENTE(CPF, NOME, DT_NASC)
VALUES
    ('12345678912','Zézin','08/11/2004'),
    ('12345678913','Pedro','12/11/2004'),
    ('12345678914','Lucas','02/11/2005'),
    ('12345678915','JÃO','10/11/2002')

INSERT INTO MODELO(NOME)
VALUES
    ('2004'),
    ('2004'),
    ('2006'),
    ('2007')

INSERT INTO PATIO(ENDERECO, CAPACIDADE)
VALUES
    ('RUA1',5),
    ('RUA2',6),
    ('RUA3',7),
    ('RUA4',8)

INSERT INTO VEICULO(ID,COR,MODELO_COD,CLIENTE_CPF)
VALUES
    ('PLACA1','AZUL',1,'12345678912'),
    ('PLACA2','PRETO',2,'12345678913'),
    ('PLACA3','BRANCO',3,'12345678914'),
    ('PLACA4','VERMELHO',4,'12345678915')

INSERT INTO ESTACIONA(DT_SAIDA,VEICULO_ID, PATIO_ID)
VALUES
    ('10/12/2033','PLACA1',1),
    ('12/02/2034','PLACA2',2),
    ('11/02/2024','PLACA3',3),
    ('11/02/2044','PLACA4',4)


UPDATE CLIENTE SET NOME ='Thigas' WHERE CPF = '12345678912' -- Cpf's nome p/ Thigas

----- LETRAS -----

-- a) Exiba a placa e o nome dos donos de todos os veículos.
SELECT V.ID AS PLACAS,
C.NOME
FROM CLIENTE C
    JOIN VEICULO V 
        ON C.CPF = V.CLIENTE_CPF 

-- Inserindo valores p/ fazer a b
INSERT INTO CLIENTE(CPF, NOME, DT_NASC) VALUES ('12345688912','Dedélas','08/11/2004')
INSERT INTO MODELO(NOME) VALUES ('2008')
INSERT INTO PATIO(ENDERECO, CAPACIDADE) VALUES ('RUA1',5)
INSERT INTO VEICULO(ID,COR,MODELO_COD,CLIENTE_CPF) VALUES ('JJJ-2020','ROXO',5,'12345688912')
INSERT INTO ESTACIONA(DT_SAIDA,VEICULO_ID, PATIO_ID) VALUES ('11/11/2030','JJJ-2020',5)

--b) Exiba o CPF e o nome do cliente que possui o veiculo de placa “JJJ-2020”
SELECT C.CPF AS CPF,
C.NOME,
V.ID AS PLACA
FROM [VEICULO] V
    JOIN [CLIENTE] C 
        ON C.CPF= V.CLIENTE_CPF
    WHERE V.ID ='JJJ-2020' 

--c) Exiba a placa e a cor do veículo que possui o código de estacionamento 1.
SELECT V.COR,
V.ID AS PLACA
FROM [VEICULO] V
    JOIN [ESTACIONA] E
        ON E.VEICULO_ID = V.ID
    WHERE E.ID = 1

--d) Exiba a placa e o ano do veículo que possui o código de estacionamento 1.
SELECT V.ID [PLACA],
M.NOME [ANO]
FROM [MODELO] M
    JOIN [VEICULO] V
        ON M.ID = V.MODELO_COD
    JOIN [ESTACIONA] E
        ON E.VEICULO_ID = V.ID
    WHERE E.ID = 1

-- e) Exiba a placa, o ano do veículo e a descrição de seu modelo,
-- se ele possuir ano a partir de 2000. 
SELECT V.ID [PLACA],
M.NOME [ANO]
FROM [MODELO] M
    JOIN [VEICULO] V
        ON M.ID = V.MODELO_COD
    WHERE M.NOME > 2000


-- Inserindo Valores P/ fazer a f
INSERT INTO CLIENTE(CPF, NOME, DT_NASC) VALUES ('12345688990','Carikas','08/11/2004')
INSERT INTO MODELO(NOME) VALUES ('1990')
INSERT INTO PATIO(ENDERECO, CAPACIDADE) VALUES ('RUA1',5)
INSERT INTO VEICULO(ID,COR,MODELO_COD,CLIENTE_CPF) VALUES ('JEG 1010','ROXO',5,'12345688912')
INSERT INTO ESTACIONA(DT_ENTRADA,DT_SAIDA,VEICULO_ID, PATIO_ID) VALUES ('10/10/2010','11/11/2030','JEG 1010',5)

-- f) Exiba o endereço, a data de entrada e de saída dos
-- estacionamentos do veículo de placa “JEG 1010”.
SELECT P.ENDERECO,
E.DT_ENTRADA,
E.DT_SAIDA
FROM [PATIO] P
    JOIN [ESTACIONA] E
        ON E.PATIO_ID = P.ID
    JOIN [VEICULO] V
        ON V.ID = E.VEICULO_ID
    WHERE V.ID = 'JEG 1010'

-- g) Exiba a quantidade de vezes que os veículos de cor Azul estacionaram.
SELECT COUNT(V.COR) AS [QTD. CARRO AZUL]
FROM [VEICULO] V
    WHERE V.COR = 'Azul' 

-- h) Liste todos os clientes que possuem carro de modelo 2004.
SELECT C.NOME,
V.COR,
M.NOME [MODELO]
FROM [CLIENTE] C
    JOIN [VEICULO] V
        ON V.CLIENTE_CPF =C.CPF
    JOIN [MODELO] M
        V.MODELO_COD = M.ID
    WHERE M.NOME = '2004'

-- i) Liste as placas, os horários de entrada e saída dos veículos de cor azul.
SELECT V.COR, V.ID [PLACA],
E.DT_ENTRADA,
E.DT_SAIDA 
FROM [ESTACIONA] E
    JOIN [VEICULO] V
        ON E.VEICULO_ID = V.ID
    WHERE V.COR = 'Azul'

-- j) Liste todos os estacionamentos do veículo de placa “JJJ-2020”.
-- Esse exercício não faz o menor sentido...


-- k) Exiba o nome do cliente que possui o veículo cujo código do estacionamento é 2.
SELECT C.NOME 
FROM [CLIENTE] C
    JOIN [VEICULO] V 
        ON C.CPF = V.CLIENTE_CPF
    JOIN [ESTACIONA] E
        ON E.VEICULO_ID = V.ID
    WHERE E.ID = 2

-- l) Exiba o CPF do cliente que possui o veículo cujo código do estacionamento é 3.
SELECT C.CPF 
FROM [CLIENTE] C
    JOIN [VEICULO] V
        ON C.CPF = V.CLIENTE_CPF
    JOIN [ESTACIONA] E
        ON E.VEICULO_ID = V.ID
    WHERE E.ID = 3

-- m) Exiba a descrição do modelo do veículo cujo código do estacionamento é 2. 
SELECT M.NOME [MODELO] 
FROM [MODELO] M
    JOIN [VEICULO] V 
        ON M.ID = V.MODELO_COD
    JOIN [ESTACIONA] E
        ON E.VEICULO_ID = V.ID
    WHERE E.ID = 2

-- n) Exiba a placa, o nome dos donos e a descrição dos modelos de todos os veículos 
SELECT C.NOME [DONO], 
V.ID [PLACA], 
M.NOME [MODELO] 
FROM [CLIENTE] C
    JOIN [VEICULO] V
        ON C.CPF = V.CLIENTE_CPF
    JOIN [MODELO] M
        ON M.ID = V.MODELO_COD
