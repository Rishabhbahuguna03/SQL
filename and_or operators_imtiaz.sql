SELECT
	*
FROM
	EMPLOYEES
WHERE
	SALARY < 40000
AND (department = 'Clothing'
OR department = 'Pharmacy')

-- Presence of parenthesis () causes the condition 
-- within them to be evaluated together.


SELECT
	*
FROM
	EMPLOYEES
WHERE
	DEPARTMENT = 'Sports'
OR  DEPARTMENT = 'Tools'
