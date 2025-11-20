# SQL Challenge - Day 15

## Challenge Question
Create a comprehensive service analysis report for week 20 showing: service name, total patients admitted that week, total patients refused, average patient satisfaction, count of staff assigned to service, and count of staff present that week.
Order by patients admitted descending.

## SQL Query

```sql
SELECT 
    sw.service,
    SUM(sw.patients_admitted) AS total_admitted,
    SUM(sw.patients_refused) AS total_refused,
    ROUND(AVG(sw.patient_satisfaction),2) AS avg_satisfaction,
    COUNT(DISTINCT ss.staff_id) AS staff_cnt,
    COUNT(DISTINCT CASE 
                        WHEN ss.present = 1 THEN ss.staff_id END) AS staff_present_week20
FROM services_weekly sw
LEFT JOIN staff_schedule ss ON ss.service = sw.service AND ss.week = 20
WHERE sw.week = 20
GROUP BY sw.service
ORDER BY total_admitted DESC;
```

## Output

| service          | total_admitted | total_refused | avg_satisfaction | staff_cnt | staff_present_week20 |
|------------------|----------------|----------------|------------------|-----------|------------------------|
| general_medicine | 1120           | 840            | 64.00            | 28        | 24                     |
| emergency        | 819            | 936            | 93.00            | 39        | 37                     |
| surgery          | 775            | 200            | 99.00            | 25        | 23                     |
| ICU              | 340            | 136            | 85.00            | 34        | 31                     |


