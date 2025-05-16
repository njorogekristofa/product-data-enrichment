{{ config(materialized='view') }}
WITH order_items AS (
    SELECT * FROM {{ ref('stg_order_items') }}
),
products AS (
    SELECT * FROM {{ ref('stg_products') }}
)

SELECT
    oi.order_id,
    oi.quantity,
    oi.unit_price,
    p.product_name,
    p.category
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
