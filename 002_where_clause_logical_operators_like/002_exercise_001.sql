/*
	Situación: Base de datos Cyber_Security_Agency
	Una agencia internacional de ciberseguridad registra información sobre sus analistas y sus asignaciones operativas.
*/

-- Creación de la Base de Datos 
DROP DATABASE IF EXISTS `Cyber_Security_Agency`;
CREATE DATABASE `Cyber_Security_Agency`;
USE `Cyber_Security_Agency`;

-- *************************

-- Creación de Tabla `analyst_profiles`
CREATE TABLE analyst_profiles (
	analyst_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
	age INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    join_date DATE NOT NULL,
     PRIMARY KEY(analyst_id)
);

-- Creación de Tabla `analyst_assignments`
CREATE TABLE analyst_assignments (
	analyst_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    job VARCHAR(75) NOT NULL,
    salary INT NOT NULL,
    operation_code VARCHAR(5),
    PRIMARY KEY(analyst_id)
);

-- *************************

-- Insertar datos en `analyst_profiles`
INSERT INTO analyst_profiles(first_name, last_name, age, gender, join_date)
VALUES
('Alice', 'Johnson', 34, 'Female', '2015-06-12'),
('Bob', 'Smith', 41, 'Male', '2010-09-23'),
('Charlie', 'Nguyen', 29, 'Male', '2019-01-15'),
('Diana', 'Petrova', 38, 'Female', '2013-11-30'),
('Ethan', 'Brown', 45, 'Male', '2008-04-19'),
('Fiona', 'Davis', 31, 'Female', '2020-07-08'),
('George', 'Miller', 50, 'Male', '2005-03-14'),
('Hannah', 'Wilson', 27, 'Female', '2021-02-01'),
('Ivan', 'Ivanov', 36, 'Male', '2016-08-21'),
('Julia', 'Fernandez', 33, 'Female', '2018-12-05'),
('Kevin', 'Lee', 39, 'Male', '2012-05-17'),
('Laura', 'García', 42, 'Female', '2009-10-10');

-- Insertar datos en `analyst_assignments`
INSERT INTO analyst_assignments(first_name, last_name, job, salary, operation_code)
VALUES
('Alice', 'Johnson', 'Threat Analyst', 72000, 'OP-A1'),
('Bob', 'Smith', 'Incident Responder', 85000, 'OP-B2'),
('Charlie', 'Nguyen', 'Malware Analyst', 68000, 'OP-A1'),
('Diana', 'Petrova', 'Threat Analyst', 77000, 'OP-C3'),
('Ethan', 'Brown', 'Security Engineer', 92000, 'OP-D4'),
('Fiona', 'Davis', 'Incident Responder', 70000, 'OP-B2'),
('George', 'Miller', 'Director', 120000, NULL),
('Hannah', 'Wilson', 'Intern', 40000, 'OP-A1'),
('Ivan', 'Ivanov', 'Security Engineer', 88000, 'OP-D4'),
('Julia', 'Fernandez', 'Threat Analyst', 76000, 'OP-C3'),
('Kevin', 'Lee', 'Malware Analyst', 69000, 'OP-A1'),
('Laura', 'García', 'Director', 115000, NULL);

-- *************************

/*
	TAREA 1: Obtener todos los analistas cuyo salario sea mayor a 75000 y cuyo rol no sea "Director".
*/
SELECT analyst_id AS `ID`,
CONCAT(first_name, ' ', last_name) AS `Full Name`,
job AS `Job`,
salary AS `Salary($)`,
operation_code AS `Operation Code` 
FROM cyber_security_agency.analyst_assignments
WHERE salary > 75000 AND job <> 'Director';

-- *************************

/*
	TAREA 2: Listar todos los analistas que:
		- sean mujeres
		- y hayan ingresado después del año 2015 (También se incluye 2015)
*/
SELECT CONCAT(first_name, ' ', last_name) AS `Full Name`, 
age AS `Age`,
gender AS `Gender`,
join_date AS `Join Date`
FROM cyber_security_agency.analyst_profiles
WHERE gender = 'Female' AND join_Date >= '2015-01-01';

-- *************************

/*
	TAREA 3: Obtener todos los analistas que:
		- tengan salario menor o igual a 70000
		- o cuyo rol sea "Intern"
*/
SELECT analyst_id AS `ID`,
CONCAT(first_name, ' ', last_name) AS `Full Name`,
job AS `Job`,
salary AS `Salary($)`,
operation_code AS `Operation Code` 
FROM cyber_security_agency.analyst_assignments
WHERE salary <= 70000 OR job = 'Intern';

-- *************************

