SELECT CASE
    WHEN COUNT(*) = 10 AND SUM(issues) = 0
    THEN 'Input checks passed'
    ELSE error ('Run and pass 04_quality_checks.sql first')
END AS result
FROM quality_checks;

CREATE OR REPLACE TABLE mart_sales_usd AS
WITH joined_sales AS (
    SELECT
        CAST(s.order_id AS VARCHAR) || '-' ||
            CAST(s.line_number AS VARCHAR) AS line_id,
        s.order_id,
        s.line_number,
        s.order_date,
        CAST(EXTRACT(YEAR FROM s.order_date) AS INT) AS order_year,
        s.product_id,
        p.product_name,
        p.category,
        p.subcategory,
        p.brand,
        s.store_id,
        t.store_name,
        t.country,
        t.state,
        s.currency_code,
        s.quantity,
        s.net_price,
        s.unit_cost,
        s.quantity * s.net_price AS revenue,
        s.quantity * s.unit_cost AS cogs,
    FROM stg_sales AS s
    LEFT JOIN stg_product AS p
        ON s.product_id = p.product_id
    LEFT JOIN stg_store AS t
        ON s.store_id = t.store_id
    WHERE s.currency_code = 'USD'
)

SELECT *, revenue - cogs AS gross_profit
FROM joined_sales;

SELECT CASE
    WHEN COUNT(*) = COUNT(DISTINCT line_id)
    AND COUNT(*) = (
        SELECT COUNT(*)
        FROM stg_sales
        WHERE currency_code = 'USD'
    )
    THEN 'PASS: one row per USD sales line'
    ELSE error('Check join duplication or missing lines')
END AS result
from mart_sales_usd;

WITH source_totals AS(
    SELECT
        SUM(quantity * net_price) AS revenue,
        SUM(quantity * unit_cost) AS cogs
    FROM stg_sales
    WHERE currency_code = 'USD'
), mart_totals AS (
    SELECT
        SUM(revenue) AS revenue,
        SUM(cogs) AS cogs
    FROM mart_sales_usd
)
SELECT CASE
    WHEN source_totals.revenue = mart_totals.revenue
    AND source_totals.cogs = mart_totals.cogs
    THEN 'PASS: revenue and cogs match'
    ELSE error('Amounts changed during the joins')
END AS result
FROM source_totals CROSS JOIN mart_totals;

SELECT
    COUNT(*) AS sales_lines,
    COUNT(DISTINCT order_id) AS orders,
    SUM(quantity) as units,
    MIN(order_date) AS first_order,
    MAX(order_date) AS last_order,
FROM mart_sales_usd;