# SQL Challenge - Day 12

## Challenge Question
Analyze the event impact by comparing weeks with events vs weeks without events. Show: event status ('With Event' or 'No Event'), count of weeks, average patient satisfaction, and average staff morale. Order by average patient satisfaction descending.

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
```

## Output
| event_status | week_count | avg_patient_satisfaction | avg_staff_morale |
| ------------ | ---------- | ------------------------ | ---------------- |
| With Event   | 31         | 81.02                    | 70.41            |
| No Event     | 52         | 79.73                    | 73.15            |

