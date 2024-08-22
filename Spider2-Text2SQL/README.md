# Spider2-Text2SQL

Spider2-Text2SQL is a realistic and challenging Text-to-SQL dataset, significantly more difficult and closer to real-world scenarios than any previous Text2SQL benchmarks.
- Enterprise and industrial grade databases covering various fields with super complex schema. Each database has many tables, each table has many columns.
- Various types of databases, ranging from local DBs (SQLite, DuckDB, Postgres) to large cloud DBs(Bigquery,Snowflake).
- Extremely realistic and complex SQL generation tasks, collected and rewrited from real websites, forums, and tutorials.
- Writing advanced and real-world industrial SQL. Beyond extensive use of SELECT, WHERE, and JOIN operations, it also requires incorporating various external knowledge, SQL dialects, special functions, and more.


## Structure

```
.
├── README.md
├── bigquery_credential.json
├── databases                   # DB/DB metadata for Spider2 dataset
│   ├── bigquery                # The information of DB on Bigquery
│   │   ├── metadata               # The details data of each DB, including DB DDL, table, column information, and sample data.
│   │   └── metadata_markdown      # Some human-readable Schema markdown documentation
│   ├── local                   # The DB of the local databases
│   └── snowflake               # The information of DB on Snowflake
├── interface                   # Scripts for interacting with the database.
├── evaluation_suite            # Evaluation Suite for Spider2-Text2SQL
│   ├── README.md
│   ├── bigquery_credential.json
│   ├── evaluate.py
│   ├── gold
│   │   ├── exec_result
│   │   ├── spider2sql_eval.jsonl
│   │   └── sql
│   └── spider2sql_example_submit
└── spider2sql.json            # The standard evaluation examples of Spider2-Text2SQL
```



## 🚀 Quickstart
You don't need to download any data. The current version of the database is entirely in the cloud.
For Spider2-Text2SQL, 


## Data Content and Format