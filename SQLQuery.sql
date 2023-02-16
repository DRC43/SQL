USE minha_empresa_db


/* Exemplo: Recupere os nomes de todos os funcion�rios que 
possuem dois ou mais dependentes. */
SELECT nome
FROM FUNCIONARIO AS F
WHERE (SELECT COUNT(*)
	   FROM DEPENDENTE
	   WHERE ident=F_ident)>=2;



/*Exemplo: Retorne os nomes dos funcion�rios cujo sal�rio � 
maior que o sal�rio de todos os funcion�rios do departamento 5.*/
SELECT nome
FROM FUNCIONARIO
WHERE salario > all(SELECT salario
					FROM funcionario
					WHERE D_num = 5);



-- Exemplo: Usando o EXISTS
SELECT nome
FROM FUNCIONARIO AS F
WHERE EXISTS (SELECT D.F_ident
			  FROM DEPENDENTE AS D
			  WHERE F.nome = D.nome and
					F.sexo = D.sexo);



-- Exemplo: Retorne todos os funcion�rios que n�o possuem dependentes:
SELECT nome
FROM FUNCIONARIO AS F
WHERE NOT EXISTS (SELECT *
				  FROM DEPENDENTE AS D
				  WHERE F.ident = D.F_ident);



/* Exemplo: Recupere os valores de identifica��o dos funcion�rios
que trabalham nos projetos (1,2,3). */
SELECT DISTINCT F_ident
FROM trabalha_em
WHERE p_numero in (1,2,3);



-- FUN��ES DE AGREGA��O EM SQL:
-- COUNT, SUM, MAX, MIN, AVG
SELECT COUNT(*) AS 'Total de funcion�rios' FROM FUNCIONARIO;

SELECT 
	SUM(salario) AS soma,
	MAX(salario) AS maximo,
	MIN(salario) AS minimo,
	AVG(salario) AS media
FROM FUNCIONARIO AS F
WHERE F.d_num = 5;



-- Exemplo: Contar o n�mero de valores  de sal�rio distintos no BD.
SELECT 
	COUNT(DISTINCT S_ident) AS S_distinct,
	COUNT(DISTINCT salario) AS salarios_distinct
FROM FUNCIONARIO;



/* Exemplo: Para cada departamento, recupere o n�mero de departamento, 
o n�mero de funcion�rios no departamento e seu sal�rio m�dio. */
SELECT 
	D_num,
	count(ident) AS qtd_fun,
	avg(salario) AS salario_medio
FROM
	FUNCIONARIO
GROUP BY D_num;


