create table tabela1(   
  id int identity(1,1) primary key,	
  nome varchar(30) Not Null,  
  sobrenome varchar(100) Not Null,
  cpf varchar(12) Not Null,
  estado varchar(2) Not Null,
  dataNasc date Not Null,
  altura numeric(3,2),
  peso numeric(4,2) -- (total numeros, quantos depois da vírgula) 
)


INSERT INTO tabela1(nome,sobrenome,cpf,estado,dataNasc,altura,peso)
VALUES
('Nome2','Sobrenome2','123456789','PR','15/10/2010', 1.73, 7.7); -- MES / DIA / ANO mas parace como ANO / MES / DIA

select IDENT_CURRENT('tabela1') -- Mostra o Id atual

Select * from tabela1 where dataNasc < '01/01/2018'

Select * from tabela1 where peso >= 50 -- Todos com peso acima ou igual a 50

Select * from tabela1 where nome like'N%' -- Todos que contém 'N' no início

Select * from tabela1 where nome like'%N' -- Todos que contém 'N' no Final

Select * from tabela1 where nome like'%N%' -- Todos que contém 'N' em algum lugar

Select * from tabela1 where nome like'_o%' -- Todos que contém 'o' no segundo lugar

Select * from tabela1 where nome like'__m%' -- Todos que contém 'm' no terceiro lugar

Select * from tabela1 where nome in ('Nome1','Nome2')-- Todos que contém os nomes ('Nome1','Nome2')

Select * from tabela1 where peso between 20 and 90 -- Todos que contém o peso entre 20 e 90

----------------------------------------------------------------------------------------------------

/*
create table unidade(
	id int identity (1,1) primary key,
	nome varchar(30)
)

alter table tabela1
add id_unidade int

update tabela1 set id_unidade = 1 where (id<5)

create table tabela2(
	id int identity(1,1) primary key,
	nome varchar(30),
	id_unidade int,
	foreign key (id_unidade) references tabela1(id)
	)
*/

------------------------------------------------------
/*
create table palestras(
	id int identity(1,1) primary key,
	nome varchar(30),
	id_palestra int,
	id_oficinas int,
	id_forum int,
	foreign key (id_palestra) references palestras(id),
	foreign key (id_oficinas) references oficinas(id),
	foreign key (id_forum) references forum(id)
)

create table inspetor(
	id int identity(1,1),
	id_palestra int
)

alter table inspetor
add constraibt PK_inspetir primary key(id)


alter table inspetor
add constraint PK_inspetor primary key(id_palestra) references palestras(id) */


------------------------------------------------------------------------------------------

--------------------- Exercício --------------------
create table Cliente(
	Id int identity(1,1) primary key,
	Nome varchar(30),
	Cpf varchar(12),
	DataCadastro date
)

create table Produto(
	Id int identity(1,1) primary key,
	Nome varchar(30),
	Preco numeric(6,2)
)

create table Venda(
	Id int identity(1,1) primary key,
	IdCliente int,
	IdProduto int,
	DataVenda date,

	foreign key(IdCliente) references Cliente(Id),
	foreign key(IdProduto) references Produto(Id)
)

INSERT INTO Cliente(Nome,Cpf)
VALUES
	('Thigas','11111111111'),
	('Pedro','11111111222'),
	('Roberto','11111111333');

INSERT INTO Produto
VALUES
	('Água', 5.00),
	('Chocolate',7.50),
	('Salgado', 10.00),
	('Refrigerante',12.50),
	('Café',19.90);

INSERT INTO Venda(IdCliente, IdProduto)
Values 
	(1,3),(2,4),(3,5)

alter table Venda
add constraint fk_cliente foreign key (IdCliente) -- Com essa alteração, agora é possível deletar vendas sem que de erro
references Cliente(Id) on update cascade on delete cascade


-- SELECT <dado1,dado2,dado3> FROM // Tudo que estiver entre o SELECT e o FROM, vai aparecer
SELECT c.Nome, p.Nome AS Produto, p.Preco FROM VENDA AS v
	JOIN Cliente AS c on c.id = v.IdCliente
	JOIN Produto AS p on p.id = v.IdProduto
	where(p.Preco >= 10)

