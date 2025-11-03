# Hospital Database Overview

# Dataset Link[https://www.kaggle.com/datasets/jaderz/hospital-beds-management]

The **Hospital database** models a simplified healthcare system where patients, staff, and weekly hospital operations are tracked. It helps analyze service performance, patient flow, and staff management.

## 1. patients

Tracks basic patient information and service history.

**Key fields:**
- `patient_id`: Unique identifier  
- `name`, `age`: Demographic details  
- `arrival_date`, `departure_date`: Admission and discharge dates  
- `service`: Type of hospital service used  
- `satisfaction`: Patient satisfaction score  

## 2. services_weekly

Monitors weekly operational metrics for each hospital service.

**Key fields:**
- `week`, `month`: Time period  
- `service`: Type of service (e.g., cardiology, radiology)  
- `available_beds`, `patients_request`, `patients_admitted`, `patients_refused`: Capacity and utilization metrics  
- `patient_satisfaction`, `staff_morale`: Quality indicators  
- `event`: Any special event or note for that week  

## 3. staff

Contains information about hospital staff members.

**Key fields:**
- `staff_id`, `staff_name`: Staff identifiers  
- `role`: Job title or position  
- `service`: Service or department they belong to  

## 4. staff_schedule

Links staff members to their weekly work schedules.

**Key fields:**
- `staff_id`: Reference to staff table  
- `week`: Week number  
- `service`: Assigned department  
- `present`: Attendance indicator  
