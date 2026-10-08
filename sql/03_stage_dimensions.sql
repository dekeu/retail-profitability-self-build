CREATE OR REPLACE TABLE stg_product AS
SELECT
    TRY_CAST(ProductKey AS INTEGER) AS product_id,
    TRIM(ProductName) AS product_name,
    TRIM(CategoryName) AS category,
    TRIM(SubCategoryName) AS subcategory,
    TRIM(Brand) AS brand,
FROM raw_product;

CREATE OR REPLACE TABLE stg_store AS
SELECT
    TRY_CAST(StoreKey AS INTEGER) AS store_id,
    TRIM(Description) AS store_name,
    TRIM(CountryName) AS country,
    TRIM(State) AS state
FROM raw_store;

SELECT 'stg_product' AS table_name, COUNT (*) AS row_count FROM stg_product
UNION ALL
SELECT 'stg_store', COUNT (*) FROM stg_store;

SELECT * FROM stg_product LIMIT 10;
SELECT * FROM stg_store LIMIT 10;