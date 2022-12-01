
-- EXEMPLOS PROFESSOR

-- parametro de saida
-- alter procedure qtde_notas 
-- @cpf varchar(11),
-- @qtde int output
-- as 
-- begin
-- 	select @qtde = COUNT(*) from [NOTAS FISCAIS]
-- 	where CPF = @cpf
-- end

-- -- chamada da procedure com parametro de saida
-- declare @qtde int
-- exec qtde_notas '94387575700', @qtde = @qtde output
-- select @qtde

-- -- procedure com variavel interna
-- create proc verificaGastos @cpf varchar(11)
-- as
-- begin
-- 	declare @gastos smallmoney

-- 	select @gastos = sum(inf.PREÇO) from [NOTAS FISCAIS]nf inner join
-- 	[ITENS NOTAS FISCAIS]inf on inf.NUMERO = nf.NUMERO
-- 	where nf.CPF = @cpf;

-- 	if @gastos > 1000
-- 		print 'esta gastando demais'
-- 	else
-- 		print 'esta sendo economico'
-- end

-- exec verificaGastos '19290992743'

-- -- mesmo exemplo feito com parametro de saida
-- create proc verificaGastos_saida 
-- @cpf varchar(11),@gastos smallmoney output
-- as
-- begin
-- 	select @gastos = sum(inf.PREÇO) from [NOTAS FISCAIS]nf inner join
-- 	[ITENS NOTAS FISCAIS]inf on inf.NUMERO = nf.NUMERO
-- 	where nf.CPF = @cpf;

-- 	if @gastos > 1000
-- 		print 'esta gastando demais'
-- 	else
-- 		print 'esta sendo economico'
-- end

-- declare @gastos smallmoney

-- exec verificaGastos_saida '19290992743', 
-- @gastos=@gastos output
-- select @gastos
