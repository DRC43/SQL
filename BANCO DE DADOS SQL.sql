-- MOSTRAR TODOS OS MEUS BANCOS DE DADOS
SELECT NAME, database_id, create_date
FROM sys.databases;
GO


-- EXCLUINDO UM BANCO DE DADOS
DROP DATABASE minha_empresa_db;


-- CRIAR UM BANCO DE DADOS 
CREATE DATABASE minha_empresa_db;


-- ESCOLHENDO O BANCO DE DADOS UTILIZADO
USE minha_empresa_db;



-- CRIANDO A TABELA FUNCION�RIO
CREATE TABLE FUNCIONARIO(
	ident INT, 
	nome VARCHAR(20) NOT NULL,
	sobrenome VARCHAR(20) NOT NULL,
	endereco VARCHAR(100),
	salario REAL,
	dt_nasc DATE,
	S_ident INT,
	D_num INT,
	sexo CHAR(1),
	PRIMARY KEY(ident),
	CONSTRAINT fk_Fun_Fun FOREIGN KEY (S_ident) REFERENCES FUNCIONARIO(ident)
);


-- INSERINDO DADOS NA TABELA FUNCION�RIO
INSERT INTO FUNCIONARIO
VALUES 	(1161,'Fernando','Wong','Rua da Lapa, 34, S�o Paulo, SP', 35500, '1984-12-31', NULL,1,'M');

INSERT INTO FUNCIONARIO
VALUES 	(1162,'Ronaldo','Lima','Rua Rebou�as, 334, S�o Paulo, SP', 7300, '1962-12-08', 1161,1,'M'),
		(1163,'Jo�o','Silva','Rua das Flores, 751, Rio de Janeiro, RJ', 5558.00, '1965-01-09', 1161,1,'M'),
       	(1164,'Joice','Leite','Av. Rio Branco, 54, Rio de Janeiro, RJ', 6508.00, '1972-07-31', 1161,1,'F');

SELECT * FROM FUNCIONARIO;

INSERT INTO FUNCIONARIO
VALUES 	(1165,'Claudia','Costa','Rua Francisco Lacerda, 547, S�o Paulo, SP', 45500, '1974-08-22', NULL,2,'F');

INSERT INTO FUNCIONARIO
VALUES 	(1166,'Diego','Silva','Av. Brasil, 1107, S�o Paulo, SP', 7300, '1962-12-08', 1165,2,'M'),
		(1167,'Francisco','Souza','Rua das Flores, 111, Belo Horizonte, MG', 5558.00, '1965-01-09', 1165,2,'M'),
       	(1168,'Maria','Concei��o','Av. Rio Branco, 54, Juiz de Fora, MG', 6508.00, '1972-07-31', 1165,2,'F');

INSERT INTO FUNCIONARIO
VALUES 	(1169,'Marta','Dias','Rua Jardim Chapad�o, 157, S�o Paulo, SP', 75000, '1971-03-05', NULL,3,'F');

INSERT INTO FUNCIONARIO
VALUES 	(1170,'Joana','Motta','Rua Jardim Oriente, 770, S�o Paulo, SP', 7300, '1962-01-13', 1169,3,'F'),
		(1171,'Roberto','Gon�alves','Rua das Pedras, 555, S�o Paulo, SP', 10000.00, '1980-09-15', 1169,3,'M'),
       	(1172,'Paula','Silva','Av. Monteiro Lobato, 124, Rio de Janeiro, RJ', 8540.00, '1971-11-15', 1169,3,'F');

INSERT INTO FUNCIONARIO
VALUES 	(1173,'Luis','de Marchi','Rua da Lama, 1, Vit�ria, ES', 35000, '1987-02-05', NULL,4,'M');

INSERT INTO FUNCIONARIO
VALUES 	(1174,'Fabiano','Real','Rua Francisco Chagas, 112, S�o Bernardo do Campo, SP', 4500, '1985-12-20', 1173,4,'M'),
		(1175,'Fabiana','Pereira','Av. Bento Ferreira, 142, Vit�ria, ES', 7500.00, '1985-10-11', 1173,4,'F'),
       	(1176,'Maicon','Ferreira','Av. Itamar Franco, 45, Juiz de Fora, MG', 1150.00, '1977-11-24', 1173,4,'M');

