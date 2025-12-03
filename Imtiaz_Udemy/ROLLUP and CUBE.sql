SELECT * FROM sales
ORDER BY continent, country, city;


SELECT continent, SUM(units_sold)
FROM sales
GROUP BY continent;

SELECT country, SUM(units_sold)
FROM sales
GROUP BY country;

SELECT city, SUM(units_sold)
FROM sales
GROUP BY city;


SELECT continent, country, city, SUM(units_sold)
FROM sales
GROUP BY GROUPING SETS(continent, country, city, ());

-- The first record is the grand total we receive and then, the breakdown continues.


-- Alternatively, we can solve this by using ROLLUP and removing () inside the query.

SELECT continent, country, city, SUM(units_sold)
FROM sales
GROUP BY ROLLUP(continent, country, city);


-- CUBE is another function which allows us flexibility in understanding combinations.

SELECT continent, country, city, SUM(units_sold)
FROM sales
GROUP BY CUBE(continent, country, city);