-- learner table

CREATE TABLE Learners (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    referred_by INT,
    signup_date DATE,
    city VARCHAR(50)
);


-- Here is the data to be inserted in the learner table

INSERT INTO Learners (id, name, referred_by, signup_date, city) VALUES
(1, 'Abhishek', NULL, '2025-03-01', 'Jaipur'),
(2, 'Jaya', NULL, '2025-03-02', 'Indore'),
(3, 'Karan', 2, '2025-03-05', 'Dehradun'),
(4, 'Isha', NULL, '2025-03-08', 'Coimbatore'),
(5, 'Rohan', 1, '2025-03-10', 'Nagpur'),
(6, 'Sameer', 2, '2025-03-11', 'Ajmer'),
(7, 'Kabir', 3, '2025-03-15', 'Patiala'),
(8, 'Yash', 2, '2025-03-17', 'Bhubaneswar'),
(9, 'Kirti', 5, '2025-03-20', 'Madurai'),
(10, 'Suresh', NULL, '2025-03-21', 'Surat');
