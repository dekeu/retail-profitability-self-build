# Retail Profitability & What-If Planning

I built this project to explore retail gross profit and test how changes in price, unit cost and sales volume affect the result.

[Interactive dashboard](https://public.tableau.com/views/Retail_Profitability/1FinancialOverview?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
| [Portfolio website](https://dekeu.github.io/retail-profitability-self-build/)

## Dashboards

### Financial Overview
Revenue, gross profit, gross margin, orders and monthly sales.

![Financial Overview](docs/images/overview.png)

### Profitability Explorer
Category comparisons and product details, with a selectable metric.

![Profitability Explorer](docs/images/explorer.png)

### What-If Planner
Price, unit-cost and volume controls, with baseline comparisons and a reset control.

![What-If Planner](docs/images/planner.png)

## Data and definitions

The source is SQLBI's fictional Contoso dataset.
The analysis uses USD transactions only, with no FX conversion. One analytical row represents one sales order line.

- Revenue = quantity × historical net unit price.
- COGS = quantity × historical unit cost.
- Gross profit = revenue − COGS.
- Gross margin = total gross profit ÷ total revenue.
- Orders = distinct order IDs.

## Checked example

For the 2025 USD selection, baseline gross profit is $6,817,301.33. A 5% price increase, with unit cost and volume unchanged, produces $7,426,113.85 in scenario gross profit: an increase of $608,812.52.

This is a conditional scenario, not an observed business improvement.

Detailed findings and validation records are in analysis/.

## Reproducing the project

Run the SQL files in this order:

1. sql/01_load_raw.sql
2. sql/02_stage_sales.sql
3. sql/03_stage_dimensions.sql
4. sql/04_quality_checks.sql
5. sql/05_build_mart.sql
6. sql/06_answer_questions.sql
7. sql/07_export.sql

Connect Tableau to data/processed/retail_sales_usd.csv.

## Limitations

The data is fictional. Gross profit excludes operating expenses and taxes. Scenarios apply uniform changes, keep product mix constant and do not estimate customer demand response.

## Tools

DuckDB, SQL, Tableau Public, VS Code, GitHub and GitHub Pages.

[Original dataset](https://github.com/sql-bi/Contoso-Data-Generator-V2-Data)