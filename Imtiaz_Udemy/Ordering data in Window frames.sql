-- Window Functions

-- Let's find out the running total

SELECT first_name, hire_date, salary,
SUM(salary) OVER(ORDER BY hire_date RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) running_total_of_salaries
FROM employees;

-- Earlier, this used to happen, now:

SELECT first_name, hire_date, salary,
SUM(salary) OVER(ORDER BY hire_date) running_total_of_salaries
FROM employees;

-- Department wise

SELECT first_name, hire_date, salary, department,
SUM(salary) OVER(PARTITION BY department ORDER BY hire_date) running_total_of_salaries
FROM employees;


-- 
SELECT first_name, hire_date, department, salary,
SUM(salary) OVER(ORDER BY hire_date ROWS BETWEEN 1000 PRECEDING 
				 AND CURRENT ROW)
FROM employees;