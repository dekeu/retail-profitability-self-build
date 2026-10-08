# Dashboard checks

Last updated: 8 October 2026

I keep these notes to record the numbers and controls I have checked, and the results I still need to add. The reference selection is the fictional Contoso data, filtered to **2025 USD transactions and all categories**, unless stated otherwise.

A value of `5` in an assumption control means a 5% change. All three assumptions are zero at baseline.

[Published Tableau workbook](https://public.tableau.com/views/Retail_Profitability/1FinancialOverview)

## SQL and data checks

During the repository review on 8 October 2026, all seven build scripts, from `01_load_raw.sql` through `07_export.sql`, completed successfully.

All ten data-quality checks returned zero issues. These cover duplicate keys and sales lines, invalid fields and values, USD exchange rates, and unmatched product or store records. The results are in [quality_checks.csv](quality_checks.csv).

The export check also passed: the CSV had the same row count and financial totals as the USD mart, unique line IDs, and valid revenue, cost and gross-profit values.

The SQL totals matched the figures in [findings.md](findings.md).

### Reference totals

These are the SQL reference values for 2025, USD transactions and all categories. The full Tableau overview comparison still needs to be recorded.

| Measure | SQL reference value |
|---|---:|
| Sales order lines | 15,671 |
| Distinct orders | 6,535 |
| Units sold | 48,593 |
| Revenue | $12,176,250.37 |
| Cost of goods sold | $5,358,949.04 |
| Gross profit | $6,817,301.33 |
| Gross margin | 56.0% |

For the Computers category in the same year, revenue was $4,363,034.07, gross profit was $2,460,913.02 and gross margin was 56.4%.

## Desktop scenarios I checked

The following cases passed the desktop checks.

| Case | Price % | Unit cost % | Volume % | Scenario gross profit | Change from baseline |
|---|---:|---:|---:|---:|---:|
| No changes | 0 | 0 | 0 | $6,817,301.33 | $0.00 |
| Price increases by 5% | 5 | 0 | 0 | $7,426,113.85 | +$608,812.52 |
| Unit cost increases by 3% | 0 | 3 | 0 | $6,656,532.86 | −$160,768.47 |

Gross margin was 56.0% at baseline and 58.1% with the 5% price increase.

## Desktop controls I checked

- With all assumptions at zero, the baseline and scenario bars matched, and every category-change bar had zero length.
- Increasing unit cost by 3% produced a negative change, with the category bars extending left of zero.
- Selecting Computers updated all three planner KPI cards and both charts.
- With price at 5%, unit cost at 3% and volume at −5%, clicking Reset assumptions returned all three controls to zero. Year and Category stayed unchanged.

## A display problem I fixed

The category chart previously showed a visible Home Appliances bar at zero assumptions, even though its label said $0.00. After the revision, I confirmed that all category bars had zero length at baseline.

The saved gross-profit-change calculation rounds the aggregated difference to two decimal places.

## Saved workbook review

The repository review checked the configuration in the packaged Tableau workbook:

- Gross margin uses total gross profit divided by total revenue.
- Scenario revenue applies the price and volume changes; scenario COGS applies the unit-cost and volume changes.
- Year and Category filters are shared across the 13 analytical worksheets.
- The explorer's category-selection action is configured to filter the product details and show all values when the selection is cleared.
- Three reset actions return the price, unit-cost and volume assumptions to zero.

The published-browser checks are listed separately below.

## Scenario results still to record

The expected values below were checked against the SQL reference totals. Their actual Tableau results have not yet been added to this log.

| Case | Price % | Unit cost % | Volume % | Expected gross profit | Expected change | Actual Tableau result |
|---|---:|---:|---:|---:|---:|---|
| Volume increases by 10% | 0 | 0 | 10 | $7,499,031.46 | +$681,730.13 | Not recorded |
| Combined changes | 5 | 3 | −5 | $6,902,078.11 | +$84,776.78 | Not recorded |

If I have already completed either check, I can enter the observed amounts here. I will compare full values rather than rounded K or M labels.

## Other results still to record

| Check | What I need to confirm | Result |
|---|---|---|
| Overview totals | Full revenue, gross profit, margin and distinct orders agree with the SQL reference values above. | Not recorded |
| Shared filters | Year and Category update the relevant views across all three dashboards. | Not recorded |
| Explorer metric | Switching between Revenue and Gross Profit changes the displayed measure. | Not recorded |
| Explorer category selection | Selecting Computers limits the product table to that category; clearing the selection restores all categories. | Not recorded |
| Repeat reset | After changing an assumption, Reset works on a second use and preserves Year and Category. | Not recorded |
| Reset tooltip | Hovering over Reset assumptions no longer shows the internal Reset Value tooltip. | Not recorded |

## Published-browser check

I still need to add the date and results of the private-browser check.

- [ ] The workbook opens without signing in.
- [ ] All three dashboards can be opened.
- [ ] Titles, table headers, labels and controls are readable.
- [ ] Year and Category filters work across the relevant views.
- [ ] The explorer's metric switch and category-selection action work.
- [ ] Reset assumptions works twice and preserves Year and Category.
- [ ] Hovering over Reset does not show the internal tooltip.

## Default view

The reviewed workbook was saved with the following defaults. I will keep these settings for the final save and publication.

| Control | Default |
|---|---|
| Year | 2025 |
| Category | All |
| Metric | Gross Profit |
| Price change | 0 |
| Unit-cost change | 0 |
| Volume change | 0 |

Before taking the final screenshots, I will also clear selected marks and move the pointer away so that no tooltip covers a chart or heading.

