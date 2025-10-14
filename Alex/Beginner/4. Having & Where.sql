-- HAVING

SELECT gender, AVG(age) 
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40

-- HAVING runs only after running AGGREGATE functions in GROUP BY

SELECT occupation, AVG(salary) 
FROM employee_salary
WHERE occupation LIKE '%Manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000

--  WHERE: Row-level, HAVING: AGGREGATE function level.
-- WHERE

SELECT gender, AVG(age) 
FROM employee_demographics
WHERE AVG(age) > 40
GROUP BY gender

--  Throws an error, as AGGREGATE functions are not allowed in WHERE clause.