# Test log

Updated: 12 October 2026

I used these checks to make sure the numbers made sense and the dashboard behaved as expected. I have kept the SQL results separate from the Tableau checks because confirming a calculation does not confirm that a dashboard control works.

## Data and numbers

The earlier project notes record that SQL scripts 01–07 ran successfully on 8 October. The ten data-quality checks returned zero issues, and the exported CSV matched the USD mart's row count and financial totals. I did not rerun those scripts during the 12 October CSV review.

The exported CSV was checked again on 12 October. It contained 113,614 sales lines and 20 columns, with no duplicate line IDs or non-USD transactions. Revenue, COGS and gross profit agreed with their row-level formulas within $0.01.

These are the figures I am using to compare with Tableau:

| Measure | 2025, all categories | 2025, Computers |
|---|---:|---:|
| Units sold | 48,593 | 11,358 |
| Revenue | $12,176,250.37 | $4,363,034.07 |
| COGS | $5,358,949.04 | $1,902,121.05 |
| Gross profit | $6,817,301.33 | $2,460,913.02 |
| Gross margin | 56.0% | 56.4% |

The all-category selection has 15,671 sales lines and 6,535 distinct orders. I count orders by distinct order ID, and calculate margin from total gross profit divided by total revenue.

## Extra SQL checks

On 12 October, I ran `.read sql/08_extra_analysis.sql` in DuckDB. It returned the following results for 2025 across all categories, with price increased by 5% and unit cost unchanged:

| Volume change | Gross profit | Change from baseline |
|---:|---:|---:|
| 0% | $7,426,113.85 | +$608,812.52 |
| −5% | $7,054,808.16 | +$237,506.83 |
| −10% | $6,683,502.46 | −$133,798.87 |

The break-even volume decline was approximately **8.20%**. Since this percentage is rounded, entering exactly 8.20% may not return the baseline to the cent.

The Computers query returned **592 products with sales**. The ten highest-profit products contributed **$405,685.87**, or **16.49%**, of the category's **$2,460,913.02** gross profit.

All three SQL outputs matched the reference calculations. The matching Tableau scenarios still need to be recorded below.

## Dashboard checks already recorded

The earlier desktop notes record these checks as passed on 8 October:

- With all assumptions at zero, the scenario matched the baseline and the category-change bars had zero length.
- A 5% price increase gave gross profit of $7,426,113.85, up $608,812.52.
- A 3% unit-cost increase gave gross profit of $6,656,532.86, down $160,768.47.
- Selecting Computers updated the planner's three KPI cards and both charts.
- Reset returned all three assumptions to zero without changing Year or Category.

One issue I fixed was a visible Home Appliances bar with a $0.00 label at the baseline. After the change, the recorded desktop check showed zero-length bars when the assumptions were zero.

The saved workbook settings were also reviewed. The scenario formulas, shared filters, category-selection action and three reset actions were present. I still need to check their behaviour in the final published version.

## Final checks

The remaining Tableau comparisons are the volume +10% case, the combined price +5% / unit cost +3% / volume −5% case, and the two price +5% cases with volume falling by 5% and 10%. The expected gross profits are $7,499,031.46, $6,902,078.11, $7,054,808.16 and $6,683,502.46, respectively. Their actual Tableau results have not been recorded yet.

I also still need to check the final published filters, metric switch, category selection and repeated reset, along with number formatting and readable headers. The website links and downloaded workbook need a final browser check too.

Before the final save or new screenshots, I will return to 2025, All categories, Gross Profit and zero for all three assumptions, then clear selected marks and move the pointer away from the charts.

## A note about the results

The project uses fictional Contoso data and USD transactions only. Gross profit excludes operating expenses and taxes. The scenarios keep product mix constant and do not predict how customers will respond, so the gains are modelled results rather than actual business improvements.

[Findings](findings.md) · [Scenario notes](scenario_note.md) · [Build log](build_log.md) · [Saved data checks](quality_checks.csv)
