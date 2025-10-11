
CREATE VIEW v_employee_information AS
SELECT first_name, email, e.department, salary, division
FROM employees e, departments d, regions r
WHERE e.department = d.department
AND e.region_id = r.region_id

SELECT * FROM v_employee_information

-- Query is being executed. This is a query and not a table. So, modification is not allowed.

SELECT * FROM (SELECT * FROM departments)
-- Inline view

SELECT * FROM regions