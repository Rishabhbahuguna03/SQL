## SQL Challenge - Day 21

## Challenge Question

Create a hospital performance dashboard using CTEs. Calculate:

1. Service-level metrics

- total admissions

- total refusals

- average satisfaction

2. Staff metrics per service

- total staff

- average weeks present

3. Patient demographics per service

- average age

- patient count

Then combine all three CTEs into a final report showing:

- service name

- all calculated metrics

- performance score (weighted average of admission rate and satisfaction)

Order the final result by performance score descending.

## SQL Solution
```
-- Hospital Performance Dashboard

-- 1) Service-level metrics
WITH service_metrics AS (
    SELECT
        service,
        SUM(patients_admitted) AS total_admissions,
        SUM(patients_refused) AS total_refusals,
        ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
    FROM services_weekly
    GROUP BY service
),

-- 2) Staff metrics per service
staff_metrics AS (
    SELECT
        s.service,
        COUNT(DISTINCT s.staff_id) AS total_staff,
        ROUND(AVG(ss.present), 2) AS avg_weeks_present
    FROM staff s
    LEFT JOIN staff_schedule ss
        ON s.staff_id = ss.staff_id
    GROUP BY s.service
),

-- 3) Patient demographics per service
patient_metrics AS (
    SELECT
        service,
        COUNT(*) AS patient_count,
        ROUND(AVG(age), 2) AS avg_age
    FROM patients
    GROUP BY service
),

-- 4) Combine everything and calculate performance score
final_report AS (
    SELECT
        sm.service,
        sm.total_admissions,
        sm.total_refusals,
        sm.avg_satisfaction,
        stm.total_staff,
        stm.avg_weeks_present,
        pm.patient_count,
        pm.avg_age,

        -- Performance Score:
        -- Mix satisfaction and size of service
        ROUND(
            (
                (sm.total_admissions::numeric /
                    NULLIF((SELECT MAX(total_admissions) FROM service_metrics), 0)
                ) * 50
                +
                (sm.avg_satisfaction * 0.5)
            ), 2
        ) AS performance_score
    FROM service_metrics sm
    LEFT JOIN staff_metrics stm ON sm.service = stm.service
    LEFT JOIN patient_metrics pm ON sm.service = pm.service
)

SELECT *
FROM final_report
ORDER BY performance_score DESC;
```
## Output

| service          | total_admissions | total_refusals | avg_satisfaction | total_staff | avg_weeks_present | patient_count | avg_age | performance_score |
| ---------------- | ---------------- | -------------- | ---------------- | ----------- | ----------------- | ------------- | ------- | ----------------- |
| general_medicine | 2332             | 1938           | 81.23            | 27          | 0.59              | 242           | 46.19   | 90.62             |
| surgery          | 1686             | 555            | 79.27            | 22          | 0.61              | 254           | 45.59   | 75.78             |
| emergency        | 1185             | 5008           | 77.88            | 29          | 0.60              | 263           | 45.33   | 64.35             |
| ICU              | 648              | 141            | 81.62            | 48          | 0.60              | 241           | 44.22   | 54.70             |
