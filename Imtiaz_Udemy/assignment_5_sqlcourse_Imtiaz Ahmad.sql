select * from students
select * from courses
select * from student_enrollment

-- Q.1. Is the students table directly related to the courses table? Why or why not?
-- Ans. Students table is not directly related to the courses table.
-- This is because, students table contains student information & courses table contain only courses information.
-- Whereas, the student_enrollment table contains the details of student enrolled in a particular course is available in the student_enrollment table.

-- Q.2 Return the names of those students who are taking the courses Physics and US History?
-- Ans.
SELECT students FROM students
WHERE student_no IN (SELECT student_no FROM student_enrollment
					WHERE course_no IN (SELECT course_no FROM courses
					WHERE course_title IN ('Physics', 'US History')))

-- Q.3. Return the name of the student that is taking the highest number of courses.
-- Ans. 
SELECT student_name FROM students
WHERE student_no IN (SELECT student_no FROM (SELECT student_no, COUNT(course_no) course_cnt FROM student_enrollment
GROUP BY student_no ORDER BY course_cnt DESC LIMIT 1))

-- Q.4. State True or False:
-- Subqueries can be used in the FROM clause and the WHERE clause but cannot be used in the SELECT Clause.
-- Ans. False. It can be used in SELECT, FROM & WHERE, HAVING Clause.

-- Q.5. Find the student that is the oldest. You are not allowed to use LIMIT or the ORDER BY clause to solve this problem.
-- Ans.
SELECT * FROM students WHERE AGE = (SELECT MAX(age) FROM students)