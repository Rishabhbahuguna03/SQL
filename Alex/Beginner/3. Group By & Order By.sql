-- GROUP BY

SELECT gender, ROUND(AVG(age),2), MAX(age), MIN(age), COUNT(age) 
FROM employee_demographics
GROUP BY gender

-- ORDER BY

SELECT * 
FROM employee_demographics
ORDER BY 5,4