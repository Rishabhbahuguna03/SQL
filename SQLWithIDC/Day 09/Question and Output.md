# SQL Challenge - Day 09

## Challenge Question
Calculate the average length of stay (in days) for each service, showing only services where the average stay is more than 7 days. Also show the count of patients and order by average stay descending.

## SQL Query
```sql
SELECT 
    service,
    ROUND(AVG(departure_date - arrival_date), 2) AS avg_stay,
    COUNT(*) AS patient_count
FROM patients
GROUP BY service
HAVING AVG(departure_date - arrival_date) > 7
ORDER BY avg_stay DESC;
```
## Output
| service   | avg_stay | patient_count |
| -------   | -------- | ------------- |
| surgery   | 7.87     | 132           |
| ICU       | 7.61     | 85            |
| emergency | 7.16     | 263           |
