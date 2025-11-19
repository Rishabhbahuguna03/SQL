-- Practice questions:
-- Q.1. Show all staff members and their schedule information (including those with no schedule entries).

SELECT *
FROM staff
LEFT JOIN staff_schedule 
USING (service);

-- Q.2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).

SELECT service, staff_name
FROM services_weekly
LEFT JOIN staff
USING (service);

-- Q.3. Display all patients and their service's weekly statistics (if available).

SELECT 
    p.patient_id,
    p.name,
    p.age,
    p.service,
    sw.week,
    sw.patients_admitted,
    sw.patients_refused,
    sw.patient_satisfaction,
    sw.staff_morale,
    sw.event
FROM patients p
LEFT JOIN services_weekly sw
    ON p.service = sw.service
ORDER BY p.name, sw.week;


-- Day 14 Challenge Question:
--  Create a staff utilisation report showing all staff members (staff_id, staff_name, role, service) and the count of weeks they were present (from staff_schedule). Include staff members even if they have no schedule records. Order by weeks present descending.


SELECT s.*,
SUM(COALESCE(ss.present, 0)) AS weeks_present
FROM staff s
LEFT JOIN staff_schedule ss ON s.staff_id=ss.staff_id
GROUP BY s.staff_id
ORDER BY weeks_present DESC;

