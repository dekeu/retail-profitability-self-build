# Build log

Last updated: 12 October 2026

## Why I built this project

I wanted to practise turning retail sales data into a dashboard that explains profitability, rather than only showing revenue. I also wanted to explore how changes in price, cost and sales volume could affect gross profit.

I used SQLBI's fictional Contoso dataset, prepared the data with SQL and DuckDB, and built the dashboards in Tableau Public.

## Preparing the data

I used the sales, product and store files to create a dataset with one row for each sales order line. I kept USD transactions only so the analysis would not mix currencies, and used the historical selling price and unit cost from each transaction.

The final dataset contains 113,614 rows and 20 columns. The recorded quality checks found no duplicate sales lines, unmatched product or store keys, or invalid values covered by those checks. I also compared the exported data with the financial calculations used in the dashboards.

I published the processed CSV and added a data dictionary so someone reviewing the project can understand the fields. The original source files are not included, but the README explains where to download them and how to run the SQL scripts.

## Building the dashboards

I built three dashboards:

- **Financial Overview:** revenue, gross profit, gross margin, distinct orders and monthly trends.
- **Profitability Explorer:** category comparisons and product details, with a choice between Revenue and Gross Profit.
- **What-If Planner:** price, unit-cost and volume assumptions, with a comparison against the baseline.

During the build, I adjusted the containers and table headers to make the views easier to read. I also fixed a category-change chart that showed a visible bar when the assumptions were zero. The desktop check after the correction showed zero-length bars at the baseline.

I added a reset control to return the three scenario assumptions to zero while keeping the selected year and category.

## Checking the analysis

For 2025 across all categories, the data gives revenue of **$12,176,250.37** and gross profit of **$6,817,301.33**, with a gross margin of **56.0%**.

On 12 October, I ran the additional SQL analysis to look more closely at the pricing scenario. A 5% price increase with unchanged cost and volume gives a modelled gross-profit gain of **$608,812.52**. If volume falls by 5%, the gain falls to **$237,506.83**. With a 10% volume decline, gross profit falls below the baseline by **$133,798.87**.

The break-even volume decline is approximately **8.20%** under these assumptions. This helped me explain why a higher selling price does not automatically mean a better overall result.

I also checked product concentration within Computers. There were **592 products with sales in 2025**, and the ten highest-profit products contributed **16.49%** of the category's gross profit. Most of the category's profit therefore came from products outside the top ten.

The full results are in [findings.md](findings.md), and the checks are recorded in [test_log.md](test_log.md).

## Publishing the project

I published the dashboards on Tableau Public and created a GitHub Pages website with screenshots and a summary of the findings. The repository includes the SQL scripts, processed dataset, packaged Tableau workbook and analysis notes.

I updated the main README with the steps to rebuild the dataset, added the field definitions, and included the additional SQL findings in the website summary.

The remaining live dashboard checks are kept in the test log so they are separate from the SQL results already confirmed.

## What I learned

The main lesson was to look at revenue, margin and total gross profit together. A scenario can improve the margin percentage while reducing total profit if sales volume falls enough.

I also learned to make the assumptions clear. This project uses fictional data, and the planner keeps product mix constant. It does not predict customer demand, and gross profit excludes operating expenses and taxes. The scenario results show what would happen under the selected assumptions, rather than a real business improvement.

## Project links

- [Portfolio website](https://dekeu.github.io/retail-profitability-self-build/)
- [Interactive dashboards](https://public.tableau.com/views/Retail_Profitability/1FinancialOverview)
- [GitHub repository](https://github.com/dekeu/retail-profitability-self-build)
