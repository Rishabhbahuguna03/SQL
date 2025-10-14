-- LIMIT 

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3

-- ALIASING

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40

-- This throws an ERROR. 
-- Happens because PostgreSQL processes SQL clauses in a strict logical order.
-- The HAVING clause is evaluated before the SELECT clause, where avg_age (the alias) is created.
-- So when PostgreSQL reaches HAVING avg_age > 40, the alias doesn’t yet exist in memory.

SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

-- So, to fix this, we use the actual AGGREGATE function, instead of alias.
