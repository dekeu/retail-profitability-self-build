---
layout: default
---

I built this project to explore retail gross profit and test how changes
in price, unit cost and sales volume affect the result.

[Open the interactive dashboard](https://public.tableau.com/views/Retail_Profitability/1FinancialOverview)
· [View the project on GitHub](https://github.com/dekeu/retail-profitability-self-build)

## Financial Overview

Revenue, gross profit, gross margin, distinct orders and monthly trends.

![Financial Overview](images/overview.png)

## Profitability Explorer

Compare categories using revenue or gross profit, then select a category
to inspect its products.

![Profitability Explorer](images/explorer.png)

## What-If Planner

Adjust price, unit cost and volume to compare scenario gross profit with
the baseline. Reset assumptions returns the three inputs to zero.

![What-If Planner](images/planner.png)

## What I found

For 2025 USD transactions across all categories, revenue was
$12,176,250.37 and gross profit was $6,817,301.33, with a gross margin
of 56.0%. Computers contributed about 36.1% of gross profit.

A 5% price increase, with unit cost and volume unchanged, produces
scenario gross profit of $7,426,113.85, an increase of $608,812.52.
This is a conditional calculation, not an observed business improvement.

[Read the findings](https://github.com/dekeu/retail-profitability-self-build/blob/main/analysis/findings.md)
· [View the SQL](https://github.com/dekeu/retail-profitability-self-build/tree/main/sql)
· [Read the dashboard checks](https://github.com/dekeu/retail-profitability-self-build/blob/main/analysis/test_log.md)

## Data and assumptions

The source is SQLBI's fictional Contoso dataset. The analysis uses USD
transactions only, with no currency conversion. Each analytical row
represents one sales order line.

Gross profit is revenue minus cost of goods sold and excludes operating
expenses and taxes. Scenarios apply uniform changes, keep product mix
constant and do not estimate customer demand response.

[Original dataset](https://github.com/sql-bi/Contoso-Data-Generator-V2-Data/releases/tag/ready-to-use-data)

Built by Fernanda Adekeu Alif using DuckDB, SQL and Tableau Public.