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
of 56.0%. Computers contributed about 36.1% of total gross profit.

A 5% price increase, with unit cost and volume unchanged, produces
modelled gross profit of $7,426,113.85, an increase of $608,812.52.
The result depends on how much sales volume falls:

| Volume change at Price +5%, Unit cost 0% | Modelled gross profit | Change from baseline |
|---:|---:|---:|
| 0% | $7,426,113.85 | +$608,812.52 |
| −5% | $7,054,808.16 | +$237,506.83 |
| −10% | $6,683,502.46 | −$133,798.87 |

Under these assumptions, a volume decline of approximately **8.20%**
would erase the gross-profit gain. This is a break-even calculation,
not a prediction of customer demand.

Within Computers, **592 products had sales in 2025**. The ten products
with the highest gross profit contributed **$405,685.87**, or **16.49%**
of the category's $2,460,913.02 gross profit. Most category profit came
from products outside that top ten.

I checked these additional results by running the SQL analysis locally.
All scenarios are conditional calculations using fictional data; they
are not observed business improvements.

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
· [Dataset and field definitions](https://github.com/dekeu/retail-profitability-self-build/blob/main/data/processed/README.md)
· [Rebuild instructions](https://github.com/dekeu/retail-profitability-self-build#reproducing-the-project)

Built by Fernanda Adekeu Alif using DuckDB, SQL and Tableau Public.
