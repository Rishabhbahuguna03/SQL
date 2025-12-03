-- Conditional expressions using CASE Clause

SELECT first_name, salary,
CASE 
	WHEN salary < 100000 THEN 'Under Paid'
	WHEN salary > 100000 AND salary < 160000 THEN 'Paid Well'
	WHEN salary > 160000 THEN 'Executive'
END AS category
FROM employees
ORDER BY salary DESC;


-- Assignment:
-- My approach:

SELECT COUNT(category) FROM employees WHERE category IN
(SELECT
CASE 
	WHEN salary < 100000 THEN 'Under Paid'
	WHEN salary > 100000 AND salary < 160000 THEN 'Paid Well'
	WHEN salary > 160000 THEN 'Executive'
END AS category
FROM employees
ORDER BY salary DESC);

-- Ans.

SELECT a.category, COUNT(*) FROM 
(SELECT
CASE 
	WHEN salary < 100000 THEN 'Under Paid'
	WHEN salary > 100000 AND salary < 160000 THEN 'Paid Well'
	WHEN salary > 160000 THEN 'Executive'
END AS category
FROM employees
ORDER BY salary DESC) AS a
GROUP BY category;


-- Transposing

SELECT SUM(CASE WHEN salary < 100000 THEN 1 ELSE 0 END) AS under_paid,
 SUM(CASE WHEN salary > 100000 AND salary < 160000 THEN 1 ELSE 0 END) AS paid_well,
 SUM(CASE WHEN salary > 160000 THEN 1 ELSE 0 END) AS executive
FROM employees;


-- Transposing exercise
