{{ config(materialized='view') }}
SELECT
    product_id,
    name AS product_name,
    category,
    price
FROM {{ source('L3_CONSUMPTION', 'PRODUCTS') }}
