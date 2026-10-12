# Build log

Last updated: 12 October 2026

## Where I stopped

The three Tableau dashboards, portfolio website and processed USD dataset are published. The repository contains the SQL scripts, dashboard screenshots, analysis notes and a packaged Tableau workbook.

I am now finishing the validation records and documentation. The remaining work is to confirm that the downloadable workbook matches the published version, document the processed dataset, and add reproducible SQL for the additional findings.

## 8 October 2026 — Build and publication

### What I finished

- Built Financial Overview, Profitability Explorer and What-If Planner.
- Added Year and Category filters, a Revenue/Gross Profit metric selector, and price, unit-cost and volume assumptions.
- Adjusted the dashboard containers and table headers to make the views readable.
- Fixed the category-change chart so that its bars have zero length when all assumptions are zero.
- Prepared the findings, scenario explanation and dashboard-check notes.
- Published the Tableau workbook and portfolio website.
- Uploaded the dashboard screenshots, packaged workbook and processed CSV to GitHub.

### Checks recorded at this stage

The repository review recorded successful execution of the seven SQL scripts, from `01_load_raw.sql` through `07_export.sql`. All ten data-quality checks returned zero issues. The exported CSV also passed the row-count and financial-total comparisons against the USD mart.

The recorded desktop checks covered the baseline, a 5% price increase and a 3% unit-cost increase. They also covered the planner's Category filter and resetting all three assumptions while preserving Year and Category.

The saved workbook review confirmed the scenario formulas, shared Year and Category filters, the explorer's category-selection action, and three parameter actions for Reset assumptions.

The detailed results are recorded in [test_log.md](test_log.md).

## 12 October 2026 — Repository review

### What the review confirmed

The processed CSV contains 113,614 sales order lines, 20 columns and unique `LINE ID` values. Its dates run from 18 May 2016 to 31 December 2025. It includes USD transactions only.

Recalculating the 2025 selection from this CSV reproduced the reference figures used in the findings:

| Measure | 2025, all categories |
|---|---:|
| Sales order lines | 15,671 |
| Distinct orders | 6,535 |
| Units sold | 48,593 |
| Revenue | $12,176,250.37 |
| Cost of goods sold | $5,358,949.04 |
| Gross profit | $6,817,301.33 |
| Gross margin | 56.0% |

The three committed screenshots show clear default views, without selected marks or tooltips covering the charts. The GitHub Pages deployment for the latest reviewed commit completed successfully.

The remaining Tableau interactions and the final published workbook still need their observed results entered in the test log. The CSV calculations and saved workbook configuration do not replace those checks.

### Data publication decision

The processed CSV is intentionally published so readers can inspect the analytical dataset used by Tableau.

The raw source CSVs and working DuckDB database are not included in the repository. The source archive and required files are described in [the raw-data notes](../data/raw/README.md), and the SQL scripts document the transformations.

### What I still need to finish

Some dashboard checks may already be complete locally. I will update the list below from the actual results and record the date and environment in the test log.

- [ ] Confirm consistent number formatting across the final dashboards.
- [ ] Confirm that hovering over Reset assumptions does not show the internal Reset Value tooltip.
- [ ] Record the volume +10% and combined-change scenario results.
- [ ] Record the full overview comparison, shared-filter checks, metric switch, category-selection action and repeated Reset check.
- [ ] Confirm that the packaged workbook and Tableau Public version match.
- [ ] Add `data/processed/README.md` with the dataset description and data dictionary.
- [ ] Add executable reproduction instructions to the main README.
- [ ] Run and check the additional SQL for pricing sensitivity and Computers product contribution.
- [ ] Add the verified additional findings to `findings.md` and a shorter explanation to the website.
- [ ] Fill in the repository's About description, website and topics.
- [ ] Push the revised workbook, screenshots and documentation.
- [ ] Check the updated website, download and links in a private browser window, then record the results.

### My next step

I will first complete the remaining entries in `test_log.md`. Then I will document the processed CSV, check the reproduction instructions and add the extra analysis.

After pushing the updates, I will check the published website and downloaded workbook and record the final results here.

## Default view for the final save

| Control | Default |
|---|---|
| Year | 2025 |
| Category | All |
| Explorer metric | Gross Profit |
| Price change | 0 |
| Unit-cost change | 0 |
| Volume change | 0 |

Before saving and taking screenshots, I will clear selected marks and move the pointer away from the charts so that no tooltip covers the view.

## Project links

- [Portfolio website](https://dekeu.github.io/retail-profitability-self-build/)
- [Interactive Tableau workbook](https://public.tableau.com/views/Retail_Profitability/1FinancialOverview)
- [GitHub repository](https://github.com/dekeu/retail-profitability-self-build)
- [Dashboard checks](test_log.md)
- [Findings](findings.md)
- [Scenario explanation](scenario_note.md)

## Scope and limitations

This project uses fictional Contoso data and USD transactions only, with no currency conversion.

Gross profit excludes operating expenses and taxes. The planner applies uniform changes to the selected products, keeps product mix constant and does not predict customer demand.

Scenario gains describe what happens under the stated assumptions. They are not observed business improvements.

