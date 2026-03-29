/*
	Ejercicio: Auditoría de empleados del ayuntamiento
    
    El ayuntamiento de Pawnee (de la serie Parks and Recreation) quiere hacer un análisis 
	interno de su personal usando únicamente consultas básicas.
	Se te ha pedido generar distintos reportes a partir de las tablas:
		- employee_demographics
		- employee_salary
		- parks_departments
*/

-- *************************

/*
	Parte 1: Información básica enriquecida
    
    Genera un reporte con:
		- Nombre y apellido del empleado
		- Fecha de nacimiento
		- Edad actual
		- Edad proyectada en 5, 10 y 20 años
*/

SELECT first_name AS `Name`, 
last_name AS `Last Name`,
birth_date AS `Birth Date`,
age AS `Current Age`,
age + 5 AS `Age in 5 Years`,
age + 10 AS `Age in 10 Years`,
age + 20 AS `Age in 20 Years`
FROM parks_and_recreation.employee_demographics;

-- *************************

/*
	Parte 2: Exploración de diversidad
	
    Obtén:
		- Todos los géneros distintos en la tabla
		- Todas las combinaciones únicas de:
			> nombre
			> género
*/

-- Todos los géneros distintos en la tabla
SELECT  DISTINCT  gender AS `Distinct Genders`
FROM parks_and_recreation.employee_demographics;

-- Todas las combinaciones únicas de nombre y genero
SELECT DISTINCT first_name, gender
FROM parks_and_recreation.employee_demographics;

-- *************************

/*
	Parte 3: Análisis de salarios (sin joins)

	Desde la tabla employee_salary:
	Muestra:
		- nombre completo
		- ocupación
		- salario actual
		- salario incrementado en: 10% - 25% - 50%
*/

SELECT CONCAT(first_name, ' ', last_name) AS  `Full Name`,
occupation AS `Occupation`,
salary AS `Current Salary`,
salary + (salary * 0.10) AS  `Salary +10%`,
salary + (salary * 0.25) AS `Salary +25%`,
salary + (salary * 0.50) AS `Salary +50%`
FROM parks_and_recreation.employee_salary;

-- *************************

/*
	Parte 4: Auditoría de datos inconsistentes

	El ayuntamiento sospecha inconsistencias entre tablas.
	Identifica registros donde:
		- el salario existe pero el departamento es NULL
*/

SELECT employee_id AS `ID`,
CONCAT(first_name, ' ', last_name) AS `Full Name`,
occupation AS `Occupation`
FROM parks_and_recreation.employee_salary
WHERE salary IS NOT NULL AND dept_id IS NULL;

-- *************************

/*
	Parte 5: Proyección demográfica

	Genera un reporte que muestre:
		- nombre
		- edad actual
		- edad dentro de 1 década
        - edad dentro de medio siglo
*/

SELECT CONCAT(first_name, ' ', last_name) AS  `Full Name`,
age AS  `Current Age`,
age + 10 AS `Age in 10 Years`,
age + 50 AS  `Age in 50 Years`
FROM parks_and_recreation.employee_demographics;

