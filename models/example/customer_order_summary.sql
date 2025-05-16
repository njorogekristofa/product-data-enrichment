{{ config(materialized='table') }}


WITH customers AS (
    SELECT * FROM {{ ref('stg_customers') }}
),
order_aggregates AS (
    SELECT * FROM {{ ref('fct_order_aggregates') }}
)

SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    COUNT(oa.order_id) AS total_orders,
    SUM(oa.item_count) AS total_items,
    SUM(oa.order_value) AS total_spent,
    MAX(oa.order_date) AS most_recent_order,
    ROUND(AVG(oa.order_value), 2) AS avg_order_value
FROM customers c
LEFT JOIN order_aggregates oa ON c.customer_id = oa.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.email
