# SQL Challenge - Day 20

## Challenge Question  
Create a trend analysis showing for each service and week: week number, patients_admitted, running total of patients admitted (cumulative), 3-week moving average of patient satisfaction (current week and 2 prior weeks), and the difference between current week admissions and the service average. Filter for weeks 10-20 only.


## SQL Query

```sql
WITH service_analysis AS (
    SELECT
        week,
        service,
        patients_admitted,
        SUM(patients_admitted) OVER (
            PARTITION BY service
            ORDER BY week
        ) AS cumulative_admissions,
        ROUND(
            AVG(patient_satisfaction) OVER (
                PARTITION BY service
                ORDER BY week
                ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
            ),
            2
        ) AS moving_avg_satisfaction,
        ROUND(
            AVG(patients_admitted) OVER (PARTITION BY service),
            2
        ) AS service_avg_admissions
    FROM services_weekly
    WHERE week BETWEEN 10 AND 20
)

SELECT
    week,
    service,
    patients_admitted,
    cumulative_admissions,
    moving_avg_satisfaction,
    patients_admitted - service_avg_admissions AS diff_from_avg
FROM service_analysis;
```
## Output



