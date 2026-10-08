CREATE OR REPLACE TABLE quality_checks(
    check_name VARCHAR,
    issues BIGINT
);

-- 1. Missing required sales values.
INSERT INTO quality_checks
SELECT 'invalid_sales_fields',COUNT(*)
FROM stg_sales
WHERE order_id IS NULL
    OR line_number IS NULL
    OR order_date IS NULL
    OR product_id IS NULL
    OR store_id IS NULL
    OR quantity IS NULL
    OR unit_price IS NULL
    OR net_price IS NULL
    OR unit_cost IS NULL
    OR currency_code IS NULL
    OR currency_code = '';

-- 2. Repeated order + line combinations.
INSERT INTO quality_checks
SELECT 'duplicate_sales_lines', COUNT(*)
FROM (
    SELECT order_id, line_number
    FROM stg_sales
    GROUP BY order_id, line_number
    HAVING COUNT(*) > 1
) AS duplicates;

-- 3. Missing required product values.
INSERT INTO quality_checks
SELECT 'invalid_product', COUNT(*)
FROM stg_product
WHERE product_id IS NULL
    OR product_name IS NULL OR product_name = ''
    OR category IS NULL OR category = ''
    OR subcategory IS NULL OR subcategory = '';

-- 4. Repeated product keys.
INSERT INTO quality_checks
SELECT 'duplicate_product_keys', COUNT(*)
FROM (
    SELECT product_id
    FROM stg_product
    GROUP BY product_id
    HAVING COUNT(*) > 1
) AS duplicates;

-- 5. Missing required store values.
INSERT INTO quality_checks
SELECT 'invalid_stores', COUNT(*)
FROM stg_store
WHERE store_id IS NULL
    OR store_name IS NULL OR store_name = ''
    OR country IS NULL OR country = '';

-- 6. Repeated store keys.
INSERT INTO quality_checks
SELECT 'duplicate_store_keys', COUNT(*)
FROM (
    SELECT store_id
    FROM stg_store
    GROUP BY store_id
    HAVING COUNT(*) > 1
) AS duplicates;

-- 7. Sales without matching product details.
INSERT INTO quality_checks
SELECT 'unmatched_products', COUNT(*)
FROM stg_sales AS s
LEFT JOIN stg_product AS p
    ON s.product_id = p.product_id
WHERE p.product_id IS NULL;

-- 8. Sales without matching store details.
INSERT INTO quality_checks
SELECT 'unmatched_stores', COUNT(*)
FROM stg_sales AS s
LEFT JOIN stg_store AS t
    ON s.store_id = t.store_id
WHERE t.store_id IS NULL;

-- 9. Invalid quantity or transaction amounts.
INSERT INTO quality_checks
SELECT 'invalid_quantities_or_prices', COUNT(*)
FROM stg_sales
WHERE quantity <= 0
    OR unit_cost < 0
    OR net_price < 0
    OR unit_price < net_price;

-- 10. USD records should not need conversion.
INSERT INTO quality_checks
SELECT 'invalid_usd_exchange_rate', COUNT(*)
FROM stg_sales
WHERE currency_code = 'USD'
    AND (exchange_rate IS NULL OR exchange_rate <> 1);

SELECT *
FROM quality_checks
ORDER BY check_name;

SELECT CASE
    WHEN COUNT(*) = 10 AND SUM(issues) = 0
    THEN 'PASS: all 10 data checks'
    ELSE error('Fix the quality check failures.')
END AS result
FROM quality_checks;