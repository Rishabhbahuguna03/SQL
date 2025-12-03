-- Window Functions

-- Before performing Window Functions, let's get some revision done for grouping by.

SELECT first_name, department,
(SELECT COUNT(*) FROM employees e2
WHERE e2.department = e1.department)
FROM employees e1
ORDER BY department;

SELECT first_name, department,
COUNT(*) OVER(PARTITION BY department)
FROM employees e2;


SELECT first_name, department,
COUNT(*) OVER(PARTITION BY department) dept_count,
region_id,
COUNT(*) OVER(PARTITION BY region_id) region_count
FROM employees e2
ORDER BY region_id;

-- This gives us employees per department sorted according to the region.
-- SET theory | Combining queries (UNION, INTERSECT, EXCEPT)

(SELECT first_name, department,
(SELECT COUNT(*) FROM employees e2
WHERE e2.department = e1.department)
FROM employees e1
ORDER BY department)
EXCEPT
SELECT first_name, department,
COUNT(*) OVER(PARTITION BY department)
FROM employees e2;

-- In the output section, we receive nothing, which means that both of our queries fetch the same output.