INSERT INTO FUNCIONARIO
VALUES 	(1177,'Pablo','Silva','Rua Sorriso, 155, S�o Paulo, SP', 20650, '1989-07-22', NULL,5,'M');

INSERT INTO FUNCIONARIO
VALUES 	(1178,'David','Lima','Rua Faria Lima, 340, S�o Paulo, SP', 1070, '1978-08-08', 1177,5,'M'),
		(1179,'Felipe','Souza','Rua Jo�o da Silva, 175, Rio de Janeiro, RJ', 2550.00, '1985-09-01', 1177,5,'M'),
      	(1180,'Fabr�cio','Mendon�a','Av. Edson Arantes, 110, Juiz de Fora, MG', 3500.00, '1975-07-31', 1177,5,'M');



-- CRIANDO A TABELA DEPARTAMENTO (N�MERO, NOME, Gident, Gdata)
CREATE TABLE DEPARTAMENTO(
	numero INT,
	nome VARCHAR(20),
	Gident INT NOT NULL,
	Gdata DATE,
	PRIMARY KEY(numero),
	CONSTRAINT fk_FunDep FOREIGN KEY(Gident) REFERENCES FUNCIONARIO(ident)
);


-- INSERINDO DADOS NA TABELA DEPARTAMENTO
INSERT INTO DEPARTAMENTO
VALUES 	(1,'Engenharia',1161,'2016-12-20'),(2,'Pesquisa',1165,'2017-11-08'),(3,'Contabilidade',1169,'2018-05-16'),
       	(4,'Finan�as',1173,'2011-01-11'),(5,'RH',1177,'2019-12-20');

SELECT * FROM DEPARTAMENTO;

-- INSERINDO A RESTRI��O NA TABELA FUNCION�RIO 
USE minha_empresa_db
ALTER TABLE FUNCIONARIO
ADD CONSTRAINT fk_DeptFun FOREIGN KEY (D_num) REFERENCES DEPARTAMENTO(numero);



-- CRIANDO A TABELA PROJETOS (N�MERO, NOME, LOCALIZA��O, D_num)
CREATE TABLE PROJETO(
	numero INT,
	nome VARCHAR(30),
	localizacao VARCHAR(50),
	D_num INT,
	PRIMARY KEY (numero),
	CONSTRAINT fk_DepProj FOREIGN KEY (D_num) REFERENCES DEPARTAMENTO(numero)
);


INSERT INTO PROJETO
VALUES 	(1,'Projeto A','S�o Paulo',1),(2,'Projeto F','Mau�',1),
       	(3,'Projeto K','Santo Andr�',1),(4,'Projeto P','Sorocaba',1),
		(5,'Projeto B','S�o Paulo',2),(6,'Projeto G','Sorocaba',2),
		(7,'Projeto L','Diadema',2),(8,'Projeto Q','Mau�',2);

SELECT * FROM PROJETO;

INSERT INTO projeto(numero,nome,localizacao,D_num)
VALUES  (9,'Produto C','Santo Andr�',3),(10,'Produto H','Campinas',3),
		(11,'Produto M','Santo Andr�',3),(12,'Produto R','S�o Bernardo',3),
		(13,'Produto D','S�o Bernardo',4),(14,'Produto I','S�o Paulo',4);

INSERT INTO projeto(numero,nome,localizacao,D_num)
VALUES  (15,'Produto N','S�o Bernardo',4),(16,'Produto S','Santo Andr�',4),
		(17,'Produto E','Diadema',5),(18,'Produto J','S�o Paulo',5),
		(19,'Produto O','Santo Andr�',5),(20,'Produto T','Mau�',5);



