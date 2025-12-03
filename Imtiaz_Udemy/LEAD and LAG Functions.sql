-- LEAD Function

SELECT first_name, email, salary,
LEAD(salary) OVER() next_salary
FROM employees;


-- LAG Function

SELECT first_name, email, salary,
LAG(salary) OVER() previous_salary
FROM employees;

-- Use-case: Closest highest, closest lowest salary for the employees in the department.


SELECT first_name, email, salary,
LAG(salary) OVER(ORDER BY salary DESC) closest_higher_salary 
FROM employees;


-- LEAD Function

SELECT first_name, email, salary,
LEAD(salary) OVER(ORDER BY salary DESC) closest_lower_salary 
FROM employees;

