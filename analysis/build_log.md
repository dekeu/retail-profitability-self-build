# Build log

Last updated: 8 October 2026

## 8 October 2026

### Where I stopped

The Tableau workbook is published and the project has been uploaded to GitHub. The SQL build and recorded desktop checks have passed. I am finishing the repository cleanup, recording the remaining checks and preparing the portfolio website.

### What I finished

- Built three dashboards: Financial Overview, Profitability Explorer and What-If Planner.
- Adjusted the dashboard containers, controls and headers so they are readable.
- Checked the baseline, 5% price increase and 3% unit-cost increase cases.
- Checked that the Category filter updates the planner and that Reset assumptions returns all three inputs to zero while preserving Year and Category.
- Fixed the category chart so it shows no change bars when all assumptions are zero.
- Prepared the findings, scenario notes and dashboard-check log.
- Published the Tableau workbook and uploaded the project, including its screenshots, to GitHub.

### What the repository review confirmed

The seven SQL build scripts completed successfully. All ten data-quality checks returned zero issues, and the exported CSV passed the row-count and financial-total checks.

The 2025 SQL totals and category figures agreed with `findings.md`. The saved Tableau workbook also had the scenario calculations, shared Year and Category filters, and three reset actions in place.

The review found a few presentation items to finish: clear the selected category in the overview screenshot, remove the tooltip covering the explorer chart, and remove the internal tooltip from Reset assumptions before replacing the planner screenshot.

### Repository cleanup

The `.gitignore` covers raw and processed CSVs, DuckDB files, Tableau recovery files and `.DS_Store`.

Nine cleanup removals were prepared in GitHub Desktop. The commit and push still need to be confirmed in this log. The cleanup should keep the data files on my Mac while removing them from the repository's current tracked files.

### What I still need to confirm or record

Some of these items may already be complete locally. I will update this list from the actual results.

- [ ] Confirm that the cleanup commit has been pushed and the original data files remain available locally.
- [ ] Confirm that the Reset tooltip is removed in the revised local and published workbook.
- [ ] Replace the three screenshots with clear default views, without selected marks or tooltips.
- [ ] Record the volume +10% and combined-change scenario results.
- [ ] Record the full SQL-to-Tableau overview comparison and the remaining interaction checks.
- [ ] Check the published workbook in a private browser window and add the results to `test_log.md`.
- [ ] Push the revised workbook, screenshots and project notes to GitHub.

### The next phase

Once the cleanup and dashboard checks are recorded, I will create `docs/index.md` and `docs/_config.yml`, make the repository accessible to portfolio readers, and publish the website through GitHub Pages.

After publication, I will check the images and links in a private browser window and add the working website link to this log and the README.

### Default view

Year 2025, Category All, Metric Gross Profit, and all three assumptions at zero.

### Project links

- [Published Tableau workbook](https://public.tableau.com/views/Retail_Profitability/1FinancialOverview)
- [GitHub repository](https://github.com/dekeu/retail-profitability-self-build)
- Portfolio website — coming soon.

### Notes

The analysis uses fictional Contoso data and USD transactions only. Scenario gains are conditional calculations, rather than observed business improvements.

The detailed numbers and checks are in [test_log.md](test_log.md), the main observations are in [findings.md](findings.md), and the assumptions are in [scenario_note.md](scenario_note.md).

