/*
	EJERCICIOS CON BASE A SQL FILE 001
*/

-- Crear la base de datos

DROP DATABASE IF EXISTS `online_academy`;
CREATE DATABASE `online_academy`;
USE `online_academy`;


/*
	Crear tabla
	Crea una tabla llamada `students` con esta estructura (Se asume que todo debe ser NOT NULL):
		- student_id (INT, PK)
		- first_name (VARCHAR 50)
		- last_name (VARCHAR 50)
		- age (INT)
		- country (VARCHAR 50)
		- enrollment_year (INT)
		- monthly_fee (INT)
*/

CREATE TABLE students (
	student_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    country VARCHAR(50) NOT NULL,
    enrollment_year INT NOT NULL,
    monthly_fee INT NOT NULL,
    PRIMARY KEY(student_id)
);


/*
	INSERTAR LOS SIGUIENTES DATOS:
    
		| id | first_name | last_name | age | country  | enrollment_year | monthly_fee |
		| -- | ---------- | --------- | --- | -------- | --------------- | ----------- |
		| 1  | Carlos     | López     | 22  | México   | 2022            | 100         |
		| 2  | Ana        | Torres    | 30  | España   | 2021            | 120         |
		| 3  | David      | Ruiz      | 27  | México   | 2023            | 90          |
		| 4  | Laura      | Gómez     | 35  | Colombia | 2020            | 150         |
		| 5  | Sofia      | Morales   | 19  | Perú     | 2023            | 80          |
		| 6  | Daniel     | Vega      | 40  | España   | 2019            | 200         |
		| 7  | Elena      | Castro    | 28  | Colombia | 2022            | 110         |
*/

INSERT INTO students(student_id, first_name, last_name, age, country, enrollment_year, monthly_fee)
VALUES
(1, 'Carlos', 'López', 22, 'México', 2022, 100),
(2, 'Ana', 'Torres', 30, 'España', 2021, 120),
(3, 'David', 'Ruiz', 27, 'México', 2023, 90),
(4, 'Laura', 'Gómez', 35, 'Colombia', 2020, 150),
(5, 'Sofia', 'Morales', 19, 'Perú', 2023, 80),
(6, 'Daniel', 'Vega', 40, 'España', 2019, 200),
(7, 'Elena', 'Castro', 28, 'Colombia', 2022, 110);


/*
	EJERCICIO 1: Consulta todas las columnas de la tabla `students`.
*/

SELECT *
FROM online_academy.students;


/*
	EJERCICIO 2:
	Muestra únicamente:
		- first_name
		- last_name
		- country
*/

SELECT first_name, last_name, country
FROM online_academy.students;


/*
	EJERCICIO 3:
    Muestra:
		- first_name
		- age
		- age dentro de 5 años (usa cálculo matemático y alias) 
		El alias debe llamarse: `age_in_5_years`
*/

SELECT first_name,
age,
age + 5 AS age_in_5_years
FROM online_academy.students;


/*
	EJERCICIO 4:
	Muestra:
		- first_name
		- monthly_fee
		- monthly_fee anual (monthly_fee * 12) - ALIAS: `annual_fee`
*/

SELECT first_name,
monthly_fee,
monthly_fee * 12 AS annual_fee
FROM online_academy.students;


/*
	EJERCICIO 5:
    Usa alias para la tabla (s) y muestra:
		- s.first_name
		- s.last_name
*/

SELECT s.first_name,
s.last_name
FROM online_academy.students AS s;


/*
	EJERCICIO 6:
    Muestra los países únicos.
*/

SELECT DISTINCT country
FROM online_academy.students;


/*
	Muestra combinaciones únicas de:
		- country
		- enrollment_year
*/

SELECT DISTINCT country, enrollment_year
FROM online_academy.students;


/*
	EJERCICIO 8:
	Muestra:
		- first_name
		- monthly_fee
		- monthly_fee + 20 (simulando aumento de precio) - ALIAS: `fee_after_increase`
*/

SELECT first_name,
monthly_fee,
monthly_fee + 20 AS fee_after_increase
FROM online_academy.students;


/*
	EJERCICIO 9:
    Muestra:
		- first_name
		- age
		- age * 2 - ALIAS: `double_age`
*/

SELECT first_name,
age,
age * 2 AS double_age
FROM online_academy.students;


/*
	EJERCICIO 10:
    Muestra:
		- first_name
		- enrollment_year
		- enrollment_year + 1  | ALIAS: next_year_enrollment
*/

SELECT first_name,
enrollment_year,
enrollment_year + 1 AS next_year_enrollment
FROM online_academy.students;
