**Title**: The Great Pizza Analytics Challenge

**Author**: Rishabh Bahuguna

**Role**: Data Analyst, IDC Pizza

**Date**: November 20, 2025

## Project Summary:

This project analyzes pizza sales data to identify high-performing categories, underperforming items, and revenue opportunities, providing actionable insights for menu strategy and marketing initiatives.


## Project Overview

This project explores and analyzes raw pizza sales data and transforms it into actionable insights from the `IDC_Pizza database` using `SQL`.

The goal is to understand customer ordering behavior, identify high-performing pizza categories, and evaluate overall business performance through structured `SQL` queries.

The database contains 4 key tables:
- `orders` – order metadata (date, time)
- `order_details` – pizzas and quantities ordered
- `pizzas` – pizza sizes and prices
- `pizza_types` – pizza names, categories, ingredients

You can view the Entity-Relationship Diagram (ERD) for the dataset [here](https://github.com/Rishabhbahuguna03/SQL/blob/main/SQLWithIDC/Mini%20Project/The%20Great%20Pizza%20Analytics%20Challenge/ERD%20for%20The%20Great%20Pizza%20Analytics%20Challenge.png).

This project covers from initial data exploration to detailed sales insights.

- Phase 1: Data Exploration & Cleaning

  - Identify unique pizza categories

  - Check for missing ingredients

  - Validate missing pizza prices

  - Inspect daily orders

- Phase 2: Filtering & Exploration

  - Orders by date/time

  - High-priced pizzas

  - Pizza sizes (L, XL) performance

  - Mid-price range pizzas

  - Chicken-based pizzas

- Phase 3: Sales Insights

  - Total pizzas sold

  - Average pizza price

  - Revenue per order

  - Category-wise quantity sold

  - Identify pizzas never ordered

  - Price variation by pizza size

## Key Insights:

**1. Total Sales Performance**

- **Total pizzas sold**: 49,574 units
- **Average pizza price**: 16.44 USD
- The **overall sales volume** indicates **strong customer demand**, while the **average price** provides a benchmark for **revenue projections**.

**2. Category Performance**

- **Highest-selling categories**: Classic, Supreme, Veggie, Chicken
- Some categories **exceeded 5,000 units sold**, indicating **core menu strengths** and the categories **driving most of the revenue**.
- This **insight** can guide **inventory planning, marketing focus, and promotional strategies**.

**3. High-Value Orders**

- Orders with **larger quantities or premium pizzas** generate **significantly higher revenue**.
- **Analysis** of **total order values** highlights opportunities to **promote bundles or upsell larger sizes** to increase average order value.

**4. Underperforming Pizzas**

- A **small subset** of pizzas was **never ordered**, suggesting:
  - Potential candidates for **menu removal** to **reduce inventory costs**.
  - Or the need for **targeted promotion or repositioning** to **boost sales**.

**5. Size-Based Pricing Patterns**

- **Price differences** between sizes (S → M → L → XL) show a **consistent incremental increase**.
- Analysis confirms that **larger** sizes command **higher** prices, supporting **pricing strategies for upselling**.

**6. Insights for Strategic Action**

- Focus **marketing campaigns** on **high-selling categories**.
- Review **underperforming** pizzas for **possible removal or promotional efforts**.
- Leverage **size-based pricing insights** to design **bundles** or suggest **larger sizes** to customers.
- Track **high-value orders** for **customer loyalty programs and repeat purchase incentives**.

---
- Technologies Used: PostgreSQL 17 | pgAdmin 4 v9.6

- SQL Functions used: 

- SELECT Statement: for retrieving data  
- DISTINCT Command: for selecting unique values  
- COALESCE Function: for handling null values  
- IS NULL Function: for identifying missing prices  
- WHERE Clause: for filtering data  
- ORDER BY Clause: for sorting results  
- BETWEEN Operator: for selecting a range of values  
- LIKE Clause: for pattern matching  
- SUM and AVG: aggregate functions for calculating totals and averages   
- GROUP BY Function: for grouping similar values  
- HAVING Clause: for filtering groups based on conditions  
- INNER JOIN Operation: combines tables, including only matching rows  
- LEFT JOIN Operation: combines tables, keeping all rows from the left table even if no match exists
