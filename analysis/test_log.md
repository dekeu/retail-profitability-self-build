# Dashboard checks

Last updated: 8 October 2026

I checked the dashboard in Tableau Public on my Mac using the fictional Contoso data, filtered to 2025 USD transactions. Unless stated otherwise, all categories were selected. These notes keep track of the numbers and controls I checked before publishing.

## Numbers I checked

The three cases below passed the desktop checks. A value of 5 in a control means a 5% change.

| Case | Price % | Unit cost % | Volume % | Scenario gross profit | Change from baseline |
|---|---:|---:|---:|---:|---:|
| No changes | 0 | 0 | 0 | $6,817,301.33 | $0.00 |
| Price increases by 5% | 5 | 0 | 0 | $7,426,113.85 | +$608,812.52 |
| Unit cost increases by 3% | 0 | 3 | 0 | $6,656,532.86 | −$160,768.47 |

Gross margin was 56.0% at baseline and 58.1% with the 5% price increase. The price-increase case is also shown in my screenshot from 8 October 2026 at 17:33 WIB.

## Controls I checked

- With all assumptions at zero, the baseline and scenario bars matched, and every category-change bar had zero length.
- Increasing unit cost by 3% produced a negative change, with the category bars extending left of zero.
- Selecting Computers updated all three planner KPI cards and both charts.
- With price at 5%, unit cost at 3% and volume at −5%, clicking Reset assumptions returned all three controls to zero. Year and Category stayed unchanged.

## A problem I fixed

The category chart previously showed a visible Home Appliances bar at zero assumptions, even though its label said $0.00. After the revision, I confirmed that all category bars had zero length at baseline.

## Results still to record

These are the expected values from the project guide. The actual results have not been added to this log yet.

| Case | Price / cost / volume (%) | Expected gross profit | Expected change | Actual result |
|---|---|---:|---:|---|
| Volume increases by 10% | 0 / 0 / 10 | $7,499,031.46 | +$681,730.13 | Not recorded |
| Combined changes | 5 / 3 / −5 | $6,902,078.11 | +$84,776.78 | Not recorded |

I also need to record:

- The comparison between SQL and Tableau, using full amounts rather than rounded K or M labels.
- The overview comparison with SQL: revenue $12,176,250.37, gross profit $6,817,301.33, margin about 56.0%, and 6,535 distinct orders.
- Shared filters across all three dashboards, the explorer's metric switch and category click, and a second use of Reset.
- A check of the published workbook in a private browser window, including navigation, readable labels, filters and reset.

If any of these checks have already been completed, I can add the results here.

Before the final save, I will restore Year 2025, Category All, Metric Gross Profit, and all three assumptions to zero.

Published workbook link: to be added.
