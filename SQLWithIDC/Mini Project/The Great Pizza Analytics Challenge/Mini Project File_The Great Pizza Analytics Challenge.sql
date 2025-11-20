-- Mini Project: The Great Pizza Analytics Challenge

-- Phase 01: Foundation and Inspection

-- Retrieving data from all the tables.

SELECT *
FROM pizza_types;

SELECT *
FROM orders;

SELECT *
FROM pizzas;

SELECT *
FROM order_details;

-- 1. List all unique pizza categories

SELECT DISTINCT category
FROM pizza_types;

-- 2. Display pizza_type_id, name, and ingredients, replacing NULL ingredients with "Missing Data". Show first 5 rows.

SELECT pizza_type_id, name, 
COALESCE(ingredients,'Missing Data') AS ingredients
FROM pizza_types
LIMIT 5;

-- 3. Check for pizzas missing a price.

SELECT price
FROM pizzas
WHERE price IS NULL;



-- Phase 02: Filtering and Exploration

-- 1. Orders placed on '2015-01-01'

SELECT order_id, date
FROM orders
WHERE date = '2015-01-01';


-- 2. List pizzas with price descending.

SELECT pizza_id, pizza_type_id, price
FROM pizzas
ORDER BY price DESC;


-- 3. Pizzas sold in sizes 'L' or 'XL'.

SELECT pizza_id, pizza_type_id, size
FROM pizzas
WHERE size IN ('L','XL');


-- 4. Pizzas priced between $15.00 and $17.00.

SELECT pizza_id, price
FROM pizzas
WHERE price BETWEEN 15.00 AND 17.00;


-- 5. Pizzas with "Chicken" in the name.

SELECT pizza_type_id, name
FROM pizza_types
WHERE name LIKE '%Chicken%'; 


-- 6. Orders on '2015-02-15' or placed after 8 PM.

SELECT order_id
FROM orders
WHERE date = '2015-02-15' OR time > '20:00:00';



-- Phase 03: Sales Performance

-- 1. Total quantity of pizzas sold.

SELECT SUM(quantity) AS total_pizzas_sold
FROM order_details;


-- 2. Average pizza price.

SELECT ROUND(AVG(price), 2) AS avg_price
FROM pizzas;


-- 3. Total order value per order.


SELECT 
