-- Practice questions:
-- Q.1. Join patients and staff based on their common service field (show patient and staff who work in same service).

SELECT name, staff_name
FROM patients p
JOIN staff s
USING (service);

-- Q.2. Join services_weekly with staff to show weekly service data with staff information.

SELECT 
    sw.week,
    sw.service,
    sw.patients_admitted,
    s.staff_name,
    s.role
FROM services_weekly sw
JOIN staff s
USING (service);


-- Q.3. Create a report showing patient information along with staff assigned to their service.

SELECT 
    p.name AS patient_name,
    p.age,
    p.arrival_date,
    p.departure_date,
    p.service,
    p.satisfaction,
    s.staff_name,
    s.role
FROM patients p
INNER JOIN staff s
USING (service);


-- Day 13 Challenge Question:
-- Create a comprehensive report showing patient_id, patient name, age, service, and the total number of staff members available in their service. Only include patients from services that have more than 5 staff members. Order by number of staff descending, then by patient name.

SELECT 
    p.patient_id,
    p.name,
    p.age,
    p.service,
    COUNT(s.staff_id) AS staff_count
FROM patients p
JOIN staff s 
    USING(service)
GROUP BY p.patient_id, p.name, p.age, p.service
HAVING COUNT(s.staff_id) > 5
ORDER BY staff_count DESC, p.name;


