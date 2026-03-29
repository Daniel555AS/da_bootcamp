-- Crear la base de datos Space_Mission_Crew.
DROP DATABASE IF EXISTS `Space_Mission_Crew`;
CREATE DATABASE `Space_Mission_Crew`;
USE `Space_Mission_Crew`;

-- *************************

-- Crear las tres tablas (crew_demographics, crew_salary, space_missions) con sus respectivas columnas y claves.
-- Tabla `crew_demographics` 
CREATE TABLE crew_demographics (
	crew_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    PRIMARY KEY(crew_id)
);

-- Tabla `crew_salary`
CREATE TABLE crew_salary (
	crew_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    job VARCHAR(75) NOT NULL,
	salary INT NOT NULL,
    mission_id INT,
    PRIMARY KEY(crew_id)
);

-- Tabla `space_missions`
CREATE TABLE space_missions (
	mission_id INT NOT NULL,
    mission_name VARCHAR(75) NOT NULL,
    PRIMARY KEY(mission_id)
);

-- *************************

-- Insertar todos los datos proporcionados en cada tabla.
-- Inserción de datos para `crew_demographics`
INSERT INTO crew_demographics(crew_id, first_name, last_name, age, gender, birth_date)
VALUES
(1, 'Amelia', 'Earhart', 39, 'Female', '1987-07-24'),
(2, 'Yuri', 'Gagarin', 34, 'Male', '1992-03-09'),
(3, 'Valentina', 'Tereshkova', 40, 'Female', '1986-06-06'),
(4, 'Neil', 'Armstrong', 42, 'Male', '1984-08-05'),
(5, 'Sally', 'Ride', 37, 'Female', '1989-05-26'),
(6, 'Chris', 'Hadfield', 45, 'Male', '1978-08-29'),
(7, 'Mae', 'Jemison', 41, 'Female', '1982-10-17'),
(8, 'Buzz', 'Aldrin', 43, 'Male', '1980-01-20'),
(9, 'Peggy', 'Whitson', 50, 'Female', '1973-02-09'),
(10, 'John', 'Glenn', 48, 'Male', '1975-07-18');

-- Inserción de datos para `crew_salary`
INSERT INTO crew_salary(crew_id, first_name, last_name, job, salary, mission_id)
VALUES
(1, 'Amelia', 'Earhart', 'Pilot', 95000, 1),
(2, 'Yuri', 'Gagarin', 'Mission Specialist', 90000, 1),
(3, 'Valentina', 'Tereshkova', 'Flight Engineer', 92000, 2),
(4, 'Neil', 'Armstrong', 'Commander', 100000, 2),
(5, 'Sally', 'Ride', 'Scientist', 88000, 3),
(6, 'Chris', 'Hadfield', 'Pilot', 97000, 3),
(7, 'Mae', 'Jemison', 'Scientist', 89000, 4),
(8, 'Buzz', 'Aldrin', 'Commander', 102000, 4),
(9, 'Peggy', 'Whitson', 'Flight Engineer', 94000, NULL),
(10, 'John', 'Glenn', 'Mission Specialist', 91000, NULL);

-- Inserción de datos para `space_missions`
INSERT INTO space_missions(mission_id, mission_name)
VALUES
(1, 'Lunar Explorer'),
(2, 'Mars Recon'),
(3, 'Venus Orbiter'),
(4, 'Titan Survey'),
(5, 'Jupiter Probe');

-- *************************

/*
	TAREA 1: Selecciona todas las columnas de la tabla `crew_demographics`.
*/
SELECT *
FROM space_mission_crew.crew_demographics;

-- *************************

/*
	TAREA 2: Selecciona únicamente nombre, apellido y fecha de nacimiento de los tripulantes.
*/
SELECT CONCAT(first_name, ' ', last_name) AS `Full Name`,
birth_date AS `Birth Date`
FROM space_mission_crew.crew_demographics;

-- *************************

/*
	TAREA 3: Muestra una consulta que incluya edad actual y edad en 5, 10 y 15 años usando alias para cada columna.
*/
SELECT crew_id AS `Crew ID`,
age AS `Current Age`,
age + 5 AS `Age in 5 Years`,
age + 10 AS `Age in 10 Years`,
age + 15 AS `Age in 15 Years`
FROM space_mission_crew.crew_demographics;

-- *************************

/*
	TAREA 4: Aplica un alias a la tabla crew_demographics y selecciona solo first_name y last_name.
*/
SELECT cd.first_name AS `First Name`, cd.last_name AS `Last Name`
FROM space_mission_crew.crew_demographics AS cd;

-- *************************

/*
	TAREA 5: Lista los géneros distintos de los tripulantes.
*/
SELECT DISTINCT gender AS `Distinct Gender`
FROM space_mission_crew.crew_demographics;

-- *************************

/*
	TAREA 6: Lista todas las combinaciones únicas de nombre (`first_name`) y género de los tripulantes.
*/
SELECT DISTINCT first_name, gender
FROM space_mission_crew.crew_demographics;

-- *************************

/*
	TAREA 7: Selecciona los nombres y salarios de los tripulantes, mostrando también
			 el salario incrementado en 10%, 20% y 50%, usando alias para cada cálculo.
*/
SELECT CONCAT(first_name, ' ', last_name) AS `Full Name`,
salary AS `Current Salary`,
salary + (salary * 0.10) AS `+10%`,
salary + (salary * 0.20) AS `+20%`,
salary + (salary * 0.50) AS `+50%`
FROM space_mission_crew.crew_salary;



