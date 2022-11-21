/* Criar uma tabela */
create table tabela1(   
  id int identity(1,1) primary key,	-- primary key é a chave primaria da tabela, (inicio,incremento), identity não pode ser alterado, apenas a tabela o modifica
  nome varchar(30),  -- É necessário colocar o o <nome> e o tipo
  data_nasc date not Null -- Campo de preenchimento obrigatório
)

alter table tabela1
add cpf bigint not Null unique -- Os Dados nuca vão se repetir


INSERT INTO tabela1 (nome, data_nasc, cpf) -- Inserir os valores na tabela
Values
('Nome', '08/11/2004', 01313113311)



SELECT * FROM tabela1 where (id > 2); /* Visualizar tudo da tabela ou apenas alguns dados (Select <dado1>, <dado2> from tabela2) */

update tabela1 set nome='NomeAlterado' where (id = 4) -- Alterando o nome pelo id

delete tabela1 where (id = 3) -- Deletou o dado pelo id