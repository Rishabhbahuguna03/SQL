-- Assignment 01
-- Ques.
-- Sol.
(SELECT first_name, department, hire_date, country
FROM employees e INNER JOIN regions r
ON e.region_id = r.region_id
WHERE hire_date = (SELECT MIN(hire_date) FROM employees e2)
LIMIT 1)
UNION
SELECT first_name, department, hire_date, country
FROM employees e INNER JOIN regions r
ON e.region_id = r.region_id
WHERE hire_date = (SELECT MAX(hire_date) FROM employees e2)
ORDER BY hire_date

-- Assignment 02
-- Ques.
-- Sol.
SELECT hire_date, salary,
(SELECT SUM(salary) FROM employees e2
WHERE e2.hire_date BETWEEN e.hire_date - 90 AND e.hire_date) AS spending_pattern
FROM employees e
ORDER BY hire_date