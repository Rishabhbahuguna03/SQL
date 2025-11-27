-- Practice questions:
-- Q.1. Create a CTE to calculate service statistics, then query from it.

WITH service_stats AS (
    SELECT
        service,
        SUM(patients_admitted) AS total_admissions,
        ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
    FROM services_weekly
    GROUP BY service
)
SELECT *
FROM service_stats
ORDER BY total_admissions DESC;

-- Q.2. Use multiple CTEs to break down a complex query into logical steps.

WITH service_totals AS (
    SELECT
        service,
        SUM(patients_admitted) AS total_admissions
    FROM services_weekly
    GROUP BY service
),
overall_avg AS (
    SELECT ROUND(AVG(total_admissions)) AS avg_admissions
    FROM service_totals
)
SELECT
    st.service,
    st.total_admissions,
    oa.avg_admissions,
    ROUND(st.total_admissions - oa.avg_admissions) AS diff_from_avg
FROM service_totals st
CROSS JOIN overall_avg oa
ORDER BY st.total_admissions DESC;


-- Q.3. Build a CTE for staff utilization and join it with patient data.

WITH staff_util AS (
    SELECT
        staff_id,
        service,
        COUNT(week) AS weeks_present
    FROM staff_schedule
    GROUP BY staff_id, service
)
SELECT
    p.patient_id,
    p.name AS patient_name,
    p.service,
    su.staff_id,
    su.weeks_present
FROM patients p
LEFT JOIN staff_util su
    ON p.service = su.service
ORDER BY p.patient_id, su.staff_id;


-- Day 21 Challenge Question:
-- Create a comprehensive hospital performance dashboard using CTEs. Calculate: 1) Service-level metrics (total admissions, refusals, avg satisfaction), 2) Staff metrics per service (total staff, avg weeks present), 3) Patient demographics per service (avg age, count). Then combine all three CTEs to create a final report showing service name, all calculated metrics, and an overall performance score (weighted average of admission rate and satisfaction). Order by performance score descending.

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
