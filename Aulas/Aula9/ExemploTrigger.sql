-- create database testes_triggers
-- go
-- use testes_triggers

-- create table produto(
-- id int identity(1,1) primary key,
-- nome varchar(11),
-- qtde_estoque int default 0
-- )

-- create table vendas(
-- id int identity(1,1) primary key,
-- id_produto int,
-- qtde int,
-- foreign key (id_produto) references produto(id)
-- )

-- insert produto values ('arroz',10)
-- insert produto values ('feij�o',20)
-- insert produto values ('nescau',10)
-- insert produto (nome) values ('ex.tomate')
-- insert produto values ('azeite',15)

-- select * from produto


-- create trigger atualiza_Estoque
-- on vendas
-- after insert
-- as
-- begin
-- declare @id int
-- declare @qtde int
-- select @id = id_produto, @qtde = qtde from inserted
-- update produto set qtde_estoque = qtde_estoque-@qtde
-- from produto where id = @id
-- end


-- select * from produto
-- insert vendas values (1, 2)





-- create table aluno(
-- id int,
-- nome varchar(30),
-- ativo bit default 1
-- )
-- insert aluno (nome) values('jos�')
-- insert aluno (nome) values('jo�o')

-- select * from aluno

-- create trigger impedeDelete
-- on aluno
-- instead of delete
-- as
-- begin
-- declare @nome varchar(30)
-- select @nome = nome from deleted
-- update aluno set ativo=0  where nome=@nome
-- end


-- delete from aluno where nome = 'jo�o'