-- CRIANDO A TABELA TRABALHA_EM
CREATE TABLE TRABALHA_EM (
	F_ident INT,
	P_numero INT,
	horas INT DEFAULT 0,
	PRIMARY KEY (F_ident,P_numero),
	CONSTRAINT fk_FunTrab FOREIGN KEY(F_ident) REFERENCES FUNCIONARIO(ident),
	CONSTRAINT fk_ProjTrab FOREIGN KEY(P_numero) REFERENCES PROJETO(numero)
);


-- INSERINDO DADOS NA TABELA TRABALHA_EM
INSERT INTO TRABALHA_EM
VALUES 	(1161,1,10),(1161,2,30),(1162,2,10),(1163,3,10),(1164,4,40),
       	(1165,5,25),(1166,6,20),(1166,7,10),(1167,7,35),(1168,8,100);

INSERT INTO TRABALHA_EM
VALUES 	(1169,9,15),(1169,10,12),(1170,11,10),(1171,12,70),(1172,12,80),(1173,13,100);



-- CRIANDO A TABELA DEPARTAMENTO_LOCALIZACOES
CREATE TABLE DEPTO_LOCALIZACOES(
	D_num INT,
	localizacoes VARCHAR(50),
	PRIMARY KEY (D_num,localizacoes),
	CONSTRAINT fk_DeptDept_Loc FOREIGN KEY(D_num) REFERENCES DEPARTAMENTO(numero)
);


INSERT INTO DEPTO_LOCALIZACOES
VALUES 	(1,'S�o Paulo'),(1,'Rio de Janeiro'),(2,'Sorocaba'),(3,'Florian�polis'),
		(3,'Recife'),(4,'S�o Paulo'),(5,'S�o Paulo'),(5,'Salvador');



-- CRIAR TABELA DE DEPENDENTE
CREATE TABLE DEPENDENTE(
	F_ident INT,   --primary key
	nome VARCHAR(30), --primary key
	dt_nasc DATE,
	sexo CHAR(1),
	relacionamento VARCHAR(20),
	PRIMARY KEY(F_ident, nome),
	CONSTRAINT fk_Funcionario_Dependente FOREIGN KEY(F_ident) REFERENCES FUNCIONARIO(ident)
);


-- ADICIONANDO VALORES � TABELA DEPENDENTE
INSERT INTO DEPENDENTE
VALUES 	(1161,'Fernando','1998-01-05', 'M','filho');

INSERT INTO DEPENDENTE
VALUES 	(1166,'Joaquim','1994-12-12', 'M','filho');

INSERT INTO DEPENDENTE
VALUES 	(1171,'Fernanda','1974-11-12', 'F','esposa');

INSERT INTO DEPENDENTE
VALUES 	(1171,'Roberto','1999-11-11', 'M','filho');

INSERT INTO DEPENDENTE
VALUES 	(1180,'Carlos','1997-07-31', 'M','filho');




-- EXERC�CIO 1:
-- IDENTIFICAR ESSE PROJETO
SELECT * FROM PROJETO WHERE numero = 10;

-- ALTERAR O LOCAL E O N�MERO DE DEPARTAMENTO QUE CONTROLA O PROJETO DE N�MERO 10 PARA ' SANTO ANDR�' E 5, RESPECTIVAMENTE 
UPDATE PROJETO
SET localizacao='Santo Andr�',D_num=5
WHERE numero = 10;



-- EXERC�CIO 2: 
-- DAR A TODOS OS FUNCION�RIOS QUE S�O SUPERVISORES UM AUMENTO DE 10% NO SAL�RIO.
-- COMO SABER QUE UM FUNCION�RIO � SUPERVISOR?
SELECT salario FROM FUNCIONARIO WHERE S_ident IS NULL;

UPDATE FUNCIONARIO
SET salario = salario*1.1
WHERE S_ident IS NULL;



--EXERC�CIO 3: 
/* IMAGINA QUE O VALOR PADR�O PARA O TRABALHO EM UM PROJETO � ZERO, E ELE VAI SER ACRESCENTADO DIARIAMENTE, MAS UM TRABALHADOR PERCEBE 
QUE SEU VALOR � DIFERENTE DE ZERO, MESMO AINDA N�O EXERCENDO SUAS ATIVIDADES NESTE PROJETO. */

