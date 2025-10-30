-- Here is our products table

CREATE TABLE Products (
  product_id     SERIAL PRIMARY KEY,
  name           VARCHAR(100),
  category       VARCHAR(50),
  low_fats       CHAR(1) CHECK (low_fats IN ('Y','N')),
  recyclable     CHAR(1) CHECK (recyclable IN ('Y','N')),
  unit_price     NUMERIC(8,2),
  cost           NUMERIC(8,2)
);

-- customers table

CREATE TABLE Customers (
  customer_id    SERIAL PRIMARY KEY,
  signup_date    DATE,
  region         VARCHAR(50)
);

-- sales table

CREATE TABLE Sales (
  sale_id        SERIAL PRIMARY KEY,
  sale_date      DATE,
  customer_id    INT REFERENCES Customers(customer_id),
  product_id     INT REFERENCES Products(product_id),
  quantity       INT,
  sale_price     NUMERIC(8,2)
);

-- reviews table

CREATE TABLE Reviews (
  review_id      SERIAL PRIMARY KEY,
  customer_id    INT REFERENCES Customers(customer_id),
  product_id     INT REFERENCES Products(product_id),
  rating         INT CHECK (rating BETWEEN 1 AND 5),
  comment        TEXT,
  review_date    DATE
);


-- Let's insert data into products table:

INSERT INTO Products (product_id, name, category, low_fats, recyclable, unit_price, cost) VALUES
(1,  'Multigrain Roti Mix',      'Flour Mix', 'Y','Y', 120.00, 65.00),
(2,  'Masala Oats',              'Breakfast', 'Y','N', 160.00, 90.00),
(3,  'Ragi Chips',               'Snacks',    'N','Y', 45.00, 25.00),
(4,  'Protein Makhana',          'Snacks',    'Y','Y', 110.00, 60.00),
(5,  'Classic Namkeen',          'Snacks',    'N','N', 40.00, 20.00),
(6,  'Oats & Jaggery Cookies',   'Bakery',    'Y','Y', 90.00, 45.00),
(7,  'Coconut Water (500ml)',    'Beverages', 'Y','N', 45.00, 25.00),
(8,  'Millet Energy Bar',        'Snacks',    'Y','Y', 35.00, 18.00),
(9,  'Low-Fat Dahi (200g)',      'Dairy',     'Y','N', 35.00, 18.00),
(10, 'Eco Refill Atta Pack',     'Flour Mix', 'N','Y', 60.00, 35.00),
(11, 'Light Paneer (200g)',      'Dairy',     'Y','Y', 85.00, 50.00),
(12, 'Choco Energy Bites',       'Snacks',    'N','N', 50.00, 28.00),
(13, 'Baked Bhujia',             'Snacks',    'Y','Y', 55.00, 30.00),
(14, 'Low-Cal Ketchup',          'Condiments','Y','N', 65.00, 35.00),
(15, 'Organic Poha',             'Breakfast', 'Y','Y', 90.00, 45.00);


-- Let's insert data into customers table

INSERT INTO Customers (customer_id, signup_date, region) VALUES
(201, '2024-01-15', 'North'),
(202, '2024-02-10', 'West'),
(203, '2024-03-12', 'South'),
(204, '2024-04-25', 'East'),
(205, '2024-05-10', 'North'),
(206, '2024-05-28', 'South'),
(207, '2024-06-18', 'West'),
(208, '2024-07-05', 'East'),
(209, '2024-08-14', 'North'),
(210, '2024-09-02', 'South');


-- Let's insert data into sales table

INSERT INTO Sales (sale_id, sale_date, customer_id, product_id, quantity, sale_price) VALUES
(3001,'2025-01-05',201,1,1,120.00),
(3002,'2025-01-10',202,4,2,110.00),
(3003,'2025-01-14',203,13,3,55.00),
(3004,'2025-01-18',204,3,2,45.00),
(3005,'2025-01-20',205,6,1,90.00),
(3006,'2025-01-25',206,8,2,35.00),
(3007,'2025-02-02',207,11,1,85.00),
(3008,'2025-02-10',208,2,2,160.00),
(3009,'2025-02-15',209,1,1,120.00),
(3010,'2025-02-18',210,15,2,90.00),
(3011,'2025-03-01',201,13,1,55.00),
(3012,'2025-03-05',202,4,1,110.00),
(3013,'2025-03-12',203,6,1,90.00),
(3014,'2025-03-20',204,1,2,120.00),
(3015,'2025-03-25',205,11,1,85.00),
(3016,'2025-04-01',206,15,2,90.00),
(3017,'2025-04-05',207,13,1,55.00),
(3018,'2025-04-10',208,4,2,110.00),
(3019,'2025-04-15',209,8,3,35.00),
(3020,'2025-04-20',210,6,1,90.00),
(3021,'2025-04-25',201,11,2,85.00),
(3022,'2025-05-01',202,15,2,90.00),
(3023,'2025-05-05',203,1,1,120.00),
(3024,'2025-05-10',204,13,2,55.00),
(3025,'2025-05-12',205,8,2,35.00),
(3026,'2025-05-15',206,6,1,90.00),
(3027,'2025-05-20',207,4,2,110.00),
(3028,'2025-05-25',208,15,2,90.00),
(3029,'2025-06-01',209,11,1,85.00),
(3030,'2025-06-05',210,13,1,55.00);


-- Let's insert data into reviews table

INSERT INTO Reviews (review_id, customer_id, product_id, rating, comment, review_date) VALUES
(1,201,1,5,'Soft texture and good taste','2025-01-06'),
(2,202,4,4,'Crispy, healthy and filling','2025-01-11'),
(3,203,13,3,'Decent, needs more spice','2025-01-15'),
(4,204,3,4,'Tasty and light','2025-01-19'),
(5,205,6,5,'Perfect for evening tea','2025-02-01'),
(6,206,11,4,'Fresh and soft','2025-02-05'),
(7,207,15,5,'Healthy start to mornings','2025-02-10'),
(8,208,8,4,'Good travel snack','2025-02-18'),
(9,209,1,5,'Easy to cook and light','2025-03-01'),
(10,210,13,4,'Good baked option','2025-03-10');
