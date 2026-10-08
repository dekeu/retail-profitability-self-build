-- Full-year 2025 baseline.
SELECT
    COUNT (*) AS sales_lines,
    COUNT(DISTINCT order_id) AS orders,
    SUM(quantity) AS units,
    ROUND(SUM(revenue),2) AS revenue,
    ROUND(SUM(cogs),2) AS cogs,
    ROUND(SUM(gross_profit),2) AS gross_profit,
    ROUND(100.0 * SUM (gross_profit) / NULLIF(SUM(revenue),0),4) AS gross_margin_pct
FROM mart_sales_usd
WHERE order_year = 2025;

-- Monthly totals, in date order.
SELECT
    CAST(DATE_TRUNC('month', order_date) AS DATE) AS month,
    ROUND(SUM(revenue),2) AS revenue,
    ROUND(SUM(gross_profit),2) AS gross_profit,
FROM mart_sales_usd
WHERE order_year = 2025
GROUP BY month
ORDER BY month;

-- Category results.
SELECT
    category,
    ROUND(SUM(revenue),2) AS revenue,
    ROUND(SUM(gross_profit),2) AS gross_profit,
    ROUND(100.0 * SUM (gross_profit) / NULLIF(SUM(revenue),0),4) AS gross_margin_pct
FROM mart_sales_usd
WHERE order_year = 2025
GROUP BY category
ORDER BY gross_profit DESC;

-- Twenty products with the largest gross profit.
SELECT
    product_id,
    product_name,
    category,
    ROUND(SUM(revenue),2) AS revenue,
    ROUND(SUM(gross_profit),2) AS gross_profit,
    ROUND(100.0 * SUM (gross_profit) / NULLIF(SUM(revenue),0),4) AS gross_margin_pct
FROM mart_sales_usd
WHERE order_year = 2025
GROUP BY product_id, product_name, category
ORDER BY gross_profit DESC, product_id
LIMIT 20;