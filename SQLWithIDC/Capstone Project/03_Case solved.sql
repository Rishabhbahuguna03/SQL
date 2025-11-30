-- SQL Murder Mystery: Who killed the CEO?

-- Investigation steps:

-- Step 1. Identify where and when the crime happened?

SELECT room AS crime_scene, found_time AS time_discovered, description
FROM evidence
WHERE room = 'CEO Office';


-- Step 2. Analyse who accessed the critical areas at the time?

SELECT e.employee_id, e.name, kl.log_id, kl.room, kl.entry_time, kl.exit_time
FROM employees e 
JOIN keycard_logs kl ON e.employee_id = kl.employee_id
WHERE room = 'CEO Office' AND entry_time BETWEEN '2025-10-15 20:30:00' AND '2025-10-15 21:10:00';


-- Step 3. Cross-check alibis with actual logs.

SELECT a.*, kl.log_id, kl.room, kl.entry_time, kl.exit_time
FROM alibis a
LEFT JOIN keycard_logs kl
ON a.employee_id = kl.employee_id
AND a.claim_time BETWEEN kl.entry_time AND kl.exit_time
ORDER BY alibi_id;


-- Step 4. Investigate suspicious calls made around the time.

SELECT c.caller_id, e1.name AS caller_name, c.receiver_id, e2.name AS receiver_name, c.call_time, c.duration_sec
FROM employees e1
LEFT JOIN calls c
ON e1.employee_id = c.caller_id
LEFT JOIN employees e2
ON e2.employee_id = c.receiver_id
WHERE c.call_time BETWEEN '2025-10-15 20:50:00' AND '2025-10-15 21:00:00';


-- Step 5. Match evidence with movements and claims.

SELECT 
    e.*,
    kl.employee_id,
    e1.name,
    kl.log_id,
    kl.entry_time,
    kl.exit_time,
    a.claim_time,
    a.claimed_location
FROM evidence e
LEFT JOIN keycard_logs kl
    ON e.room = kl.room
LEFT JOIN employees e1
    ON kl.employee_id = e1.employee_id
LEFT JOIN alibis a
    ON kl.employee_id = a.employee_id
WHERE e.found_time BETWEEN kl.entry_time 
    AND (kl.exit_time + interval '15 minutes');


-- Step 6. Combine all findings to identify the killer.

-- Case solved

-- Findings from keylogs

WITH cte_key AS (
SELECT  
	e.employee_id,
    e.name,
    'keycard_logs' AS match_found_in
FROM employees e
LEFT JOIN keycard_logs kl
ON e.employee_id = kl.employee_id
WHERE kl.room = 'CEO Office'
),

-- Findings from calls

cte_calls AS (
SELECT 
	e.employee_id,
    e.name,
    'calls' AS match_found_in
FROM employees e 
LEFT JOIN calls c
ON e.employee_id = c.caller_id
WHERE c.call_time BETWEEN '2025-10-15 20:30:00' AND '2025-10-15 21:10:00'
),

-- Findings from alibis

cte_alibis AS (
SELECT 
	e.employee_id,
    e.name,
    'alibis' AS match_found_in
FROM employees e	
LEFT JOIN alibis a
ON e.employee_id = a.employee_id
LEFT JOIN keycard_logs kl
ON a.employee_id = kl.employee_id
WHERE a.claim_time BETWEEN '2025-10-15 20:30:00' AND '2025-10-15 21:10:00'
AND kl.room <> a.claimed_location
),

-- Findings from evidence

cte_evidence AS (
SELECT  
	e.employee_id,
    e.name,
    'evidence' AS match_found_in
FROM employees e
LEFT JOIN keycard_logs kl
ON e.employee_id = kl.employee_id
LEFT JOIN evidence ev
ON kl.room = ev.room
WHERE ev.found_time BETWEEN kl.entry_time AND (kl.exit_time + interval '15 minutes')
)

SELECT name AS killer FROM cte_key
UNION
SELECT name AS killer FROM cte_calls
UNION
SELECT name AS killer FROM cte_alibis
UNION
SELECT name AS killer FROM cte_evidence;