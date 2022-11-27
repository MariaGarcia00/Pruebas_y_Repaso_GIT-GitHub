-- La siguiente tabla tiene la información de las horas trabajadas semanalmente de varios empleados; 
-- El campo semana hace referencia al número de registro de la semana trabajada

-- TABLA (1) 
-- Se crea la Tabla tb_horasEmpleados con cada uno de sus Atributos
CREATE TABLE tb_horasEmpleados
(
	-- id        	  SERIAL,
	id_emp        INTEGER        NOT NULL,
	nom_emp       VARCHAR(100)	 NOT NULL,
	ger_em        VARCHAR		 NOT NULL,
	hr_trab		  INTEGER		 NOT NULL,
	semana        INTEGER		 NOT NULL,
	PRIMARY KEY(id_emp)
);

-- Se traen todos los Registros, Filas o Tuplas de la Tabla tb_horasEmpleados
SELECT * FROM tb_horasEmpleados;

-- Se borra la Tabla tb_horasEmpleados
DROP TABLE IF EXISTS tb_horasEmpleados;
-- Se borran los datos de la tabla tb_horasEmpleados  
DELETE FROM tb_horasEmpleados;

-- Se ingresan los datos o Registros de la Tabla tb_horasEmpleados
	-- SEMANA 1
INSERT INTO tb_horasEmpleados VALUES (1, 'Julio', 'Modelos', 40, 1);
INSERT INTO tb_horasEmpleados VALUES (2, 'Jorge', 'Modelos', 60, 1);
INSERT INTO tb_horasEmpleados VALUES (3, 'Alejandra', 'Originación', 35, 1);
INSERT INTO tb_horasEmpleados VALUES (4, 'Isabel', 'Políticas', 20, 1);
INSERT INTO tb_horasEmpleados VALUES (5, 'Pablo', 'Cobranza', 41, 1);
-----------------------------------------------------------------------------------------------------------------------------

-- TABLA (2)
-- Se crea la Tabla tb_hrEmpleados con cada uno de sus Atributos
CREATE TABLE tb_hrEmpleados
(
	-- id        	  SERIAL,
	id_emp        INTEGER        NOT NULL,
	nom_emp       VARCHAR(100)	 NOT NULL,
	ger_em        VARCHAR		 NOT NULL,
	hr_trab		  INTEGER		 NOT NULL,
	semana        INTEGER		 NOT NULL
);

-- Se traen todos los Registros, Filas o Tuplas de la Tabla tb_hrEmpleados
SELECT * FROM tb_hrEmpleados;

-- Se borra la Tabla tb_horasEmpleados
DROP TABLE IF EXISTS tb_hrEmpleados;
-- Se borran los datos de la tabla tb_hrEmpleados  
DELETE FROM tb_hrEmpleados;






SELECT nom_emp, SUM(hr_trab) AS total_horas FROM tb_hrEmpleados WHERE nom_emp = 'Jorge' GROUP BY (nom_emp);

-- OTRA FORMA, SI FUERA EL ID AUTOINCREMENTAL INSERT INTO tb_hrEmpleados("id_emp", "nom_emp", "ger_em", "hr_trab", "semana") VALUES (1, 'Julio', 'Modelos', 40, 1);
-- Se ingresan los datos o Registros de la Tabla tb_horasEmpleados
	-- SEMANA 1
INSERT INTO tb_hrEmpleados VALUES (1, 'Julio', 'Modelos', 40, 1);
INSERT INTO tb_hrEmpleados VALUES (2, 'Jorge', 'Modelos', 60, 1);
INSERT INTO tb_hrEmpleados VALUES (3, 'Alejandra', 'Originación', 35, 1);
INSERT INTO tb_hrEmpleados VALUES (4, 'Isabel', 'Políticas', 20, 1);
INSERT INTO tb_hrEmpleados VALUES (5, 'Pablo', 'Cobranza', 41, 1);
	-- SEMANA 2
