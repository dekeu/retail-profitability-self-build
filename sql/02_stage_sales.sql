CREATE OR REPLACE TABLE stg_sales AS
SELECT  
    TRY_CAST(OrderKey AS BIGINT) AS order_id,
    TRY_CAST(LineNumber AS INTEGER) AS line_number,
    TRY_CAST(OrderDate AS DATE) AS order_date,
    TRY_CAST(ProductKey AS INTEGER) AS product_id,
    TRY_CAST(StoreKey AS INTEGER) AS store_id,
    TRY_CAST(Quantity AS INTEGER) AS quantity,
    TRY_CAST(UnitPrice AS DECIMAL(18,6)) AS unit_price,
    TRY_CAST(NetPrice AS DECIMAL(18,6)) AS net_price,
    TRY_CAST(UnitCost AS DECIMAL(18,6)) AS unit_cost,
    UPPER(TRIM(CurrencyCode)) AS currency_code,
    TRY_CAST(ExchangeRate AS DECIMAL(18,6)) AS exchange_rate
FROM raw_sales;

SELECT COUNT(*) AS sales_lines
FROM stg_sales;

DESCRIBE stg_sales;

SELECT * FROM stg_sales LIMIT 10;
