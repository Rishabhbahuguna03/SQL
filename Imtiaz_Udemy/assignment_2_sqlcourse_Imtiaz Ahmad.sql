-- Q.1.
SELECT
	*
FROM
	STUDENTS
WHERE
	AGE BETWEEN 18 AND 20;

-- Q.2.
SELECT *
FROM STUDENTS
WHERE STUDENT_NAME LIKE '%ch%'
OR STUDENT_NAME LIKE '%nd%';

-- '%text%' matches if 'text' appears anywhere in the string
-- '%xt' matches if the string ends with 'xt'

-- Q.3.
SELECT student_name
FROM STUDENTS
WHERE (STUDENT_NAME LIKE '%ae%'
OR STUDENT_NAME LIKE '%ph%')
AND age != 19;

-- Q.4.
SELECT
	STUDENT_NAME
FROM
	STUDENTS
ORDER BY
	AGE DESC;

-- Q.5.
SELECT
	STUDENT_NAME,
	AGE
FROM
	STUDENTS
ORDER BY
	AGE DESC 
LIMIT 4;

-- Q.6. 
SELECT *
FROM students
WHERE age <= 20
AND (student_no BETWEEN 3 AND 5 OR student_no = 7)
OR (age > 20 AND student_no >= 4);

-- Typical question. This demands more practice