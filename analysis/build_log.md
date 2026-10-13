# Build log

I started this project to get more practice analysing retail profit and building a dashboard that someone could explore for themselves. I used the fictional Contoso dataset, with SQL and DuckDB for the data work and Tableau Public for the dashboards.

## Getting the data ready

I joined the sales, product and store files, with one row for each sales order line. I kept USD transactions only, so I would not mix currencies without converting them. Revenue and costs use the historical net selling price and unit cost from each transaction.

The exported dataset has 113,614 rows and 20 columns. Before building the dashboards, I checked the required values, duplicate keys, product and store matches, and financial calculations.

I added the processed CSV and a data dictionary to the repository. The README explains where to get the original data and how to run the SQL.

## Building the dashboards

I built three dashboards:

- **Financial Overview** shows revenue, gross profit, margin, orders and monthly trends.
- **Profitability Explorer** lets the viewer compare categories and look at individual products.
- **What-If Planner** lets the viewer change price, unit cost and volume, then compare the result with the baseline.

The layout took some adjustment, especially the containers and table headers. I also fixed a Home Appliances bar that was still visible when the scenario change was zero. After the fix, the desktop check showed zero-length bars at the baseline.

I added a reset button for the three scenario assumptions. It keeps the selected year and category.

## Taking the analysis further

I tested the price increase again with lower sales volumes and calculated the volume decline that would remove its benefit. I also checked how much of Computers gross profit came from its ten leading products.

The main thing I took from this was that a higher margin does not always mean more total profit. Sales volume matters too, and the assumptions need to be clear.

I published the dashboards on Tableau Public and put the screenshots and findings on GitHub Pages. The repository contains the SQL, processed data, packaged workbook and analysis notes.

The data is fictional. The scenarios keep product mix constant and do not predict customer demand. Gross profit excludes operating expenses and taxes.

[Portfolio](https://dekeu.github.io/retail-profitability-self-build/) · [Dashboards](https://public.tableau.com/views/Retail_Profitability/1FinancialOverview) · [Findings](findings.md) · [Test log](test_log.md)
