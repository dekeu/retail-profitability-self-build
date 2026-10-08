CREATE OR REPLACE TABLE raw_sales AS
SELECT *
FROM read_csv(
    'data/raw/sales.csv',
    header = True,
    all_varchar = True
);

CREATE OR REPLACE TABLE raw_product AS
SELECT *
FROM read_csv(
    'data/raw/product.csv',
    header = True,
    all_varchar = True
);

CREATE OR REPLACE TABLE raw_store AS
SELECT *
FROM read_csv(
    'data/raw/store.csv',
    header = True,
    all_varchar = True
);

SELECT 'raw_sales' AS table_name, COUNT (*) AS row_count
FROM raw_sales
UNION ALL
SELECT 'raw_product', COUNT (*) AS row_count
FROM raw_product
UNION ALL
SELECT 'raw_store', COUNT (*) AS row_count
FROM raw_store;