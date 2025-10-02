-- Subquery Basics | Query inside query 
-- The query in Parenthesis is Subquery.

SELECT
	*
FROM
	employees
WHERE
	department NOT IN (
		SELECT
			department
		FROM
			departments
	)

-- Subquery eg. FROM & WHERE Clause

SELECT
	a.employee_name,
	yearly_salary
FROM
	(
		SELECT
			first_name employee_name,
			salary yearly_salary
		FROM
			employees
		WHERE
			salary > 150000
	) a,
	(
		SELECT
			department employee_name,
		FROM
			departments
	) b

--  This will throw an error, will rectify it later, while revising.


-- Assignment 01 

SELECT
	*
FROM
	employees
WHERE
	department IN (
		SELECT
			department
		FROM
			departments
		WHERE
			division = 'Electronics'
	)

-- Where I found myself wrong? used electronics instead of Electronics. 
-- How will I correct this? Since SQL is case-sensitive by default, I’ll either normalize with LOWER() or use ILIKE to avoid mismatches.

-- Assignment 02
-- Here are the tables:

SELECT
	*
FROM
	employees
	
SELECT
	*
FROM
	regions


SELECT
	*
FROM
	employees
WHERE
	salary > 130000 
AND region_id
	IN (
		SELECT
			region_id
		FROM
			regions
		WHERE
			country = 'Asia' OR country = 'Canada'
	)

-- Alt, Using IN Clause as a part of the list, 'Asia', 'Canada'

SELECT
	*
FROM
	employees
WHERE
	salary > 130000 
AND region_id
	IN (
		SELECT
			region_id
		FROM
			regions
		WHERE
			country IN ('Asia','Canada')
	)

-- Assignment 03

SELECT
	first_name, department, 
	(SELECT MAX(salary) FROM employees) - salary
FROM
	employees
WHERE
	region_id
	IN (
		SELECT
			region_id
		FROM
			regions
		WHERE
			country IN ('Asia','Canada')
	)

	