INSERT INTO tb_hrEmpleados VALUES (2, 'Jorge', 'Modelos', 60, 2);
INSERT INTO tb_hrEmpleados VALUES (1, 'Julio', 'Modelos', 40, 2);
INSERT INTO tb_hrEmpleados VALUES (4, 'Isabel', 'Políticas', 35, 2);
INSERT INTO tb_hrEmpleados VALUES (6, 'Sandor', 'Políticas', 40, 1);
INSERT INTO tb_hrEmpleados VALUES (3, 'Alejandra', 'Originación', 28, 2);
INSERT INTO tb_hrEmpleados VALUES (2, 'Jorge', 'Modelos', 62, 3);

-- Se traen todos los Registros, Filas o Tuplas de la Tabla tb_horasEmpleados
SELECT * FROM tb_hrEmpleados;


-- ACTIVIDADES
-- 1. Sentencia de código que devuelva el id de Julio y el total de horas que trabajó
SELECT id_emp FROM tb_hrEmpleados WHERE nom_emp = 'Julio';
SELECT id_emp, SUM (hr_trab) AS total_horasTrabajadas FROM tb_hrEmpleados WHERE nom_emp = 'Julio' GROUP BY (id_emp);
-- 2. Sentencia que devuelva el total de horas que trabajó cada empleado y su nombre
SELECT nom_emp, SUM (hr_trab) AS total_horasTrabajadas FROM tb_hrEmpleados GROUP BY (nom_emp);
-- 3. 
SELECT ger_em, AVG(hr_trab)
	FROM tb_hrEmpleados GROUP BY ger_em HAVING AVG(hr_trab) > 35 ORDER BY AVG (hr_trab) DESC

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE tb_Clientes
( 
	id_clien 	SERIAL,
	nom_clien   VARCHAR(40)   NOT NULL,
	nom_conta	VARCHAR(40)   NOT NULL,
	dir_clien   VARCHAR(70)   NOT NULL,
	ciud_clien  VARCHAR(30)   NOT NULL,
	cod_post 	VARCHAR(40) 	  NULL,
	pais_clien	VARCHAR       NOT NULL,
	PRIMARY KEY(id_clien)
);


INSERT INTO tb_Clientes("nom_clien", "nom_conta", "dir_clien", "ciud_clien", "cod_post", "pais_clien") VALUES ('Dargy Julieth', 'DargJ', 'Calle 48#58-65', 'Cocaña', '54', 'Colombia');
INSERT INTO tb_Clientes("nom_clien", "nom_conta", "dir_clien", "ciud_clien", "cod_post", "pais_clien") VALUES ('Julián Ochoa', 'JuliO', 'Calle 49#58-65', 'Medellín', '54', 'Colombia');
INSERT INTO tb_Clientes("nom_clien", "nom_conta", "dir_clien", "ciud_clien", "cod_post", "pais_clien") VALUES ('María', 'Camila', 'Calle 49#58-65', 'Cocaña', '54', 'Colombia');
SELECT * FROM tb_Clientes;

DROP TABLE tb_Clientes;


-- Seleccionar todas las personas que viven en Medellín



SELECT id_clien, nom_clien FROM tb_Clientes WHERE pais_clien = 'Colombia';

SELECT * FROM tb_Clientes ORDER BY id_clien;
SELECT * FROM tb_Clientes ORDER BY id_clien ASC;
SELECT * FROM tb_Clientes ORDER BY id_clien DESC;

SELECT DISTINCT ciud_clien FROM tb_Clientes; -- REVISAR ESTOOOOO
SELECT DISTINCT ciud_clien FROM tb_Clientes WHERE ciud_clien != 'Cocaña';
SELECT DISTINCT dir_clien FROM tb_Clientes;


SELECT MIN(id_clien) FROM tb_Clientes;
SELECT MAX(id_clien) FROM tb_Clientes;


UPDATE tb_Clientes SET cod_post = '06' WHERE id_clien = 2;
UPDATE tb_Clientes SET cod_post = '019' WHERE id_clien = 1;

DELETE FROM tb_Clientes WHERE id_clien = 1;

SELECT * FROM tb_Clientes WHERE id_clien = 2 AND nom_conta = 'JuliO';
SELECT * FROM tb_Clientes WHERE nom_conta = 'JuliO' OR nom_conta = 'Camila';

SELECT 


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------