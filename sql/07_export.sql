COPY (
    SELECT
        line_id AS "LINE ID",
        CAST(order_id AS VARCHAR) AS "ORDER ID",
        order_date AS "ORDER DATE",
        order_year AS "ORDER YEAR",
        CAST(product_id AS VARCHAR) AS "PRODUCT ID",
        product_name AS "PRODUCT",
        category AS "CATEGORY",
        subcategory AS "SUBCATEGORY",
        brand AS "BRAND",
        CAST(store_id AS VARCHAR) AS "STORE ID",
        store_name AS "STORE",
        country AS "COUNTRY",
        state AS "STATE",
        currency_code AS "CURRENCY",
        quantity AS "QUANTITY",
        net_price AS "UNIT SELLING PRICE",
        unit_cost AS "UNIT COST",
        revenue AS "REVENUE",
        cogs AS "COGS",
        gross_profit AS "GROSS PROFIT"
    FROM mart_sales_usd
    ORDER BY order_id, line_number
)
TO 'data/processed/retail_sales_usd.csv'
WITH (HEADER, DELIMITER ',');

COPY (
    SELECT *
    FROM quality_checks
    ORDER BY check_name
)
TO 'analysis/quality_checks.csv'
WITH (HEADER, DELIMITER ',');

-- Read financial columns as decimal, not floating-point, to avoid rounding errors in Excel.
CREATE OR REPLACE TEMP TABLE exported_check AS
SELECT 
    "LINE ID" AS line_id,
    TRY_CAST("ORDER YEAR" AS INT) AS order_year,
    TRY_CAST("REVENUE" AS DECIMAL(24,6)) AS revenue,
    TRY_CAST("COGS" AS DECIMAL(24,6)) AS cogs,
    TRY_CAST("GROSS PROFIT" AS DECIMAL(24,6)) AS gross_profit
FROM read_csv_auto('data/processed/retail_sales_usd.csv',
header = TRUE, 
all_varchar = TRUE
);

WITH exported AS(
    SELECT
        COUNT(*) AS lines,
        COUNT(DISTINCT line_id) AS unique_lines,
        COUNT(revenue) AS valid_revenue,
        COUNT(cogs) AS valid_cogs,
        COUNT(gross_profit) AS valid_gp,
        SUM(revenue) AS revenue,
        SUM(cogs) AS cogs,
        SUM(gross_profit) AS gp
FROM exported_check
), original AS(
    SELECT
        COUNT(*) AS lines,
        SUM(revenue) AS revenue,
        SUM(cogs) AS cogs,
        SUM(gross_profit) AS gp
    FROM mart_sales_usd
)
SELECT CASE
    WHEN e.lines = o.lines AND e.unique_lines = e.lines
    AND e.valid_revenue = e.lines AND e.valid_cogs = e.lines AND e.valid_gp = e.lines
    AND e.revenue = o.revenue AND e.cogs = o.cogs AND e.gp = o.gp
    THEN 'PASS: exported rows and amounts match the mart'
    ELSE error('The exported CSV does not match the mart.')
END AS result
FROM exported AS e CROSS JOIN original AS o;

SELECT
    COUNT(*) AS sales_lines,
    ROUND(SUM(revenue),2) AS revenue,
    ROUND(SUM(cogs),2) AS cogs,
    ROUND(SUM(gross_profit),2) AS gross_profit
FROM exported_check
WHERE order_year = 2025;