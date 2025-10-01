-- Subquery Basics | Query inside query 
-- The query in Parenthesis is Subquery.

SELECT
	*
FROM
	EMPLOYEES
WHERE
	DEPARTMENT NOT IN (
		SELECT
			DEPARTMENT
		FROM
			DEPARTMENTS
	)

-- Subquery eg. FROM & WHERE Clause

SELECT a.employee_name, yearly_salary
FROM (Select first_name employee_name, salary yearly_salary
      FROM employees WHERE salary > 150000) a,
      (Select department employee_name, FROM departments) b

--  This will throw an error, will rectify it later, while revising.