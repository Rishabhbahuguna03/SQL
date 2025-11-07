# Day 05 - SQL Challenge

## Challenge Question
Calculate the total number of patients admitted, total patients refused, and the average patient satisfaction across all services and weeks. Round the average satisfaction to 2 decimal places.

## SQL Query
```sql
SELECT
  SUM(COALESCE(patients_admitted,0)) AS total_patients_admitted,
  SUM(COALESCE(patients_refused,0)) AS total_patients_refused,
  ROUND(AVG(COALESCE(patient_satisfaction,0))::numeric, 2) AS avg_satisfaction
FROM services_weekly;
```

## Output
| total_patients_admitted | total_patients_refused | avg_satisfaction |
|--------------------------|------------------------|------------------|
| 5851                     | 7642                   | 80.00            |
