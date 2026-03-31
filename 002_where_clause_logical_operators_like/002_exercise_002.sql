/*
	EJERCICIOS CON BASE A SQL FILE 002
*/

-- Creación de la Base de Datos

DROP DATABASE IF EXISTS `hospital_system`;
CREATE DATABASE `hospital_system`;
USE `hospital_system`;


-- Creación de las tablas correspondientes

CREATE TABLE patients (
	patient_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    diagnosis VARCHAR(70) NOT NULL,
    admission_date DATE NOT NULL,
    room_number INT NOT NULL,
    PRIMARY KEY(patient_id)
);

CREATE TABLE doctors (
	doctor_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(50) NOT NULL,
    years_experience INT NOT NULL,
    salary INT NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY(doctor_id)
);


/*
	Insertar los siguientes datos en la tabla `patients`:

	| patient_id | first_name | last_name | age | gender | diagnosis     | admission_date | room_number |
	| ---------- | ---------- | --------- | --- | ------ | ------------- | -------------- | ----------- |
	| 1          | Carlos     | Ramirez   | 45  | Male   | Diabetes      | 2023-01-10     | 101         |
	| 2          | Ana        | Lopez     | 30  | Female | Flu           | 2023-03-15     | 102         |
	| 3          | Miguel     | Torres    | 65  | Male   | Heart Disease | 2022-11-20     | 201         |
	| 4          | Sofia      | Martinez  | 25  | Female | Fracture      | 2023-06-01     | 103         |
	| 5          | Laura      | Hernandez | 50  | Female | Cancer        | 2021-09-12     | 301         |
	| 6          | David      | Gomez     | 70  | Male   | Alzheimer     | 2020-04-25     | 302         |
	| 7          | Elena      | Perez     | 40  | Female | Diabetes      | 2023-02-18     | 104         |
	| 8          | Andres     | Ruiz      | 55  | Male   | Flu           | 2022-12-05     | 202         |
*/

INSERT INTO patients(first_name, last_name, age, gender, diagnosis, admission_date, room_number) 
VALUES
('Carlos', 'Ramirez', 45, 'Male', 'Diabetes', '2023-01-10', 101),
('Ana', 'Lopez' , 30, 'Female', 'Flu', '2023-03-15', 102),
('Miguel', 'Torres', 65, 'Male', 'Heart Disease', '2022-11-20', 201),
('Sofia', 'Martinez', 25, 'Female', 'Fracture', '2023-06-01', 103),
('Laura', 'Hernandez', 50, 'Female', 'Cancer', '2021-09-12', 301),
('David', 'Gomez', 70, 'Male', 'Alzheimer', '2020-04-25', 302),
('Elena', 'Perez', 40, 'Female', 'Diabetes', '2023-02-18', 104),
('Andres', 'Ruiz', 55, 'Male', 'Flu', '2022-12-05', 202);


/*
	Insertar los siguientes datos en la tabla 'doctors':
    
    | doctor_id | first_name | last_name | specialty        | years_experience | salary | hire_date  |
	| --------- | ---------- | --------- | ---------------- | ---------------- | ------ | ---------- |
	| 1         | Roberto    | Diaz      | Cardiology       | 15               | 120000 | 2015-06-10 |
	| 2         | Maria      | Santos    | Oncology         | 20               | 150000 | 2010-03-22 |
	| 3         | Luis       | Navarro   | Neurology        | 10               | 110000 | 2018-07-01 |
	| 4         | Patricia   | Morales   | General Medicine | 8                | 90000  | 2019-09-15 |
	| 5         | Jorge      | Castillo  | Orthopedics      | 12               | 115000 | 2016-05-30 |
	| 6         | Carmen     | Vega      | Pediatrics       | 5                | 85000  | 2021-01-10 |
*/

INSERT INTO doctors(first_name, last_name, specialty, years_experience, salary, hire_date)
VALUES
('Roberto', 'Diaz', 'Cardiology', 15, 120000, '2015-06-10'),
('Maria', 'Santos', 'Oncology', 20, 150000, '2010-03-22'),
('Luis', 'Navarro', 'Neurology', 10, 110000, '2018-07-01'),
('Patricia', 'Morales', 'General Medicine', 8, 90000, '2019-09-15'),
('Jorge', 'Castillo', 'Orthopedics', 12, 115000, '2016-05-30'),
('Carmen', 'Vega', 'Pediatrics', 5, 85000, '2021-01-10');


-- Verificación de inserción de datos

SELECT * FROM hospital_system.patients;

