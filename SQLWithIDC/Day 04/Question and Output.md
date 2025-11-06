# SQL Challenge - Day 04

**Challenge Question:**  
Find the 3rd to 7th highest patient satisfaction scores from the patients table, showing patient_id, name, service, and satisfaction. Display only these 5 records.

**SQL Query:**
```sql
SELECT patient_id, name, service, satisfaction
FROM patients
ORDER BY satisfaction DESC
LIMIT 5
OFFSET 2;


| patient_id   | name           | service   | satisfaction |
| ------------ | -------------- | --------- | ------------ |
| PAT-581a47d8 | Paul Castaneda | emergency | 99           |
| PAT-84559395 | Jamie Smith    | surgery   | 99           |
| PAT-87783e44 | Devon Flores   | emergency | 99           |
| PAT-a2ce687a | Craig Morrison | surgery   | 99           |
| PAT-26a57bc7 | Jeffrey Mills  | surgery   | 99           |

