DESCRIBE raw_sales;

SELECT *
FROM raw_sales
LIMIT 10;

SELECT
    CurrencyCode,
    COUNT (*) AS sales_lines
FROM raw_sales
GROUP BY CurrencyCode
ORDER BY sales_lines DESC;

SELECT ProductKey, ProductName, CategoryName
FROM raw_product
LIMIT 10;

SELECT StoreKey, Description, CountryName
FROM raw_store
LIMIT 10;