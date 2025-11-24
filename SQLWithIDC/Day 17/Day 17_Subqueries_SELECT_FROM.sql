-- Practice questions:
-- Q.1. Show each patient with their service's average satisfaction as an additional column.

SELECT patient_id, name, service, ROUND(AVG(satisfaction)) AS avg_satisfaction
FROM patients
WHERE service IN (SELECT DISTINCT service FROM services_weekly)
GROUP BY 1, 2, 3;


-- Q.2. Create a derived table of service statistics and query from it.

SELECT p.patient_id,p.name,p.service,
    (SELECT AVG(p2.satisfaction)
     FROM patients p2
     WHERE p2.service = p.service
    ) AS avg_satisfaction,
    (SELECT COUNT(*)
     FROM patients p3
     WHERE p3.service = p.service
    ) AS total_patients
FROM patients p;


-- Q.3. Display staff with their service's total patient count as a calculated field.

SELECT s.staff_id,s.staff_name,s.role,s.service,
    (SELECT COUNT(*)
     FROM patients p
     WHERE p.service = s.service
    ) AS service_patient_count
FROM staff s;


-- Day 17 Challenge Question:
--  Create a report showing each service with: service name, total patients admitted, the difference between their total admissions and the average admissions across all services, and a rank indicator ('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending.

SELECT service, total_admitted,
       ROUND(total_admitted - overall_avg, 2) AS diff_from_avg,
       CASE
           WHEN total_admitted > overall_avg THEN 'Above Average'
           WHEN total_admitted = overall_avg THEN 'Average'
           ELSE 'Below Average'
       END AS rank_indicator
FROM (
    SELECT service,
           SUM(patients_admitted) AS total_admitted,
           AVG(SUM(patients_admitted)) OVER() AS overall_avg
    FROM services_weekly
    GROUP BY service
) sub
ORDER BY total_admitted DESC;

