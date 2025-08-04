-- Q.1.
SELECT last_name ||' ' || 'works in the ' || department || ' department'
FROM professors

-- Q.2.
SELECT 'It is ' || (salary > 95000) || 
       ' that professor ' || last_name || ' is highly paid'
FROM professors;

-- Q.3.
SELECT last_name,
UPPER(SUBSTRING(department, 1 , 3)) AS department, salary, hire_date
FROM professors;

-- Q.4.
SELECT
	MAX(SALARY) AS HIGHEST_SALARY,
	MIN(SALARY) AS LOWEST_SALARY
FROM
	PROFESSORS
WHERE
	LAST_NAME != 'Wilson';

-- Q.5.
SELECT MIN(hire_date) FROM professors;