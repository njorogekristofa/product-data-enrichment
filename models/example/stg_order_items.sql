{{ config(materialized='view') }}
SELECT
    order_item_id,
    order_id,
    product_id,
    quantity,
    unit_price
FROM {{ source('L3_CONSUMPTION', 'ORDER_ITEMS') }}
