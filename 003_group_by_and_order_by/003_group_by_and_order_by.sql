/*
	GROUP BY -> Clause
			 -> Group together rows that have the same values in the
				specified column or columns that you are actually
                grouping on
*/

-- Trabajar en la Base de Datos `parks_and_recreation`
USE `parks_and_recreation`;

-- Consultar todos los registros de la tabla `employee_demographics`
SELECT * 
FROM parks_and_recreation.employee_demographics;

-- Agrupar los valores de `gender` -> Se obtienen los grupos de género existentes
SELECT gender AS `Gender`
FROM parks_and_recreation.employee_demographics
GROUP BY gender;

-- Obtender la edad promedio, según el género
SELECT gender AS `Gender`,
AVG(age) AS `Average Age`
FROM parks_and_recreation.employee_demographics
GROUP BY gender;
/*
	La edad (años) promedio de 'Female' es 38.5, mientras que la edad (años) promedio de 'Male' es aproximadamente
    41.3, por lo tanto, se concluye que, en promedio, los empleados Hombres, son mayores que las empleadas Mujeres.
*/

-- Consultar todos los registros de la tabla `employee_salary`
SELECT *
FROM parks_and_recreation.employee_salary;

-- Agrupar las `occupation` que hay en la empresa (Reconocer cuáles grupos hay)
SELECT occupation AS `Occupation`
FROM parks_and_recreation.employee_salary
GROUP BY occupation;

-- Agrupar registros de la tabla `employee_salary`, por `occupation` y `salary`
SELECT occupation AS `Occupation`,
salary AS `Salary`
FROM parks_and_recreation.employee_salary
GROUP BY occupation, salary;

-- Determinar la edad máxima, mínima y cantidad de 'Male' y 'Female'
SELECT gender AS `Gender`,
MIN(age) AS `Min. Age`,
MAX(age) AS `Max. Age`,
COUNT(gender) AS `Count`
FROM parks_and_recreation.employee_demographics
GROUP BY gender;
/*
	Hay 4 mujeres y 7 hombres, de los cuáles, las edades mínimas son 29 y 34 años, respectivamente
    y las edades máximas son 46 y 61 años, respectivamente.
*/

-- NOTA: Para observar la collation que usa la BD
SELECT @@collation_database;
SELECT @@collation_database;
SELECT @@collation_database;

-- Mostrar todos los registros de la tabla `employee_demographics` y ordenarldos (ASC) por `first_name`
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name;
-- ASC es por defecto (También se podría escribir explícitamente)

-- Ahora, escribir la misma sentencia, pero ordenada DESC
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY first_name DESC;

/*
	Hacer un ordenamiento basado en 2 columnas: `gender`, `age`; para todos los registros
	de la tabla `employee_demographics`
*/
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender, age;
-- El ordenamiento, por criterio de ambas columnas, de forma sucesiva, está por defecto ASC

/*
	Ahora, con base a la sentencia anterior, hacer que el ordenamiento por `gender` sea ASC y que
    el ordenamiento por `age` sea DESC (Combinando ambos sentidos)
*/
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY gender ASC, age DESC;

/*
	Ahora, escriba la misma sentencia anterior, pero usando las posiciones de las columnas, en lugar de sus nombres
	(A pesar de que esto es posible, no se considera buena práctica)
*/
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY 5 ASC, 4 DESC
-- En este caso, la posición de la columna `gender` es 5 y la posición de la columna `age` es 4