# What-If Scenario Analysis

## Why I Built This Model

Historical data tells us what happened, but it does not directly show what could happen if business conditions changed.

I built this what-if model to explore how changes in selling price, unit cost, and sales volume could affect revenue, cost of goods sold, gross profit, and gross margin.

The model is intended to support business discussions and scenario planning. It is not a sales forecast and does not predict how customers will respond to a price change.

## How the Model Works

The model starts with the historical results selected in the dashboard.

The baseline calculations are:

* Revenue = Quantity × Selling Price
* COGS = Quantity × Unit Cost
* Gross Profit = Revenue − COGS
* Gross Margin = Gross Profit ÷ Revenue

Each scenario input affects a different part of the calculation:

* Price Change affects revenue.
* Unit Cost Change affects COGS.
* Volume Change affects both revenue and COGS.

The scenario calculations are:

* Scenario Revenue = Baseline Revenue × (1 + Price Change % ÷ 100) × (1 + Volume Change % ÷ 100)
* Scenario COGS = Baseline COGS × (1 + Unit Cost Change % ÷ 100) × (1 + Volume Change % ÷ 100)
* Scenario Gross Profit = Scenario Revenue − Scenario COGS
* Gross Profit Change = Scenario Gross Profit − Baseline Gross Profit

For example, an input of `5` represents an increase of 5%, while `-5` represents a decrease of 5%.

## Simple Worked Example

To check the model, I used a simple baseline:

* Quantity: 10 units
* Selling price: $20 per unit
* Unit cost: $12 per unit

The baseline result is:

* Revenue = 10 × $20 = $200
* COGS = 10 × $12 = $120
* Gross Profit = $200 − $120 = $80

I then tested the following scenario:

* Selling price increases by 5%
* Unit cost increases by 3%
* Sales volume decreases by 5%

The scenario result is:

* Scenario Revenue = $200 × 1.05 × 0.95 = $199.50
* Scenario COGS = $120 × 1.03 × 0.95 = $117.42
* Scenario Gross Profit = $199.50 − $117.42 = $82.08
* Gross Profit Change = $82.08 − $80 = +$2.08

## What the Result Means

In this example, revenue decreases slightly because the 5% decrease in volume offsets the increase in selling price.

However, COGS decreases by more than revenue. As a result, gross profit increases from $80.00 to $82.08.

This example shows why price, cost, and volume should be calculated separately. Simply adding the three percentage changes together would not produce the correct result.

## Assumptions

To keep the model understandable and manageable, I used the following assumptions:

* The same percentage changes apply to all products included in the current dashboard selection.
* The overall product mix remains unchanged.
* Revenue and COGS change proportionally with sales volume.
* Fractional volume is acceptable because the model works at an aggregated level.
* Historical revenue and cost values are used as the starting point.

## Limitations

This model is a simplified business-planning tool.

It does not account for:

* Changes in customer demand caused by price adjustments
* Operating expenses
* Taxes
* Inventory availability
* Supplier capacity
* Competitor reactions
* Differences in price sensitivity between products

The model shows possible changes in gross profit, not net profit. Its results should therefore be treated as scenarios for discussion rather than guaranteed business outcomes.
