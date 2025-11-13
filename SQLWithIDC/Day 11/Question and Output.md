# SQL Challenge - Day 11

## Challenge Question
Find all unique combinations of service and event type from the `services_weekly` table where events are not null or 'None', along with the count of occurrences for each combination. Order by count descending.

## SQL Query
```sql
SELECT 
    service,
    event,
    COUNT(*) AS event_count
FROM services_weekly
WHERE event IS NOT NULL
  AND event != 'none'
GROUP BY service, event
ORDER BY event_count DESC;
```
## Output
| service          | event      | event_count |
|------------------|-------------|--------------|
| general_medicine | flu         | 6            |
| ICU              | flu         | 5            |
| surgery          | donation    | 5            |
| emergency        | flu         | 5            |
| surgery          | strike      | 4            |
| emergency        | strike      | 4            |
| emergency        | donation    | 4            |
| general_medicine | donation    | 3            |
| general_medicine | strike      | 3            |
| surgery          | flu         | 3            |
| ICU              | donation    | 2            |

