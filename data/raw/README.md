## Reproducing the project

To explore the finished project, open the interactive dashboard or
download [the packaged Tableau workbook](dashboard/Retail_Profitability.twbx).

The processed CSV is documented in
[data/processed/README.md](data/processed/README.md).

### Rebuild from the source data

Requirements: DuckDB CLI and the original Contoso CSV files.

1. Download `csv-100k.7z` from the source release linked in
   [data/raw/README.md](data/raw/README.md).
2. Extract the archive and place `sales.csv`, `product.csv` and
   `store.csv` inside `data/raw/`.
3. Open a terminal in the repository's root folder.

Create the output folder and open DuckDB:

```bash
mkdir -p data/processed
duckdb data/retail.duckdb
```

At the DuckDB prompt, run:

```text
.bail on
.read sql/01_load_raw.sql
.read sql/02_stage_sales.sql
.read sql/03_stage_dimensions.sql
.read sql/04_quality_checks.sql
.read sql/05_build_mart.sql
.read sql/06_answer_questions.sql
.read sql/07_export.sql
.quit
```

The quality checks should report zero issues. The export checks should
confirm that the CSV's rows and financial amounts match the USD mart.

Connect Tableau to `data/processed/retail_sales_usd.csv`.