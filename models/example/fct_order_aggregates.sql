{{ config(materialized='view') }}
WITH orders AS (
    SELECT * FROM {{ ref('stg_orders') }}
),
order_lines AS (
    SELECT * FROM {{ ref('fct_order_lines') }}
)

SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    COUNT(order_lines.product_name) AS item_count,
    SUM(order_lines.quantity * order_lines.unit_price) AS order_value
FROM orders o
JOIN order_lines ON o.order_id = order_lines.order_id
GROUP BY o.order_id, o.customer_id, o.order_date
