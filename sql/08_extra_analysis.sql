-- 1. Test a 5% price increase with different volume changes.
-- Unit cost remains unchanged in these scenarios.

WITH baseline AS (
    SELECT
        SUM(revenue) AS revenue,
        SUM(cogs) AS cogs,
        SUM(gross_profit) AS baseline_gp
    FROM mart_sales_usd
    WHERE order_year = 2025
),
volume_cases(volume_change_pct) AS (
    VALUES (0), (-5), (-10)
),
scenarios AS (
    SELECT
        volume_change_pct,
        baseline_gp,
        (
            revenue * 1.05 - cogs
        ) * (
            1 + volume_change_pct / 100.0
        ) AS scenario_gp
    FROM baseline
    CROSS JOIN volume_cases
)
SELECT
    volume_change_pct,
    ROUND(scenario_gp, 2) AS scenario_gross_profit,
    ROUND(scenario_gp - baseline_gp, 2) AS gp_change
FROM scenarios
ORDER BY volume_change_pct DESC;


-- 2. Find the volume decline that would remove the gain
-- from a 5% price increase, with unit cost unchanged.
-- The result is a positive percentage decline.

SELECT
    ROUND(
        100.0 * (
            1 - SUM(gross_profit) /
                NULLIF(
                    SUM(revenue) * 1.05 - SUM(cogs),
                    0
                )
        ),
        2
    ) AS maximum_volume_decline_pct
FROM mart_sales_usd
WHERE order_year = 2025;


-- 3. Measure how much Computers gross profit comes
-- from its ten highest-profit products.

WITH product_profit AS (
    SELECT
        product_id,
        SUM(gross_profit) AS product_gp
    FROM mart_sales_usd
    WHERE order_year = 2025
      AND category = 'Computers'
    GROUP BY product_id
),
ranked_products AS (
    SELECT
        product_id,
        product_gp,
        ROW_NUMBER() OVER (
            ORDER BY product_gp DESC, product_id
        ) AS profit_rank
    FROM product_profit
)
SELECT
    COUNT(*) AS products_sold,
    ROUND(SUM(product_gp), 2) AS category_gross_profit,
    ROUND(
        SUM(
            CASE WHEN profit_rank <= 10
                THEN product_gp ELSE 0
            END
        ),
        2
    ) AS top_10_gross_profit,
    ROUND(
        100.0 * SUM(
            CASE WHEN profit_rank <= 10
                THEN product_gp ELSE 0
            END
        ) / NULLIF(SUM(product_gp), 0),
        2
    ) AS top_10_share_pct
FROM ranked_products;