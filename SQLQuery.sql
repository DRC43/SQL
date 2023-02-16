USE minha_empresa_db


/* Exemplo: Recupere os nomes de todos os funcionários que 
possuem dois ou mais dependentes. */
SELECT nome
FROM FUNCIONARIO AS F
WHERE (SELECT COUNT(*)
	   FROM DEPENDENTE
	   WHERE ident=F_ident)>=2;



/*Exemplo: Retorne os nomes dos funcionários cujo salário é 
maior que o salário de todos os funcionários do departamento 5.*/
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



-- Exemplo: Retorne todos os funcionários que não possuem dependentes:
SELECT nome
FROM FUNCIONARIO AS F
WHERE NOT EXISTS (SELECT *
				  FROM DEPENDENTE AS D
				  WHERE F.ident = D.F_ident);



/* Exemplo: Recupere os valores de identificação dos funcionários
que trabalham nos projetos (1,2,3). */
SELECT DISTINCT F_ident
FROM trabalha_em
WHERE p_numero in (1,2,3);



-- FUNÇÕES DE AGREGAÇÃO EM SQL:
-- COUNT, SUM, MAX, MIN, AVG
SELECT COUNT(*) AS 'Total de funcionários' FROM FUNCIONARIO;

SELECT 
	SUM(salario) AS soma,
	MAX(salario) AS maximo,
	MIN(salario) AS minimo,
	AVG(salario) AS media
FROM FUNCIONARIO AS F
WHERE F.d_num = 5;



-- Exemplo: Contar o número de valores  de salário distintos no BD.
SELECT 
	COUNT(DISTINCT S_ident) AS S_distinct,
	COUNT(DISTINCT salario) AS salarios_distinct
FROM FUNCIONARIO;



/* Exemplo: Para cada departamento, recupere o número de departamento, 
o número de funcionários no departamento e seu salário médio. */
SELECT 
	D_num,
	count(ident) AS qtd_fun,
	avg(salario) AS salario_medio
FROM
	FUNCIONARIO
GROUP BY D_num;