SELECT * FROM TRABALHA_EM;

UPDATE TRABALHA_EM
SET horas = DEFAULT
WHERE F_ident = 1163;

-- EXEMPLO 1: REMOVA TODOS OS FUNCION�RIOS COM IDENT = 1174
DELETE
FROM FUNCIONARIO
WHERE ident = 1174;

-- EXEMPLO 2: REMOVA APENAS O FUNCION�RIO COM IDENT 1179.
DELETE
FROM FUNCIONARIO
WHERE ident = 1179;

-- EXEMPLO 3: REMOVA TODOS OS FUNCION�RIOS QUE N�O S�O GERENTES
DELETE
FROM FUNCIONARIO
WHERE S_ident IS NOT NULL;

-- EXEMPLO 4: EXCLUIR TODAS AS TUPLAS DA TABELA FUNCION�RIO.
DELETE FROM TRABALHA_EM;



-- EXERC�CIO 4:
-- EXEMPLO 1: RECUPERE A DATA DE NASCIMENTO E O ENDERE�O DO(S) FUNCION�RIO(S) CUJO NOME SEJA JO�O SILVA 

SELECT dt_nasc, endereco
FROM FUNCIONARIO
WHERE nome = 'Jo�o' AND sobrenome = 'Silva';

-- EXEMPLO 2: RECUPERAR O SAL�RIO DO GERENTE DO DEPARTAMENTO 5.
SELECT salario
FROM FUNCIONARIO
WHERE D_num = 5 AND S_ident IS NULL;

-- EXEMPLO 3: RECUPERE TODOS OS VALORES DE ATRIBUTO DE QUALQUER FUNCION�RIO COM O GERENTE 1161
USE minha_empresa_db;
SELECT *
FROM FUNCIONARIO
WHERE S_ident = 1161;

-- EXEMPLO 4: RECUPERE TODOS OS ATRIBUTOS DE UM GERENTE E OS ATRIBUTOS DO DEPARTAMENTO QUE ELE GERENCIA
SELECT *
FROM FUNCIONARIO AS f, DEPARTAMENTO AS d
WHERE f.ident = d.Gident;



-- EXERC�CIO 5:
-- EXEMPLO 1: QUEREMOS RECUPERAR O NOME E SOBRENOME DE TODOS OS FUNCION�RIOS COM ENDERE�O EM S�O PAULO, SP.
SELECT nome, sobrenome
FROM FUNCIONARIO
WHERE endereco LIKE '%S�o Paulo, SP%';

SELECT * FROM FUNCIONARIO;

-- EXEMPLO 2: RECUPERAR TODOS OS FUNCION�RIOS QUE NASCERAM NA D�CADA DE 60:
SELECT nome, sobrenome
FROM FUNCIONARIO
WHERE dt_nasc LIKE '__6_______'; -- '1965-12-13'

-- EXEMPLO 3: QUAL O EFEITO DE DAR 10% DE AUMENTO NOS FUNCION�RIOS QUE TRABALHAM NO 'PROJETOF'
SELECT f.ident,te.F_ident, te.P_numero, p.numero, p.nome, f.nome, f.sobrenome, f.salario, 1.1*salario AS aumento_salario
FROM FUNCIONARIO AS f, TRABALHA_EM AS te, PROJETO AS p
WHERE f.ident = te.F_ident AND te.P_numero = p.numero AND p.nome = 'Projeto F';

-- EXEMPLO 4: RECUPERE TODOS OS FUNCION�RIOS COM SAL�RIO ENTRE R$30000 E R$40000
SELECT nome, sobrenome
FROM FUNCIONARIO
WHERE (salario between 30000 AND 40000);

SELECT nome, sobrenome
FROM FUNCIONARIO
WHERE ((salario>=30000) AND (salario<=40000));