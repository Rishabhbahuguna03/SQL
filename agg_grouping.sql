SELECT * FROM employees

SELECT MAX(salary)
FROM employees;

SELECT MIN(salary)
FROM employees;

SELECT ROUND(AVG(salary))
FROM employees;

SELECT COUNT(employee_id)
FROM employees;

SELECT COUNT(*)
FROM employees;

SELECT SUM(salary)
FROM employees
WHERE department = 'Clothing';
