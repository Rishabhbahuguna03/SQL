-- Loading first 5 rows from `patients` table

SELECT * 
FROM patients 
LIMIT 5;

-- Practice questions:
-- Q.1. Retrieve all columns from the patients table.

SELECT * 
FROM patients;

-- Q.2. Select only the patient_id, name, and age columns from the patients table.

SELECT patient_id, name, age
FROM patients;

-- Q.3. Display the first 10 records from the services_weekly table.

SELECT *
FROM services_weekly
LIMIT 10;



-- Day 01
List all unique hospital services available in the hospital.

SELECT DISTINCT service
FROM services_weekly;

