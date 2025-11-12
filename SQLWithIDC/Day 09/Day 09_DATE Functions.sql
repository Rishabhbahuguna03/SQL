-- Practice questions:
-- Q.1. Extract the year from all patient arrival dates.

SELECT 
    name,
    EXTRACT(YEAR FROM arrival_date) AS arrival_year
FROM patients;

-- Q.2. Calculate the length of stay for each patient (departure_date - arrival_date).

SELECT 
    patient_id,
    name,
    (departure_date - arrival_date) AS length_of_stay
FROM patients;

-- Q.3. Find all patients who arrived in a specific month.

SELECT 
    patient_id,
    name,
    TO_CHAR(arrival_date, 'Mon') AS arrival_month
FROM patients;

-- Day 09 Challenge Question:
-- Calculate the average length of stay (in days) for each service, showing only services where the average stay is more than 7 days. Also show the count of patients and order by average stay descending.

SELECT 
    service,
    ROUND(AVG(departure_date - arrival_date), 2) AS avg_stay,
    COUNT(*) AS patient_count
FROM patients
GROUP BY service
HAVING AVG(departure_date - arrival_date) > 7
ORDER BY avg_stay DESC;


