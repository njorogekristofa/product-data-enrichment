
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/
{{ config(materialized='table') }}
WITH order_details AS (
    SELECT 
        c.first_name,
        o.order_date,
        p.name AS product_name,
        oi.quantity,
        oi.unit_price
    FROM l3_consumption.order_items oi
    JOIN l3_consumption.orders o ON oi.order_id = o.order_id
    JOIN l3_consumption.customers c ON o.customer_id = c.customer_id
    JOIN l3_consumption.products p ON oi.product_id = p.product_id
)

SELECT * FROM order_details
