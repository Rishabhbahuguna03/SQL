-- Practice questions:
-- Q.1. Find all weeks in services_weekly where no special event occurred.

SELECT COALESCE(week,0)
FROM services_weekly;

-- Q.2. Find all unique staff roles in the hospital.

SELECT DISTINCT(role)
FROM staff;

-- Q.3. Get distinct months from the services_weekly table.

SELECT DISTINCT month
FROM services_weekly;

-- Day 12 Challenge Question:
-- Analyze the event impact by comparing weeks with events vs weeks without events. Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, and average staff morale. Order by average patient satisfaction descending.

SELECT
  CASE 
    WHEN event IN ('strike', 'donation', 'flu') THEN 'With Event'
    ELSE 'No Event'
  END AS event_status,
  COUNT(DISTINCT week) AS week_count,
  ROUND(AVG(patient_satisfaction), 2) AS avg_patient_satisfaction,
  ROUND(AVG(staff_morale), 2) AS avg_staff_morale
FROM services_weekly
GROUP BY event_status
ORDER BY avg_patient_satisfaction DESC;

