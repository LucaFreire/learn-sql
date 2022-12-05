--------- INSERTS ---------

--- 20 alunos
INSERT INTO [TABELA ALUNO](NOME,CPF,DATA_NASC)
VALUES 
    ('THIGAS', '1','10/12/2000'),  -- CPF reduzido p/ facilitar a inserção (a ideia é a mesma)
    ('DONZIN', '2','5/11/2010'),
    ('FALAS', '3','9/10/2006'),
    ('DEDELAS', '4', '10/04/2003'),
    ('GABU', '5','30/05/2001'),
    ('HEMERSHOW', '6','12/11/2000'),
    ('MAITE', '7','10/12/2000'),
    ('LUSQUINHA', '8','12/12/2002'),
    ('PITCH', '9','14/09/2000'),
    ('RAMIREZ', '10', '12/10/2004'),
    ('MANU', '11','10/07/2003'),
    ('MURILOVE', '12','10/01/2002'),
    ('NICOLZIN', '13','12/06/2000'),
    ('FELIPOLAS', '14','10/07/2000'),
    ('CARIOCA', '15', '10/12/2010'),
    ('QUEILA', '16','09/11/2004'),
    ('JÃO', '17','12/10/2007'),
    ('FABINHO', '18', '12/06/2000'),
    ('ROBERTO', '19','10/09/2002'),
    ('GABRIEL', '20','10/08/2000')

--- 5 professores
INSERT INTO [TABELA PROFESSOR](NOME, CPF)
VALUES
    ('LEMOS','21'),
    ('OSWALDO','22'),
    ('FABIO','23'),
    ('RAFAEL','24'),
    ('VINICIUS','25')

--- 3 cursos
INSERT INTO [TABELA CURSO](NOME,ATIVO)
VALUES
    ('CURSO DE GITHUB',1),
    ('CURSO DE SQL',1),
    ('CURSO DE PYTHON',1)


--- 8 disciplinas
INSERT INTO [TABELA DISCIPLINA](NOME,ATIVO)
VALUES
    ('MATEMÁTICA BÁSICA',1),
    ('MATEMÁTICA AVANÇADA',1),
    ('LÓGICA BÁSICA',1),
    ('LÓGICA AVANÇADA',1),
    ('FÍSICA BÁSICA',1),
    ('FISICA AVANÇADA',1),
    ('PROGRAMAÇÃO BÁSICA',1),
    ('PROGRAMAÇÃO AVANÇADA',1)
INSERT INTO [TABELA DISCIPLINA X CURSO](ID_CURSO, ID_DISCIPLINA, ATIVA)
VALUES
    (1,1,1),
    (2,2,1),
    (3,3,1)


--- 4 turmas com 5 alunos em cada uma 

-- uma das turmas deve possuir 3 notas
INSERT INTO [TABELA TURMA](ID_ALUNO, ID_PROFESSOR, ID_DISCIPLINA_CURSO, NOTA1, NOTA2, NOTA3, NOTAFINAL) -- TURMA 1
VALUES
    (1, 1, 1, 77.4, 35.9, 71),
    (2, 2, 2, 98.0, 44.0, 60.0),
    (3, 3, 3, 45.0, 35.0, 40.0),
    (4, 4, 2, 78.0, 38.0, 58.0),
    (5, 1, 1, 70.0, 55.0, 62.5)

--  2 turmas devem possuir 2 notas 
INSERT INTO [TABELA TURMA](ID_ALUNO, ID_PROFESSOR, ID_DISCIPLINA_CURSO, NOTA1, NOTA2, NOTAFINAL) -- TURMA 2
VALUES
    (6, 1, 1, 77.0, 35.0, 56),
    (7, 2, 2, 98.4, 44.9, 71.6),
    (8, 3, 3, 45.4, 35.9, 47.9),
    (9, 4, 2, 43.4, 38.9, 56.0),
    (10, 1, 1, 70.4, 34.9, 55.0)

INSERT INTO [TABELA TURMA](ID_ALUNO, ID_PROFESSOR, ID_DISCIPLINA_CURSO, NOTA1, NOTA2, NOTAFINAL) -- TURMA 3
VALUES
    (11, 1, 1, 75.0, 75.0, 75),
    (12, 2, 2, 70.0, 70.0, 70),
    (13, 3, 3, 80.0, 80.0, 80),
    (14, 4, 2, 90.0, 90.0, 90),
    (15, 1, 1, 77.0, 77.0, 77)


