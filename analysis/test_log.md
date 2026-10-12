# Retail profitability dashboard checks

Last updated: 12 October 2026

I use this file to keep a record of the numbers, filters and scenario controls I have checked. It also shows the checks whose actual Tableau results still need to be recorded.

The starting selection is **2025, USD transactions and all categories**, using the fictional Contoso dataset. One row represents one sales order line. All three scenario assumptions are zero unless a test says otherwise.

An input of `5` means a 5% increase. An input of `-5` means a 5% decrease.

[Tableau dashboard](https://public.tableau.com/views/Retail_Profitability/1FinancialOverview) | [Portfolio website](https://dekeu.github.io/retail-profitability-self-build/) | [GitHub repository](https://github.com/dekeu/retail-profitability-self-build)

## Where the checks stand

The SQL build and the desktop checks listed below were recorded as passed on 8 October. On 12 October, the published CSV was checked again and the reference numbers and scenario calculations were reviewed.

The additional SQL script was also run locally on 12 October; all three result sets matched the reference calculations.

The new CSV review does not establish that the latest published Tableau controls work. Those results need to be checked in the workbook and recorded separately.

| Status | Meaning |
|---|---|
| Passed — recorded | The earlier project log records the actual check as passed. |
| Passed — CSV review | The exported data was checked again on 12 October. |
| Configuration reviewed | The saved workbook settings were reviewed; this is not a live interaction test. |
| Not recorded | The expected result is available, but the actual Tableau result has not been entered. |

## 1. SQL build and data quality

### Previously recorded build results

The seven build scripts, from `01_load_raw.sql` through `07_export.sql`, completed successfully during the 8 October repository review. The export checks recorded matching row counts and financial totals between the USD mart and the CSV.

Status: **Passed — recorded, 8 October 2026.** These scripts were not rerun as part of the 12 October CSV review.

The saved [quality_checks.csv](quality_checks.csv) contains the following results:

| Check | Issues recorded |
|---|---:|
| Duplicate product keys | 0 |
| Duplicate sales order lines | 0 |
| Duplicate store keys | 0 |
| Invalid product records | 0 |
| Invalid quantities or prices | 0 |
| Invalid sales fields | 0 |
| Invalid store records | 0 |
| Invalid USD exchange rates | 0 |
| Unmatched products | 0 |
| Unmatched stores | 0 |

The saved output was reviewed on 12 October; all ten checks still show zero issues. This is a review of the recorded output, rather than a new run against the raw source tables.

### Exported CSV review — 12 October 2026

The copy used for this review was confirmed to match the current GitHub CSV.

| Check | Observed result | Status |
|---|---|---|
| Exported sales order lines | 113,614 data rows, excluding the header | Passed — CSV review |
| Duplicate line IDs | 0 | Passed — CSV review |
| Currency scope | All rows are USD; 0 non-USD rows | Passed — CSV review |
| Revenue calculation | 0 mismatches above $0.01 against quantity × historical unit selling price | Passed — CSV review |
| COGS calculation | 0 mismatches above $0.01 against quantity × historical unit cost | Passed — CSV review |
| Gross-profit calculation | 0 mismatches above $0.01 against revenue − COGS | Passed — CSV review |
| 2025 reference totals | Agree with the totals below, rounded to cents | Passed — CSV review |

### Additional SQL analysis — 12 October 2026

I ran `.read sql/08_extra_analysis.sql` in my local DuckDB database and recorded all three result sets below. These are observed SQL outputs, separate from the Tableau checks.

Selection: Year 2025, USD transactions. Pricing scenarios use all categories, a 5% price increase and unchanged unit costs.

| Volume change | Observed scenario gross profit | Observed change from baseline | Result |
|---:|---:|---:|---|
| 0% | $7,426,113.85 | +$608,812.52 | Passed — local DuckDB |
| −5% | $7,054,808.16 | +$237,506.83 | Passed — local DuckDB |
| −10% | $6,683,502.46 | −$133,798.87 | Passed — local DuckDB |

| Additional check | Observed result | Result |
|---|---:|---|
| Break-even volume decline at Price +5%, Unit cost 0% | Approximately 8.20% | Passed — local DuckDB |
| Computers products with sales in 2025 | 592 | Passed — local DuckDB |
| Computers gross profit | $2,460,913.02 | Passed — local DuckDB |
| Gross profit from the ten highest-profit Computers products | $405,685.87 | Passed — local DuckDB |
| Top-ten share of Computers gross profit | 16.49% | Passed — local DuckDB |

The outputs agreed with the reference calculations. The break-even percentage is rounded to two decimal places; using exactly 8.20% need not reproduce the baseline to the cent. Products with sales are distinct product IDs in the selected year and category.

These checks confirm the SQL calculations. The −5% and −10% volume cases still need their actual Tableau results recorded in section 3.

## 2. Numbers to compare with Tableau

These are reference values from the exported data. The separate Tableau comparison remains open until the displayed results are recorded.

### Year 2025, all categories

| Measure | Reference value |
|---|---:|
| Sales order lines | 15,671 |
| Distinct orders | 6,535 |
| Units sold | 48,593 |
| Revenue | $12,176,250.37 |
| COGS | $5,358,949.04 |
| Gross profit | $6,817,301.33 |
| Gross margin | 56.0% |

Orders should use distinct order IDs, rather than the number of sales lines. Gross margin should use total gross profit divided by total revenue.

### Year 2025, Computers

| Measure | Reference value |
|---|---:|
| Units sold | 11,358 |
| Revenue | $4,363,034.07 |
| COGS | $1,902,121.05 |
| Gross profit | $2,460,913.02 |
| Gross margin | 56.4% |

For the dashboard comparison, check the full amounts in the labels or tooltips. A rounded label such as `$6.82M` is useful for display, but it is not enough to confirm the cents.

## 3. Scenario calculations

The model applies price changes to revenue, unit-cost changes to COGS, and volume changes to both. Product mix remains unchanged.

```text
Scenario revenue = Baseline revenue × (1 + Price / 100) × (1 + Volume / 100)
Scenario COGS = Baseline COGS × (1 + Unit cost / 100) × (1 + Volume / 100)
Scenario gross profit = Scenario revenue − Scenario COGS
Gross-profit change = Scenario gross profit − Baseline gross profit
Scenario gross margin = Scenario gross profit / Scenario revenue
```

I keep full precision during the calculation and round the final money values to cents. Subtracting separately rounded revenue and COGS can occasionally differ by one cent from the rounded gross-profit result.

### Scenarios already recorded as passed on desktop

Selection: Year 2025, Category All.

| Case | Price % | Unit cost % | Volume % | Recorded gross profit | Change from baseline | Margin |
|---|---:|---:|---:|---:|---:|---:|
| Baseline | 0 | 0 | 0 | $6,817,301.33 | $0.00 | 56.0% |
| Price increases by 5% | 5 | 0 | 0 | $7,426,113.85 | +$608,812.52 | 58.1% |
| Unit cost increases by 3% | 0 | 3 | 0 | $6,656,532.86 | −$160,768.47 | 54.7% |

Status: **Passed — recorded.** The 54.7% margin for the cost case is the calculated reference; the earlier log recorded its gross profit and change, but did not record the displayed margin.

### Remaining scenario results to record

The expected values below were recalculated on 12 October. Their actual Tableau results are still missing from this log.

| Case | Price % | Unit cost % | Volume % | Expected gross profit | Expected change | Expected margin |
|---|---:|---:|---:|---:|---:|---:|
| Volume increases by 10% | 0 | 0 | 10 | $7,499,031.46 | +$681,730.13 | 56.0% |
| Combined changes | 5 | 3 | −5 | $6,902,078.11 | +$84,776.78 | 56.8% |
| Price +5%, volume −5% | 5 | 0 | −5 | $7,054,808.16 | +$237,506.83 | 58.1% |
| Price +5%, volume −10% | 5 | 0 | −10 | $6,683,502.46 | −$133,798.87 | 58.1% |

The last two cases extend the price-sensitivity review. They show that a higher margin does not necessarily mean a higher total gross profit when volume falls.

| Case | Actual Tableau gross profit | Actual change | Date and result |
|---|---|---|---|
| Volume increases by 10% | Not recorded | Not recorded | Not recorded |
| Combined changes | Not recorded | Not recorded | Not recorded |
| Price +5%, volume −5% | Not recorded | Not recorded | Not recorded |
| Price +5%, volume −10% | Not recorded | Not recorded | Not recorded |

To finish each check, set the inputs above, compare the full amounts, and enter the observed result. Volume +10% should leave gross margin unchanged because revenue and COGS increase by the same proportion.

## 4. Controls already checked on desktop

The earlier log records these checks as passed:

- At zero assumptions, the baseline and scenario bars matched and every category-change bar had zero length.
- A 3% unit-cost increase produced a negative change, with category bars extending to the left of zero.
- Selecting Computers updated all three planner KPI cards and both planner charts.
- With Price at 5%, Unit cost at 3% and Volume at −5%, Reset assumptions returned all three inputs to zero while keeping Year and Category unchanged.

### Display issue that was fixed

The category chart previously showed a visible Home Appliances bar at baseline even though its label said `$0.00`. After the revision, the desktop check confirmed that all category-change bars had zero length at zero assumptions.

The saved gross-profit-change calculation rounds the aggregated difference to two decimal places.

## 5. Saved workbook configuration

The earlier workbook review confirmed these settings:

| Setting | Recorded configuration |
|---|---|
| Gross margin | Total gross profit divided by total revenue |
| Scenario revenue | Applies price and volume changes |
| Scenario COGS | Applies unit-cost and volume changes |
| Shared filters | Year and Category are shared across the 13 analytical worksheets |
| Explorer category action | Filters the product details; clearing the selection shows all values |
| Reset actions | Three actions return Price, Unit cost and Volume to zero |

Status: **Configuration reviewed.** The controls below still need a live check in the revised workbook.

## 6. Dashboard interactions and formatting to record

| Check | What I will do and what should happen | Result |
|---|---|---|
| Financial Overview totals | Select 2025 and All; compare revenue, gross profit, margin and distinct orders with section 2. | Not recorded |
| Computers totals | Select Computers; compare the displayed financial figures with the Computers reference in section 2. | Not recorded |
| Shared Year filter | Change Year and open all three dashboards. Relevant worksheets should reflect the same year. Return to 2025. | Not recorded |
| Shared Category filter | Select Computers and open all three dashboards. Relevant worksheets should reflect that category. Return to All. | Not recorded |
| Explorer metric switch | Switch between Revenue and Gross Profit. The chart values, ordering and labels should match the selected measure. | Not recorded |
| Explorer category selection | With Category All, select Computers in the category chart. The product table should show Computers products; clearing the selection should restore the full selection. | Not recorded |
| Reset on a second use | Change all three assumptions, reset, change them again and reset a second time. Both resets should return the assumptions to zero and preserve Year and Category. | Not recorded |
| Reset tooltip | Hover over Reset assumptions. The internal Reset Value tooltip should not appear. | Not recorded |
| Number formatting | Use consistent English-style separators, for example `$6,817,301.33`, and one decimal place for margins. | Not recorded |
| Titles and headers | Gross Profit, Gross Margin and the product-table headers should be fully readable, with no overlap or truncation. | Not recorded |
| Clean screenshots | Clear selected marks and move the pointer away before exporting; no tooltip should cover a chart or heading. | Not recorded |

## 7. Published workbook and website

The desktop results above need a separate check after the final workbook is published.

Open the portfolio website and Tableau dashboard in a private browser window, without signing in. Record the date and result of each check below.

| Check | Expected result | Date and result |
|---|---|---|
| Website access | The portfolio page opens and its images load. | Not recorded |
| Dashboard link | The website link opens the intended Tableau workbook. | Not recorded |
| Dashboard navigation | Financial Overview, Profitability Explorer and What-If Planner all open. | Not recorded |
| Published totals | The 2025 baseline and Computers figures match section 2. | Not recorded |
| Published scenarios | The recorded and remaining scenario cases match section 3. | Not recorded |
| Published filters | Year and Category update the relevant views across all three dashboards. | Not recorded |
| Published explorer | The metric switch and category-selection action work, including clearing the selection. | Not recorded |
| Published reset | Reset works twice, preserves Year and Category, and has no internal tooltip. | Not recorded |
| Published presentation | Titles, headers, labels and controls remain readable. | Not recorded |
| Workbook download | The GitHub workbook download opens with its embedded data available. | Not recorded |

## 8. Final saved view

Before the final save, publication and screenshots, restore these settings:

| Control | Default |
|---|---|
| Year | 2025 |
| Category | All |
| Explorer metric | Gross Profit |
| Price change | 0 |
| Unit-cost change | 0 |
| Volume change | 0 |

Clear any selected marks and move the pointer away from charts and controls.

- [ ] Record the remaining scenario amounts and results.
- [ ] Record the overview and Computers comparisons.
- [ ] Record the revised workbook's interaction and formatting checks.
- [ ] Save and publish the workbook with the defaults above.
- [ ] Replace the screenshots with clean views from that version.
- [ ] Record the private-browser and workbook-download checks.
- [ ] Commit and push the updated workbook, screenshots and notes.

I will change an item to Passed only after checking it and entering the observed result and date. If a check fails, I will note what happened, correct it and record the repeat check.

## Notes on interpretation

This project uses fictional sample data and USD transactions only, without currency conversion. Gross profit excludes operating expenses and taxes. The scenario model applies uniform percentage changes and keeps product mix constant; it does not predict customer demand.

The scenario amounts are conditional calculations. They are not realised business improvements.

Related notes: [findings.md](findings.md), [scenario_note.md](scenario_note.md) and [build_log.md](build_log.md).
