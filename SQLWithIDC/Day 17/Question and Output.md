# SQL Challenge – Day 17

## Challenge Question  
Create a report showing each service with: service name, total patients admitted, the difference between their total admissions and the average admissions across all services, and a rank indicator ('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending.

---

## SQL Query

```sql
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
FROM service_totals st
CROSS JOIN overall_avg oa
ORDER BY st.total_admissions DESC;
```
## Output

| service          | total_admitted | diff_from_avg | rank_indicator |
| ---------------- | -------------- | ------------- | -------------- |
| general_medicine | 2332           | 869.25        | Above Average  |
| surgery          | 1686           | 223.25        | Above Average  |
| emergency        | 1185           | -277.75       | Below Average  |
| ICU              | 648            | -814.75       | Below Average  |

