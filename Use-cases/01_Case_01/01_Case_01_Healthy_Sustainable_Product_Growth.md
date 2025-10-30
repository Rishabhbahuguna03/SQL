# Case 01: Healthy & Sustainable Product Growth

## Context
**NutriLife India**, a mid-sized FMCG company, has recently started tagging its product catalog with two new attributes: **health positioning (low-fat)** and **packaging sustainability (recyclable)**, to align with India’s growing segment of health and eco-conscious consumers.

The management wants to understand how many of its current **products** meet both attributes to establish a clear view of its Healthy & Sustainable portfolio. This will help the team decide where to focus future product development, marketing, and regional expansion efforts.

---

## Problem Statement
**NutriLife** aims to identify which of its products are **both low-fat and recyclable**, establishing the baseline for its Healthy & Sustainable product range and guiding decisions on portfolio growth and category focus.

---

## SQL Query
```sql
SELECT product_id, name, category
FROM products
WHERE low_fats = 'Y' AND recyclable = 'Y';
```

---

## Output

| product_id | name                    | category   |
|-------------|------------------------|-------------|
| 1 | Multigrain Roti Mix | Flour Mix |
| 4 | Protein Makhana | Snacks |
| 6 | Oats & Jaggery Cookies | Bakery |
| 8 | Millet Energy Bar | Snacks |
| 11 | Light Paneer (200g) | Dairy |
| 13 | Baked Bhujia | Snacks |
| 15 | Organic Poha | Breakfast |

---

## Business Interpretation

### **Insight**
**NutriLife** currently offers **seven products** that are **both low-fat and recyclable**, forming the foundation of its Healthy & Sustainable product line.

### **Evidence**
These products span **four daily-use categories**: flour mixes, snacks, bakery, and dairy. Most are positioned for **urban and tier-2 consumers**, where **awareness** of health and eco-friendly packaging is **growing**.

### **Reasoning**
NutriLife’s Healthy & Sustainable products are concentrated in everyday food categories such as snacks, breakfast items, and dairy. This suggests the company has focused its health and sustainability efforts on staple products that drive frequent household consumption.

### **Implication**
NutriLife should expand these health and sustainability attributes into other commonly consumed categories, like beverages or meal mixes. This can help the company reach a wider consumer base and strengthen its brand positioning in the growing health-conscious segment.

---

