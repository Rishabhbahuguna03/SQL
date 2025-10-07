-- 1. INNER Join
SELECT first_name, country
FROM employees e INNER JOIN regions r
ON e.region_id = r.region_id

-- Syntax: FROM First Table INNER JOIN Second Table ON First Table.Column = Second Table.Column (Column = Common)

SELECT first_name, email, division, country
FROM employees e INNER JOIN departments d 	 regions r
ON e.department = d.department
INNER JOIN regions ON e.region_id = r.region_id
WHERE email is not NULL

-- INNER JOIN regions is joining on the result of the above line of code.

SELECT DISTINCT department FROM employees 
-- Result: 27 Deptt.

SELECT DISTINCT department FROM departments
-- Result: 24 Deptt.

SELECT distinct employees.department, departments.department
FROM employees INNER JOIN departments ON employees.department = departments.department

-- INNER Join used to get matching records

--  2. LEFT & RIGHT Join
SELECT distinct employees.department, departments.department
FROM employees LEFT JOIN departments ON employees.department = departments.department

--  Preference is given to the left table. Total 27 rows will be received as a result and 3 departments will throw NULL as they don't exist.

SELECT distinct employees.department employees_department, departments.department departments_department
FROM employees RIGHT JOIN departments ON employees.department = departments.department

--  Preference is given to the right table. Total 24 rows will be received with 1 NULL which doesn't exist.
--  No use of = to be made, whenever we're comparing NULLs

SELECT distinct employees.department employees_department
FROM employees LEFT JOIN departments ON employees.department = departments.department
WHERE departments.department IS NULL

-- 3. FULL OUTER Join
SELECT distinct employees.department employees_department, departments.department departments_department
FROM employees FULL OUTER JOIN departments ON employees.department = departments.department

-- LEFT & RIGHT Join can also be called as LEFT OUTER Join & RIGHT OUTER Join resp.