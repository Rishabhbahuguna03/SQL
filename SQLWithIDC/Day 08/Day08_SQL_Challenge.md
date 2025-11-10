# Day 08 - SQL Challenge

## Challenge Question
Create a patient summary that shows patient_id, full name in uppercase, service in lowercase, age category (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), and name length. Only show patients whose name length is greater than 10 characters.

## SQL Query
```sql
SELECT 
    patient_id,
    UPPER(name) AS full_name,
    LOWER(service) AS service_name,
    CASE 
        WHEN age >= 65 THEN 'Senior'
        WHEN age >= 18 THEN 'Adult'
        ELSE 'Minor'
    END AS age_category,
    LENGTH(name) AS name_length
FROM patients
WHERE LENGTH(name) > 10;
```

## Output (Sample)
| patient_id  | full_name           | service_name     | age_category | name_length |
|--------------|--------------------|------------------|---------------|--------------|
| PAT-09484753 | RICHARD RODRIGUEZ  | surgery          | Adult         | 17           |
| PAT-d977b532 | YVONNE CHAMBERS    | surgery          | Adult         | 14           |
| PAT-b129e285 | MR. JEFFREY HORTON | general_medicine | Senior        | 17           |
| PAT-87783e44 | DEVON FLORES       | emergency        | Adult         | 12           |
| PAT-12de1869 | CARLA JONES        | surgery          | Adult         | 11           |

---

### Reflection
This challenge explores **string manipulation and conditional logic** in SQL.  
By combining `UPPER()`, `LOWER()`, `CASE`, and `LENGTH()`, we can create readable, categorized views that make reporting data more human-friendly and standardized.
