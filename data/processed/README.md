# Processed retail dataset

This folder contains `retail_sales_usd.csv`, the dataset used by the
Tableau dashboards.

It was prepared from SQLBI's fictional Contoso data using the project's
DuckDB SQL scripts. It includes USD transactions only, with no currency
conversion.

## Dataset summary

- Rows: 113,614
- Columns: 20
- Date coverage: 18 May 2016 to 31 December 2025
- Grain: one row per sales order line
- Unique identifier: LINE ID
- Default dashboard year: 2025

The full file contains multiple years. The 2025 selection contains
15,671 sales order lines and 6,535 distinct orders.

## Data dictionary

These are the intended field types. CSV files themselves do not store
data types.

| Column | Intended type | Meaning |
|---|---|---|
| LINE ID | Text | Unique identifier combining the order ID and line number. |
| ORDER ID | Text | Sales order identifier; an order can contain several lines. |
| ORDER DATE | Date | Date of the sales order. |
| ORDER YEAR | Integer | Calendar year extracted from the order date. |
| PRODUCT ID | Text | Product identifier. |
| PRODUCT | Text | Product name. |
| CATEGORY | Text | Product category. |
| SUBCATEGORY | Text | Product subcategory. |
| BRAND | Text | Product brand. |
| STORE ID | Text | Store identifier. |
| STORE | Text | Store name. |
| COUNTRY | Text | Country associated with the store. |
| STATE | Text | State or region associated with the store. |
| CURRENCY | Text | Transaction currency; USD throughout this export. |
| QUANTITY | Integer | Number of units sold on the order line. |
| UNIT SELLING PRICE | Decimal | Historical net selling price per unit. |
| UNIT COST | Decimal | Historical cost per unit recorded on the sales line. |
| REVENUE | Decimal | Quantity multiplied by unit selling price. |
| COGS | Decimal | Quantity multiplied by unit cost. |
| GROSS PROFIT | Decimal | Revenue minus COGS. |

## Measures used in Tableau

Gross margin is total gross profit divided by total revenue.
Orders are counted using distinct ORDER ID values.

Gross profit excludes operating expenses and taxes.

## Rebuilding the file

Run the SQL scripts from `01_load_raw.sql` through `07_export.sql`
from the repository's root folder. The final script writes this CSV
and checks its row count and financial totals against the USD mart.

The source archive and required raw files are described in
[the raw-data notes](../raw/README.md).