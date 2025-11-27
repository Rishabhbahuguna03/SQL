-- Practice questions:
-- Q.1. Calculate running total of patients admitted by week for each service.

SELECT 
    week,
	service,
	patients_admitted, 
	SUM(patients_admitted) OVER (PARTITION BY service ORDER BY week) AS running_total
FROM services_weekly
GROUP BY week, service, patients_admitted;


-- Q.2. Find the moving average of patient satisfaction over 4-week periods.

SELECT 
    week,
	service,
	patient_satisfaction,
	ROUND(AVG(patient_satisfaction)
	OVER (PARTITION BY service ORDER BY week ROWS BETWEEN 3 PRECEDING AND CURRENT ROW),2) AS moving_average
FROM services_weekly
GROUP BY week,service, patient_satisfaction;

-- Q.3. Show cumulative patient refusals by week across all services.

SELECT
    week,
	service,
	patients_refused, 
    SUM(patients_refused) OVER (PARTITION BY service ORDER BY week) AS cumulative
FROM services_weekly
GROUP BY week,service, patients_refused; 


-- Day 20 Challenge Question:
--  Create a trend analysis showing for each service and week: week number, patients_admitted, running total of patients admitted (cumulative), 3-week moving average of patient satisfaction (current week and 2 prior weeks), and the difference between current week admissions and the service average. Filter for weeks 10-20 only.

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