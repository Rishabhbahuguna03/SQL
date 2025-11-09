-- Practice questions:
-- Q.1. Count the number of patients by each service.

SELECT service, COUNT(patient_id) AS no_of_patients
FROM patients
GROUP BY service;

-- Q.2. Calculate the average age of patients grouped by service.

SELECT service, ROUND(AVG(age), 2) AS avg_age
FROM patients
GROUP BY service;

-- Q.3. Find the total number of staff members per role.

SELECT role, COUNT(staff_id) AS total_staff_members
FROM staff
GROUP BY role;


-- Day 06 Challenge Question:
-- For each hospital service, calculate the total number of patients admitted, total patients refused, and the admission rate (percentage of requests that were admitted). Order by admission rate descending.

SELECT service, 
	   SUM(patients_admitted) AS total_admitted,
	   SUM(patients_refused) AS total_refused,
	   ROUND((SUM(patients_admitted)::numeric / SUM(patients_request)) * 100, 2) AS admission_rate
FROM services_weekly
GROUP BY service
ORDER BY admission_rate DESC;
