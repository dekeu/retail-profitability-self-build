# Raw source data

This project uses SQLBI's fictional Contoso dataset.

[Download the source archive](https://github.com/sql-bi/Contoso-Data-Generator-V2-Data/releases/tag/ready-to-use-data)

Archive used: `csv-100k.7z`.

The SQL scripts require these files inside `data/raw/`:

- `sales.csv`
- `product.csv`
- `store.csv`

The original source files are kept unchanged locally. They are not
included in this repository.

The processed USD dataset is available in
[../processed/](../processed/), with its fields described in
[the processed-data README](../processed/README.md).

For the commands to rebuild the project, see
[the main README](../../README.md#reproducing-the-project).