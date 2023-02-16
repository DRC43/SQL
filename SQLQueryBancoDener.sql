CREATE DATABASE Banco_Denner;


CREATE TABLE AGENCIA(
	codAgencia INT,
	nome VARCHAR(30) NOT NULL,
	cidade VARCHAR(50),
	PRIMARY KEY (codAgencia)
);

INSERT INTO AGENCIA
  VALUES (0700,'Centro','São Paulo'),(0550,'Rodoviária','São Paulo'),(0210,'Barão Geraldo','Campinas'),(2121,'Sé','São Paulo'),
		 (0315,'Pinheiros','São Paulo'),(0205,'Aeroporto','São Paulo'),(0750,'Centro','Campinas'),(0200,'Tucuruvi','São Paulo'),
		 (1220,'Morumbi','São Paulo'),(1155,'Itaquera','São Paulo'),(0111,'USP','São Paulo'),(7070,'Jabaquara','São Paulo'),
		 (1715,'Pacaembú','São Paulo'),(2200,'Guarulhos','Guarulhos'),(0222,'Unicamp','Campinas'),(0001,'Paulista','São Paulo');



CREATE TABLE CLIENTE(
	codCliente INT, 
	nome VARCHAR(30) NOT NULL,
	rua VARCHAR(100),
	cidade VARCHAR(50),
	PRIMARY KEY (codCliente)
);

INSERT INTO CLIENTE
	VALUES (1111,'João da Silva','Rua São José - 638','São Paulo'),(1112,'José Costa','Rua São Paulo - 619','São Paulo'),
		   (1113,'Marcos Ameixa','Rua Santo Antônio - 554','Campinas'),(1114,'Sebastião Roma','Avenida Brasil - 532','Campinas'),
		   (1115,'Lucas Souza','Rua São Pedro - 458','São Paulo'),(1116,'Mateus Barbosa','Rua São João - 455','São Paulo'),
		   (1117,'Maria Carvalho','Rua São Francisco - 442','Campinas'),(1118,'Manuel Santos','Av. Princesa do Oeste - 447','Campinas'),
		   (1119,'Mariana Gomes','Rua Sete de Setembro - 428','São Paulo'),(1120,'Sandra Rocha','Av. Barão de Rio Branco - 227','São Paulo'),
		   (1121,'Carlos Quaresma','Rua Quinze de Novembro - 394','São Paulo'),(1122,'André Mendonça','Rua Marechal Deodoro da Fonseca - 125','São Paulo'),
		   (1123,'Aberlado Ramos','Rua Leonardo Martins - 1145','Campinas'),(1124,'Joaquim Ferreira','Rua Tiradentes - 384','Campinas'),
		   (1125,'Edgar Matias','Rua Francisco Menor - 1107','São Paulo'),(1126,'Maria José','Rua Guaçuí - 1019','Campinas');



CREATE TABLE EMPRESTIMO(
	nroEmprestimo INT,
	codAgencia INT, 
	total INT,
	PRIMARY KEY (nroEmprestimo),
	CONSTRAINT fk_AG_EMPR FOREIGN KEY (codAgencia) REFERENCES AGENCIA(codAgencia) 
);

INSERT INTO EMPRESTIMO
	VALUES (1,0700,10250.00),(2,1155,100550.00),(3,0315,70250.00),(4,0210,5000.00),(5,7070,1050.00),(6,0001,1000000.00),(7,1220,2450.00),(8,1715,1124.00),
		   (9,0315,1250.00),(10,1155,80000.00),(11,0210,5050.00),(12,0111,7500.00),(13,0205,1000.00),(14,1155,7500000.00),(15,1220,12540.00),(16,0210,750.00);



CREATE TABLE DEVEDOR(
	codCliente INT,
	nroEmprestimo INT,
	PRIMARY KEY (codCliente, nroEmprestimo),
	CONSTRAINT fk_CLI_DEV FOREIGN KEY (codCliente) REFERENCES CLIENTE(codCliente),
	CONSTRAINT fk_EMPR_DEV FOREIGN KEY (nroEmprestimo) REFERENCES EMPRESTIMO(nroEmprestimo)
);

INSERT INTO DEVEDOR
	VALUES (1111,13),(1117,12),(1122,8),(1119,6),(1113,3),(1115,1),(1115,10),(1111,2),
		   (1112,14),(1116,16),(1121,7),(1121,5),(1111,4),(1117,9),(1116,11),(1111,15);



CREATE TABLE CONTA(
	nroConta INT,
	codAgencia INT,
	saldo INT
	PRIMARY KEY (nroConta)
	CONSTRAINT fk_AG_CON FOREIGN KEY (codAgencia) REFERENCES AGENCIA(codAgencia)
);

INSERT INTO CONTA
	VALUES (1001,0700,7500),(1002,0111,7500),(1003,7070,7500),(1004,0200,7500),(1005,0210,7500),(1006,0111,7500),(1007,1155,7500),(1008,0315,7500),
		   (1009,0205,7500),(1010,0001,7500),(1011,0111,7500),(1012,2121,7500),(1013,0750,7500),(1014,0222,7500),(1015,1220,7500),(1016,2200,7500);



CREATE TABLE CORRENTISTA(
	codCliente INT,
	nroConta INT,
	PRIMARY KEY (CodCliente, nroConta),
	CONSTRAINT fk_CLIEN_CORRE FOREIGN KEY (codCliente) REFERENCES CLIENTE(codCliente),
	CONSTRAINT fk_CON_CORRE FOREIGN KEY (nroConta) REFERENCES CONTA(nroConta)
);

INSERT INTO CORRENTISTA
	VALUES (1111,1001),(1112,1002),(1113,1003),(1114,1004),(1115,1005),(1116,1006),(1117,1007),(1118,1008),
		   (1119,1009),(1120,1010),(1121,1011),(1122,1012),(1123,1013),(1124,1014),(1125,1015),(1126,1016);




-- ATIVIDADE 1
-- Liste as informações da relação empréstimo para os empréstimos com totais superiores a R$ 1.200
SELECT * FROM EMPRESTIMO 
WHERE total >=1200

 

-- ATIVIDADE 2
-- Liste os números dos empréstimos para os empréstimos com totais superiores a R$1.200
SELECT nroEmprestimo FROM EMPRESTIMO
WHERE total >=1200 



-- ATIVIDADE 3
-- Liste os nomes dos clientes que tem um empréstimo na agência 1
SELECT nome 
FROM CLIENTE AS C,EMPRESTIMO AS E, DEVEDOR AS D
WHERE (E.codAgencia = 1 AND D.nroEmprestimo = E.nroEmprestimo AND D.codCliente = C.codCliente);



-- ATIVIDADE 4 
-- Liste os nomes dos clientes que têm um empréstimo na agência Centro
SELECT nome FROM CLIENTE AS C, EMPRESTIMO AS E, DEVEDOR AS D
WHERE (E.codAgencia = 700 AND D.nroEmprestimo = E.nroEmprestimo AND C.codCliente = D.codCliente)
OR (codAgencia = 750 AND D.nroEmprestimo = E.nroEmprestimo AND C.codCliente = D.codCliente);
