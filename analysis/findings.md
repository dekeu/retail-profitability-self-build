# Retail profitability findings

Last updated: 12 October 2026

This analysis uses the fictional Contoso dataset, filtered to **2025 USD transactions and all categories**. One row represents one sales order line. There is no currency conversion.

## Starting point

| Measure | 2025 baseline |
|---|---:|
| Revenue | $12,176,250.37 |
| Cost of goods sold | $5,358,949.04 |
| Gross profit | $6,817,301.33 |
| Gross margin | 56.0% |

Gross profit is revenue minus product costs. Gross margin is total gross profit divided by total revenue. Price, unit-cost and volume assumptions are zero at baseline.

## 1. Computers contributed the most gross profit

Computers generated **$2,460,913.02 in gross profit**, or **36.1% of the total**. It also had the highest revenue, at **$4,363,034.07**.

Because Computers accounts for more than a third of total gross profit, I would start a closer product and cost review there. Its contribution makes changes in that category important to the overall result.

The product-concentration check in section 5 looks at how much of this contribution comes from the ten leading products.

## 2. The highest-margin category had a smaller sales base

Music, Movies and Audio Books had the highest gross margin, at **58.5%**, compared with **56.4%** for Computers. However, its revenue was **$926,515.70** and its gross profit was **$541,952.28**.

Computers contributed much more gross profit despite having a lower margin. This is why I would compare revenue, gross profit and margin together when deciding which category deserves attention. I would also check demand and individual product performance before recommending where to focus growth.

## 3. The benefit of a price increase depends on what happens to volume

With Price at **5%**, Unit cost at **0%** and Volume at **0%**, modelled gross profit is **$7,426,113.85**. That is **$608,812.52**, or about **8.9%**, above baseline. Gross margin rises from **56.0% to 58.1%**.

The additional calculations below keep the 5% price increase and unchanged unit costs, then reduce volume to see how much of the benefit remains.

| Price change | Unit-cost change | Volume change | Modelled gross profit | Change from baseline |
|---:|---:|---:|---:|---:|
| +5% | 0% | 0% | $7,426,113.85 | +$608,812.52 |
| +5% | 0% | −5% | $7,054,808.16 | +$237,506.83 |
| +5% | 0% | −10% | $6,683,502.46 | −$133,798.87 |

With a 5% volume decline, the price increase still improves gross profit, but much of the original gain disappears. With a 10% volume decline, gross profit falls below baseline.

Gross margin remains **58.1%** in these three scenarios because the model scales revenue and COGS by the same volume factor and keeps product mix unchanged. A higher margin can therefore coexist with a lower total gross profit.

Before recommending a price increase, I would want evidence about how customers might respond. The volume control lets me test possible responses; it does not predict them.

## 4. About an 8.20% volume decline would erase the gain

Under the same assumptions, a 5% price increase can absorb a volume decline of approximately **8.20%** before modelled gross profit returns to the original baseline.

The calculation is:

```text
Gross profit after the price increase, before a volume change
= Baseline revenue × 1.05 − Baseline COGS

Break-even volume decline
= 1 − Baseline gross profit / Gross profit after the price increase
```

The resulting decline is multiplied by 100 to express it as a percentage.

This gives a useful point of comparison for a pricing discussion: if the expected volume loss is greater than roughly 8.20%, the model no longer shows a gross-profit benefit. The threshold assumes unchanged unit costs, a uniform price increase and the same product mix. It should not be treated as a prediction of customer behaviour.

## 5. The ten leading Computers products contributed 16.49% of category gross profit

The Computers category had **592 products with sales** in the 2025 selection. Ranking these products by their total gross profit gives the following result:

| Measure | Result |
|---|---:|
| Products with sales in Computers | 592 |
| Total Computers gross profit | $2,460,913.02 |
| Gross profit from the top ten products | $405,685.87 |
| Top ten share of category gross profit | 16.49% |

The remaining products contributed approximately **83.51%** of category gross profit. The leading ten are important, but most of the category's gross profit comes from products outside that group.

I would review the leading products individually, then look across the wider range for products with weak margins or opportunities to improve pricing and costs. This check describes product-level contribution; it does not establish customer or supplier concentration.

## What I would check next

- Compare the pricing scenarios with evidence about customer demand and price sensitivity.
- Review product costs and selling prices within Computers, including products outside the top ten.
- Compare the confirmed SQL price-and-volume scenarios with the What-If Planner in Tableau.
- Update [test_log.md](test_log.md) with the actual observed results and dates.

## Data, assumptions and validation

These results describe fictional sample data. Gross profit excludes operating expenses and taxes. The scenario model applies the same percentage changes across the selected products, keeps product mix unchanged and assumes revenue and COGS change proportionally with volume.

The model does not account for inventory limits, supplier capacity, competitor reactions or differences in price sensitivity between products. The scenario gains are conditional calculations, rather than realised business improvements.

The existing baseline, category figures and zero-volume-change price scenario are recorded in the project's earlier SQL and dashboard checks. The additional price-and-volume scenarios, break-even threshold and top-ten product concentration were independently recalculated from the exported [retail_sales_usd.csv](../data/processed/retail_sales_usd.csv) on 12 October 2026.

The local run of `sql/08_extra_analysis.sql` was confirmed on 12 October 2026 from the terminal output. All three result sets matched the reference calculations: the three pricing scenarios, the approximately 8.20% break-even volume decline, and the Computers top-ten concentration figures.

The corresponding Tableau scenario checks still need their actual results recorded in [test_log.md](test_log.md). The successful SQL run confirms the calculations, rather than the behaviour of the published dashboard controls.

Money values are rounded to cents. Margins and the overall Computers contribution are rounded to one decimal place; the break-even decline and top-ten share are shown to two decimal places. Calculations use full precision before rounding.

Related notes: [scenario_note.md](scenario_note.md), [test_log.md](test_log.md) and [build_log.md](build_log.md).
