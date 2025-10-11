-- Assignment 07

-- 1. Are the tables student_enrollment and professors directly related to each other? Why or why not?
-- Ans. No, they are not related directly as there is no common column shared amongst them.

-- 2. Write a query that shows the student's name, the courses the student is taking and the professors that teach that course?
-- Ans. 
SELECT student_name, se.course_no, p.last_name
FROM students s
INNER JOIN student_enrollment se
ON s.student_no = se.student_no
INNER JOIN teach t
ON se.course_no = t.course_no
INNER JOIN professors p
ON t.last_name = p.last_name
ORDER BY student_name

-- 3. If you execute the query from the previous answer, you'll notice the student_name and the course_no is being repeated. Why is this happening?
-- Ans. This is due to one course (or subject) being taught by two professors.

-- 4. In question 3 you discovered why there is repeating data. How can we eliminate this redundancy? Let's say we only care to see a single professor teaching a course and we don't care for all the other professors that teach the particular course. Write a query that will accomplish this so that every record is distinct.
-- Ans. 
SELECT student_name, course_no, MIN(last_name)
FROM (
SELECT student_name, se.course_no, p.last_name
FROM students s
INNER JOIN student_enrollment se
    ON s.student_no = se.student_no
INNER JOIN teach t
    ON se.course_no = t.course_no
INNER JOIN professors p
    ON t.last_name = p.last_name
    ) a
    GROUP BY student_name, course_no
    ORDER BY student_name, course_no;

-- 5. Why are correlated subqueries slower that non-correlated subqueries and joins?
-- Ans. A "correlated subquery" (i.e., one in which the where condition depends on values obtained from the rows of the containing/outer query) will execute once for each row. A non-correlated subquery (one in which the where condition is independent of the containing query) will execute once at the beginning. If a subquery needs to run for each row of the outer query, that's going be very slow!

-- 6. Write a query that returns employees whose salary is above average for their given department.
-- Ans. 
SELECT first_name
FROM employees outer_emp
WHERE salary > (
SELECT AVG(salary)
FROM employees
WHERE department = outer_emp.department);

-- 7. Write a query that returns ALL of the students as well as any courses they may or may not be taking.
-- Ans. 
SELECT s.student_no, student_name, course_no
FROM students s LEFT JOIN student_enrollment se
ON s.student_no = se.student_no