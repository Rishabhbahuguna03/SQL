-- Practice questions:
-- Q.1. Combine patient names and staff names into a single list.

SELECT name
FROM patients
UNION
SELECT staff_name
FROM staff;


-- Q.2. Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).

SELECT name
FROM patients
WHERE satisfaction > 90
UNION
SELECT name
FROM patients
WHERE satisfaction < 50;

-- Q.3. List all unique names from both patients and staff tables.
-- Output is behaving in not that expected way.
(SELECT name
FROM patients
UNION
SELECT name
FROM patients)
UNION ALL
(SELECT staff_name
FROM staff
UNION
SELECT staff_name
FROM staff);

-- Day 18 Challenge Question:
--  Create a comprehensive personnel and patient list showing: identifier (patient_id or staff_id), full name, type ('Patient' or 'Staff'), and associated service. Include only those in 'surgery' or 'emergency' services. Order by type, then service, then name.

SELECT id,full_name,type,service
FROM(
SELECT patient_id AS ID,name as full_name,'Patient' AS type, service
FROM patients
WHERE service IN ('surgery','emergency')
UNION ALL
SELECT staff_id AS id, staff_name AS full_name,'Staff' AS type,service
FROM staff
WHERE service IN ('surgery','emergency')
) combined
ORDER BY type,service,full_name;