SELECT * FROM hospital_system.doctors;


/*	
	EJERCICIO 1:
	Mostrar todos los pacientes cuya edad sea mayor a 50
	y cuyo diagnóstico sea exactamente 'Diabetes'.
*/

SELECT *
FROM hospital_system.patients
WHERE age > 50 AND diagnosis = 'Diabetes';


/*	
	EJERCICIO 2:
	Mostrar pacientes donde:
	la edad sea mayor o igual a 40
	y la fecha de admisión sea posterior a 2022-01-01
*/

SELECT *
FROM hospital_system.patients
WHERE age >= 40 AND admission_date > '2022-01-01';


/*
	EJERCICIO 3:
    Mostrar pacientes donde:
	el diagnóstico sea 'Flu'
	o el número de habitación sea mayor a 200
*/

SELECT *
FROM hospital_system.patients
WHERE diagnosis = 'Flu' OR room_number > 200;


/*
	EJERCICIO 4:
    Mostrar pacientes donde:
	(diagnosis sea 'Diabetes' y edad mayor a 40)
	o gender sea 'Female'
*/

SELECT *
FROM hospital_system.patients
WHERE (diagnosis = 'Diabetes' AND age > 40) OR gender = 'Female';


/*
	EJERCICIO 5:
	Mostrar pacientes que:
	NO tengan diagnóstico 'Flu'
	y cuya edad sea menor a 60
*/

SELECT *
FROM hospital_system.patients
WHERE diagnosis <> 'Flu' AND age < 60;


/*
	EJERCICIO 6:
	Mostrar pacientes cuyo apellido empiece con la letra 'R'.
*/

SELECT *
FROM hospital_system.patients
WHERE last_name LIKE 'R%';


/*
	EJERCICIO 7:
    Mostrar pacientes cuyo apellido contenga 'ez'.
*/

SELECT *
FROM hospital_system.patients
WHERE last_name LIKE '%ez%';


/*
	EJERCICIO 8:
    Mostrar pacientes admitidos en el año 2023.
*/

SELECT *
FROM hospital_system.patients
WHERE admission_date LIKE '2023%';


/*
	EJERCICIO 9:
    Mostrar pacientes donde:
	(edad mayor a 60 y diagnosis diferente de 'Alzheimer')
	o (fecha de admisión anterior a 2021-01-01)
*/

SELECT *
FROM hospital_system.patients
WHERE (age > 60 AND diagnosis <> 'Alzheimer') OR admission_date < '2021-01-01';


/*
	EJERCICIO 10:
	Mostrar doctores donde:
	years_experience mayor o igual a 10
	y salary mayor a 100000
*/

SELECT *
FROM hospital_system.doctors
WHERE years_experience >= 10 AND salary > 100000;


/*
	EJERCICIO 11:
    Mostrar doctores donde:
	specialty sea 'Cardiology'
	o (salary mayor a 110000 y years_experience mayor a 12)
*/

SELECT *
FROM hospital_system.doctors
WHERE specialty = 'Cardiology' OR (salary > 110000 AND years_experience > 12);


/*
	EJERCICIO 12:
	Mostrar doctores que:
	NO tengan specialty 'Pediatrics'
	y (salary menor a 120000 o years_experience mayor a 15)
*/

SELECT *
FROM hospital_system.doctors
WHERE specialty <> 'Pediatrics' AND (salary < 120000 OR years_experience > 15);


/*
	EJERCICIO 13:
    Mostrar diagnósticos únicos de los pacientes.
*/

SELECT DISTINCT diagnosis
FROM hospital_system.patients;


/*
	EJERCICIO 14:
    Mostrar:
		- first_name
		- age
		- age + 10 como edad_en_10_anios
	Pero solo para pacientes donde:
		- edad mayor o igual a 45
		- y diagnosis diferente de "Cancer"
*/

SELECT first_name,
age,
age + 10 AS edad_en_10_anios
FROM hospital_system.patients
WHERE age >= 45 AND diagnosis <> 'Cancer';


/*
	EJERCICIO 15:
	Mostrar pacientes donde:
	- (diagnosis sea 'Flu' o diagnosis sea "Diabetes")
	- y (edad entre 30 y 60 usando comparadores normales, no BETWEEN)
	- y la fecha de admisión sea posterior a 2022-01-01
*/

SELECT *
FROM hospital_system.patients
WHERE diagnosis IN ('Flu', 'Diabetes') AND (age >= 30 AND age <= 60) AND admission_date > '2022-01-01';
