-- UNION
SELECT DISTINCT department
FROM employees
UNION
SELECT department
FROM departments

-- UNION ALL
SELECT DISTINCT department
FROM employees
UNION ALL
SELECT department
FROM departments
-- Total: Select from both tables, combined in just one table.

SELECT DISTINCT department, region_id
FROM employees
UNION ALL
SELECT department, division
FROM departments
-- This will throw an error, as the number of columns and data type (region_id: text, division: numeric) must be same.

-- Correct one:
SELECT DISTINCT department, first_name
FROM employees
UNION ALL
SELECT department, division
FROM departments

SELECT DISTINCT department, first_name
FROM employees
ORDER BY department
UNION ALL
SELECT department, division
FROM departments
-- This will throw us an error, UNION ALL is considered as a part of the whole query.

-- Correct one:
SELECT DISTINCT department, first_name
FROM employees
UNION ALL
SELECT department, division
FROM departments
ORDER BY department

-- Stacking another column
SELECT DISTINCT department
FROM employees
UNION ALL
SELECT department
FROM departments
UNION
SELECT country
FROM regions
ORDER BY department

SELECT DISTINCT department
FROM employees
EXCEPT
SELECT department
FROM departments
--  In Oracle DB, we can also use MINUS. PG accepts EXCEPT only.

-- Assignment 01
-- Question
-- Solution:
SELECT department, count(*)
FROM employees
GROUP BY department
UNION ALL
SELECT 'TOTAL', COUNT(*)
FROM employees