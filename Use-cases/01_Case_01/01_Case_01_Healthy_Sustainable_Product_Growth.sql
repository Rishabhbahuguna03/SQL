-- Case 01: Building Growth in Healthy & Sustainable Product Lines (India)

-- Context:

-- NutriLife India, a mid-sized FMCG company, has recently started tagging its product catalog with two new attributes — health positioning (low-fat) and packaging sustainability (recyclable) — to align with India’s growing segment of health- and eco-conscious consumers.
-- The management wants to understand how many of its current products meet both attributes to establish a clear view of its Healthy & Sustainable portfolio. This will help the team decide where to focus future product development, marketing, and regional expansion efforts.

-- Note:
-- Low-fat and recyclable products are those formulated with reduced fat content and packaged using materials compliant with India’s recyclable packaging standards under the Plastic Waste Management Rules (EPR framework).

-- Problem Statement:

-- NutriLife seeks to identify which of its products are both low-fat and recyclable to establish the baseline of its Healthy & Sustainable product range and guide decisions on portfolio growth and category focus.

-- Query:

SELECT product_id, name, category
FROM products
WHERE low_fats = 'Y' AND recyclable = 'Y';

-- Business Interpretation

-- Insight:
-- NutriLife currently offers seven products that are both low-fat and recyclable — forming the foundation of its Healthy & Sustainable product line.

-- Evidence:
-- These products span four daily-use categories: flour mixes, snacks, bakery, and dairy. Most are positioned for urban and tier-2 consumers where awareness of health and eco-friendly packaging is growing.

-- Reasoning:
-- This shows that NutriLife has made progress in categories with frequent consumption and easier adoption. However, the lack of products in beverages or ready-meal categories limits visibility and repeat engagement opportunities.

-- Implication:
-- NutriLife should build on this foundation by extending the Healthy & Sustainable range into beverages and ready-to-eat products, and by expanding regional availability in North and East India to capture untapped demand.