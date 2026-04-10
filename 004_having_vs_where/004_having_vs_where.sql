/*
	HAVING VS WHERE
*/

SELECT gender AS `Gender`, AVG(age) AS `Average Age`
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

SELECT occupation AS `Occupation`, AVG(salary) AS `Average Salary`
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000;