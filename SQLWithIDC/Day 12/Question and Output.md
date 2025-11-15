# Day 12 - SQL Challenge

## Challenge Question
Analyze the event impact by comparing weeks with events vs weeks without events.  
Show:  
- Event status (With Event / No Event)  
- Count of weeks  
- Average patient satisfaction  
- Average staff morale  
Order by average patient satisfaction in descending order.

## SQL Query
```sql
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

