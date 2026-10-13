# Test log

I used these checks to make sure the data and calculations made sense before relying on the dashboards. The dashboard checks below were done in the desktop workbook.

## Data checks

On 8 October 2026, SQL scripts 01–07 ran successfully. All ten data-quality checks returned zero issues, and the exported CSV matched the USD mart's row count and financial totals.

The CSV was checked again on 12 October. It had 113,614 sales order lines and 20 columns, with no duplicate line IDs or non-USD transactions. Revenue, COGS and gross profit matched their row-level formulas within $0.01.

Orders are counted using distinct order IDs. Gross margin is total gross profit divided by total revenue, rather than an average of the individual margins.

## SQL calculations

On 12 October, I ran `sql/08_extra_analysis.sql` in DuckDB. It checked a 5% price increase with unchanged unit cost at three volume levels: unchanged, down 5% and down 10%.

The same script calculated the volume decline that would remove the price increase's benefit, and the share of Computers gross profit coming from its ten highest-profit products.

All three result sets matched the reference calculations. The detailed results are in [findings.md](findings.md).

## Desktop dashboard checks

On 8 October, I checked that:

- With all assumptions at zero, the scenario matched the baseline and the category-change bars had zero length.
- The 5% price increase and 3% unit-cost increase matched their expected gross-profit results.
- Selecting Computers updated the planner's KPI cards and both charts.
- Reset returned all three assumptions to zero while keeping Year and Category unchanged.

One issue was a visible Home Appliances bar labelled $0.00 at the baseline. I corrected it and checked again; the bar then had zero length.

I also reviewed the saved workbook's formulas, shared filters, category-selection action and reset actions. The additional volume scenarios and product-concentration figures were verified through SQL.

These scenarios use fictional data and keep product mix constant. Their results depend on the assumptions entered and do not predict how customers will respond.

[Findings](findings.md) · [Scenario notes](scenario_note.md) · [Build log](build_log.md) · [Data checks](quality_checks.csv)
