/*
	Este SQL File está relacionado con la Base de Datos `parks_and_recreation`. La creación de esta BD, sus respectivas tablas
    y la inserción de datos se ha realizado en el SQL FILE 001
*/

-- Uso de la cláusula WHERE - con comparador = (Igual que)
SELECT *
FROM parks_and_recreation.employee_salary
WHERE first_name = 'Leslie';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender = 'Female';

-- Uso de la cláusula WHERE - con comparador <> / != (Distinto de)
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender <> 'Female';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender != 'Male';

-- Uso de la cláusula WHERE - con comparador > (Mayor que)
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary > 50000;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01';

-- Uso de la cláusula WHERE - con comparador < (Menor que)
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary < 50000;

-- Uso de la cláusula WHERE - con comparador >= (Mayor o igual que)
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000;

-- Uso de la cláusula WHERE - con comparador <= (Menor o igual que)
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary <= 50000;



-- LOGICAL OPERATORS (Operador Lógicos) : NOT, AND, OR

-- AND : Todas las condiciones deben ser verdaderas
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01' AND gender = 'Male';

-- OR : Al menos una condición debe ser verdadera
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01' OR  gender = 'Male';

-- NOT : Negar condición
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01' OR NOT  gender = 'Male';

-- Combinación de Operadores Lógicos
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55;


-- LIKE : Para búsqueda de patrones
-- & -> Para cualquier cantidad de caracteres | _ -> Para un solo caracter

-- Empienza con 'Jer' y después puede seguir con cualquier cantidad de caracteres
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'Jer%';

-- Empieza y termina con cualquier cantidad de caracteres, pero en medio tiene 'nn'
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '%nn%';

-- Empieza exactamente con dos(2) caraceteres, después tiene 've' y termina con cualquier cantidad de caracteres
SELECT * 
FROM parks_and_recreation.employee_demographics
WHERE last_name LIKE '__ve%';

-- Ejemplo con DATE (birth_date) : Personas nacidas en 1985
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1985%';