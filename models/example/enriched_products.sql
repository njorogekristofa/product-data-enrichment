{{ config(materialized='table') }}
WITH products AS (
    SELECT * FROM {{ ref('stg_products') }}
),
category_lookup AS (
    SELECT * FROM {{ ref('product_categories') }}
)

SELECT
    p.product_id,
    p.product_name,
    p.category,
    cl.business_unit,
    cl.category_description
FROM products p
LEFT JOIN category_lookup cl
    ON p.category = cl.category
