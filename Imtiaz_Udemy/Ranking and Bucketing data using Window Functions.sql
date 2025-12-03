-- RANK Function

-- Ranking

SELECT first_name, email, department, salary,
RANK() OVER(PARTITION BY department ORDER BY salary DESC)
FROM employees;

-- Where clause: it is used to filter based on the table. and here, employees is the universal table getting used. That's why we have to use subquery


-- Bucketing 

SELECT first_name, email, department, salary,
NTILE(5) OVER(PARTITION BY department ORDER BY salary DESC) salary_bucket
FROM employees;

-- This gives us top 5 based on the salaries however, in this, NULLs are getting counted.


-- FIRST_VALUE Function

SELECT first_name, email, department, salary, department,
FIRST_VALUE(salary) OVER(PARTITION BY department ORDER BY first_name DESC) first_value
FROM employees;

-- Note that, FIRST_VALUE behaves same as MAX() function.


-- NTH_VALUE Function

SELECT first_name, email, department, salary, department,
NTH_VALUE(salary,5) OVER(PARTITION BY department ORDER BY first_name ASC) nth_value
FROM employees;

