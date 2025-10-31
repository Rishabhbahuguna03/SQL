# Case 01: Healthy & Sustainable Product Growth

## Context
**NutriLife India**, a mid-sized FMCG company, recently began tagging its products with two attributes: low-fat and recyclable to align with India’s growing base of health and eco-conscious consumers.

## Problem Statement
The management aims to identify products that are both low-fat and recyclable to establish the baseline of its Healthy & Sustainable product range.

## SQL Query
```sql
SELECT product_id, name, category
FROM products
WHERE low_fats = 'Y' AND recyclable = 'Y';
```

## Output
| product_id | name | category |
|-------------|------|-----------|
| 1 | Multigrain Roti Mix | Flour Mix |
| 4 | Protein Makhana | Snacks |
| 6 | Oats & Jaggery Cookies | Bakery |
| 8 | Millet Energy Bar | Snacks |
| 11 | Light Paneer (200g) | Dairy |
| 13 | Baked Bhujia | Snacks |
| 15 | Organic Poha | Breakfast |

## Business Interpretation
- **NutriLife** currently offers **seven products** that are both low-fat and recyclable, primarily in daily-use categories such as snacks, bakery, and dairy.
- This shows that the company’s early efforts toward healthy and sustainable offerings are centered on staple food items.
- Expanding these attributes into beverages or meal mixes could help reach a wider health-conscious audience.
