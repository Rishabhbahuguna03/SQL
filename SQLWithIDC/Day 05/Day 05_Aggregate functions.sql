-- Practice questions:
-- Q.1. Count the total number of patients in the hospital.

SELECT COUNT(patient_id) as total_patients
FROM patients;

-- Q.2. Calculate the average satisfaction score of all patients.

SELECT ROUND(AVG(satisfaction),2) AS avg_satisfaction
FROM patients;

-- Q.3. Find the minimum and maximum age of patients.

SELECT MIN(age), MAX(age)
FROM patients;


-- Day 05 Challenge Question:
-- Calculate the total number of patients admitted, total patients refused, and the average patient satisfaction across all services and weeks. Round the average satisfaction to 2 decimal places.

SELECT
  SUM(COALESCE(patients_admitted,0)) AS total_patients_admitted,
  SUM(COALESCE(patients_refused,0)) AS total_patients_refused,
  ROUND(AVG(COALESCE(patient_satisfaction,0))::numeric, 2) AS avg_satisfaction
FROM services_weekly;