-- uma turma deve possuir apenas a primeira nota
INSERT INTO [TABELA TURMA](ID_ALUNO, ID_PROFESSOR, ID_DISCIPLINA_CURSO, NOTA1, NOTAFINAL) -- TURMA 4
VALUES
    (11, 1, 1, 77.4, 77.4),
    (12, 2, 2, 98.4, 98.4),
    (13, 3, 3, 45.4, 45.4),
    (14, 4, 2, 43.4, 43.4),
    (15, 1, 1, 70.4, 70.4)


--- 5 alunos com 1 boleto já pago e 1 para o mês que vem
INSERT INTO [TABELA PAGAMENTOS] (ID_ALUNO, BOLETO, SITUACAO)
VALUES 
    (1,'01/08/2022','PAGO'),
    (1,'01/01/2023','PENDENTE'),
    
    (2,'03/08/2022','PAGO'),
    (2,'03/01/2023','PENDENTE'),
    
    (3,'07/12/2022','PAGO'),
    (3,'01/01/2023','PENDENTE'),
    
    (4,'09/12/2023','PENDENTE'),
    (4,'01/12/2022','PAGO'),

    (5,'02/01/2023','PENDENTE'),
    (5,'04/01/2023','PENDENTE')


--- 10 alunos com 2 boletos já pagos e 1 para o mês que vem
INSERT INTO [TABELA PAGAMENTOS] (ID_ALUNO, BOLETO, SITUACAO)
VALUES 
    (6,'01/12/2022','PAGO'),
    (6,'03/01/2023','PAGO'),
    (6,'01/02/2023','PENDENTE'),

    (7,'01/12/2022','PAGO'),
    (7,'03/01/2023','PAGO'),
    (7,'01/02/2023','PENDENTE'),

    (8,'01/12/2022','PAGO'),
    (8,'03/01/2023','PAGO'),
    (8,'01/02/2023','PENDENTE'),

    (9,'01/12/2022','PAGO'),
    (9,'03/01/2023','PAGO'),
    (9,'01/02/2023','PENDENTE'),

    (10,'01/12/2022','PAGO'),
    (10,'03/01/2023','PAGO'),
    (10,'01/02/2023','PENDENTE'),

    (11,'01/12/2022','PAGO'),
    (11,'03/01/2023','PAGO'),
    (11,'01/02/2023','PENDENTE'),

    (12,'01/12/2022','PAGO'),
    (12,'03/01/2023','PAGO'),
    (12,'01/02/2023','PENDENTE'),

    (13,'01/12/2022','PAGO'),
    (13,'03/01/2023','PAGO'),
    (13,'01/02/2023','PENDENTE'),

    (14,'01/12/2022','PAGO'),
    (14,'03/01/2023','PAGO'),
    (14,'01/02/2023','PENDENTE'),

    (15,'01/12/2022','PAGO'),
    (15,'03/01/2023','PAGO'),
    (15,'01/02/2023','PENDENTE'),

    -- 3 alunos com 4 boletos já pagos e 1 para o mês que vem
    (16,'01/12/2022','PAGO'),
    (16,'03/01/2023','PAGO'),
    (16,'01/12/2022','PAGO'),
    (16,'03/01/2023','PAGO'),
    (16,'01/02/2023','PENDENTE'),

    (17,'01/12/2022','PAGO'),
    (17,'04/01/2023','PAGO'),
    (17,'05/01/2023','PAGO'),
    (17,'01/12/2022','PAGO'),
    (17,'01/02/2023','PENDENTE'),

    (18,'01/12/2022','PAGO'),
    (18,'04/01/2023','PAGO'),
    (18,'05/01/2023','PAGO'),
    (18,'01/12/2022','PAGO'),
    (18,'01/02/2023','PENDENTE'),

    (18,'04/01/2023','PAGO'),
    (18,'05/01/2023','PAGO'),
    (18,'01/02/2023','PAGO'),
    (18,'01/12/2022','PENDENTE'),
    (18,'01/12/2022','PENDENTE')
