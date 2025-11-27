# SQL Challenge - Day 19

## Challenge Question  
For each service, rank the weeks by patient satisfaction score (highest first).  
Show service, week, patient_satisfaction, patients_admitted, and the rank.  
Include only the top 3 weeks per service.


## SQL Query

```sql
SELECT * 
FROM (
    SELECT 
        service,
        week,
        patient_satisfaction,
        patients_admitted,
        ROW_NUMBER() OVER(
            PARTITION BY service 
            ORDER BY patient_satisfaction DESC
        ) AS rank
    FROM services_weekly
) AS s
WHERE rank <= 3;
```
## Output

| service          | week | patient_satisfaction | patients_admitted | rank |
| ---------------- | ---- | -------------------- | ----------------- | ---- |
| emergency        | 48   | 99                   | 20                | 1    |
| emergency        | 19   | 99                   | 16                | 2    |
| emergency        | 11   | 98                   | 16                | 3    |
| general_medicine | 45   | 99                   | 40                | 1    |
| general_medicine | 1    | 97                   | 37                | 2    |
| general_medicine | 47   | 97                   | 55                | 3    |
| ICU              | 16   | 98                   | 15                | 1    |
| ICU              | 26   | 98                   | 8                 | 2    |
| ICU              | 48   | 98                   | 16                | 3    |
| surgery          | 47   | 99                   | 48                | 1    |
| surgery          | 20   | 99                   | 31                | 2    |
| surgery          | 36   | 97                   | 47                | 3    |