/*
	TAREA 4: Listar los analistas cuyo nombre:
		- empiece con "J"
		- o contenga la letra "a" en cualquier posición
*/
SELECT CONCAT(first_name, ' ', last_name) AS `Full Name`, 
age AS `Age`,
gender AS `Gender`,
join_date AS `Join Date`
FROM cyber_security_agency.analyst_profiles
WHERE first_name LIKE 'J%' OR first_name LIKE '%a%';

-- *************************

/*
	TAREA 5: Obtener todos los analistas cuyo apellido:
		- tenga exactamente 4 caracteres antes de "son"
*/
SELECT CONCAT(first_name, ' ', last_name) AS `Full Name`, 
age AS `Age`,
gender AS `Gender`,
join_date AS `Join Date`
FROM cyber_security_agency.analyst_profiles
WHERE last_name LIKE '____son';

-- *************************

/*
	TAREA 6: Listar los analistas que:
		- NO sean hombres
		- y cuya edad sea mayor a 30
*/
SELECT CONCAT(first_name, ' ', last_name) AS `Full Name`, 
age AS `Age`,
gender AS `Gender`,
join_date AS `Join Date`
FROM cyber_security_agency.analyst_profiles
WHERE gender <> 'Male' AND age > 30;

-- *************************

/*
	TAREA 7: Obtener todos los registros donde:
		- el código de operación sea NULL
		- o el salario sea mayor a 100000
*/
SELECT analyst_id AS `ID`,
CONCAT(first_name, ' ', last_name) AS `Full Name`,
job AS `Job`,
salary AS `Salary($)`,
operation_code AS `Operation Code` 
FROM cyber_security_agency.analyst_assignments
WHERE operation_code IS NULL OR salary > 100000;

-- *************************

/*
	TAREA 8: Listar analistas que cumplan:
		- (edad mayor a 40 Y género masculino)
		- O (edad menor a 35 Y género femenino)
*/
SELECT CONCAT(first_name, ' ', last_name) AS `Full Name`, 
age AS `Age`,
gender AS `Gender`,
join_date AS `Join Date`
FROM cyber_security_agency.analyst_profiles
WHERE (age > 40 AND gender = 'Male') OR (age < 35 AND gender = 'Female');

-- *************************

/*
	TAREA 9: Obtener todos los analistas cuyo nombre:
		- tenga exactamente 6 caracteres
*/
SELECT CONCAT(first_name, ' ', last_name) AS `Full Name`, 
age AS `Age`,
gender AS `Gender`,
join_date AS `Join Date`
FROM cyber_security_agency.analyst_profiles
WHERE first_name LIKE '______';

-- *************************

/*
	TAREA 10: Listar analistas que:
		- hayan ingresado en el año 2010, 2012 o 2015
		- usando únicamente patrones (LIKE)
*/
SELECT CONCAT(first_name, ' ', last_name) AS `Full Name`, 
age AS `Age`,
gender AS `Gender`,
join_date AS `Join Date`
FROM cyber_security_agency.analyst_profiles
WHERE join_date LIKE '2010%' OR join_date LIKE '2012%' OR join_date LIKE '2015%'; 

-- *************************

/*
	EJERCICIO 11: Obtener todos los analistas que:
		- no trabajen como "Threat Analyst"
		- y cuyo salario esté entre 70000 y 90000 (sin usar BETWEEN)
		- y cuyo apellido contenga al menos una "e"
*/
SELECT CONCAT(first_name, ' ', last_name) AS `Full Name`,
job AS `Job`,
salary AS `Salary($)`,
operation_code AS `Operation Code` 
FROM cyber_security_agency.analyst_assignments
WHERE job <> 'Threat Analyst' AND (salary >= 70000 AND salary <= 90000) AND last_name LIKE '%e%';

-- *************************

/*
	TAREA 12: Listar analistas que cumplan:
		- (nombre empieza con "A" o "D")
		- y (género distinto de "Male")
		- y (fecha de ingreso anterior a 2018 (considerando a 2018) o salario mayor a 80000)
		- y NO tengan rol "Intern"
*/
SELECT an_pro.analyst_id AS `ID`,
CONCAT(an_pro.first_name, ' ', an_pro.last_name) AS `Full Name`,
an_pro.AGE AS `Age`,
an_pro.gender AS `Gender`,
an_pro.join_date AS `Join Date`,
an_as.job AS `Job`,
an_as.salary AS `Salary($)`,
an_as.operation_code AS `Operation Code`
FROM cyber_security_agency.analyst_assignments AS an_as, cyber_security_agency.analyst_profiles AS an_pro
WHERE an_as.analyst_id = an_pro.analyst_id
AND (an_pro.first_name LIKE 'A%' OR an_pro.first_name LIKE 'D%')
AND (an_pro.gender <> 'Male')
AND (an_pro.join_date <= '2018-12-31' OR an_as.salary > 80000)
AND an_as.job <> 'Intern'; 