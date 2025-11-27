-- Practice questions:
-- Q.1. Rank patients by satisfaction score within each service.

SELECT 
  patient_id,
  name,
  service,
  satisfaction,
  DENSE_RANK() OVER (PARTITION BY service ORDER BY satisfaction DESC) AS satisfaction_score
FROM patients;

-- Q.2. Assign row numbers to staff ordered by their name.

SELECT 
   staff_id,
   staff_name,
ROW_NUMBER() OVER (ORDER BY staff_name ASC) AS staff
FROM staff;

-- Q.3. Rank services by total patients admitted.

SELECT
  service,
  SUM(patients_admitted) AS total_patients_admitted,
DENSE_RANK() OVER(ORDER BY SUM(patients_admitted) DESC) as rank 
FROM services_weekly
GROUP BY service;


-- Day 19 Challenge Question:
-- For each service, rank the weeks by patient satisfaction score (highest first). Show service, week, patient_satisfaction, patients_admitted, and the rank. Include only the top 3 weeks per service.

SELECT * 
FROM (
SELECT 
    service,
	week,
	patient_satisfaction,
	patients_admitted,
ROW_NUMBER() OVER(PARTITION BY service ORDER BY patient_satisfaction DESC) AS rank
FROM services_weekly) AS s
WHERE rank<=3;
