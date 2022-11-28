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

