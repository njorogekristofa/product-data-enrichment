-- Analysis: Summary of active product categories and average prices

WITH enriched_products AS (
    SELECT * FROM {{ ref('enriched_products') }}
)

SELECT
    category,
    business_unit,
    COUNT(*) AS total_products,
    ROUND(AVG(price), 2) AS average_price
FROM enriched_products
WHERE is_active = TRUE
GROUP BY category, business_unit
ORDER BY total_products DESC;
