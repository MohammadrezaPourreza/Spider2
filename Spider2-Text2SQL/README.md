# Spider2-Text2SQL

Spider2-Text2SQL is a realistic and challenging Text-to-SQL dataset, significantly more difficult and closer to real-world scenarios than any previous Text2SQL benchmarks.
- Enterprise and industrial grade databases covering various fields with super complex schema. Each database has many tables, each table has many columns.
- Various types of databases, ranging from local DBs (SQLite, DuckDB, Postgres) to large cloud DBs(Bigquery,Snowflake).
- Extremely realistic and complex SQL generation tasks, collected and rewrited from real websites, forums, and tutorials.
- Writing advanced and real-world industrial SQL. Beyond extensive use of SELECT, WHERE, and JOIN operations, it also requires incorporating various external knowledge, SQL dialects, special functions, and more.


## Folder

```
.
├── README.md
├── bigquery_credential.json
├── databases                   # DB/DB metadata for Spider2 dataset
│   ├── bigquery                # The information of DB on Bigquery
│   │   ├── metadata                 # The details data of each DB, including DB DDL, table, column information, and sample data.
│   │   └── metadata_markdown        # Some human-readable Schema markdown documentation
│   ├── local                   # The DB of the local databases
│   └── snowflake               # The information of DB on Snowflake
├── interface                   # Scripts for interacting with the database.
├── externel_information        # All externel information used for Spider2-Text2SQL
│   ├── externel_knowledge          
│   ├── bigquery_grammar          
│   └── bigquery_functions 
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

If your method doesn't require dynamic interaction with the databases, you can make full use of the data in the [`databases`](https://github.com/xlang-ai/Spider2/tree/main/Spider2-Text2SQL/databases) and the content in the [`externel_information`](https://github.com/xlang-ai/Spider2/tree/main/Spider2-Text2SQL/externel_information).

If your method requires dynamic interaction with the database, in addition to these, you can use the scripts in the [`interface`](https://github.com/xlang-ai/Spider2/tree/main/Spider2-Text2SQL/interface) to interact with the cloud database.

In addition, if you want to view the data in more detail, you need to register for a BigQuery account. Here is a [Bigquery Guideline]().

If you want to quickly view the database schema in this repository rather than use Bigquery WebUI, you can check [databases/bigquery/metadata_markdown](https://github.com/xlang-ai/Spider2/Spider2-Text2SQL/databases/bigquery/metadata_markdown).


## Data Content and Format

Each file in `spider2-sql.json` contains the following fields:
- `instance_id`: the unique example id
- `db`: the database id to which this question is addressed.
- `question`: the natural language question
- `external_knowledge`(Not required): The filenames of external knowledge, documentation, and information required to answer this question are stored in documents.
- `special_functions`(Not required): Special functions that may be needed to answer this question.
- `database_tutorial`(Not required): For difficult databases, we provide some introductions to SQL-related knowledge in databases.

```
{
    "instance_id": "ga010",
    "db": "bigquery-public-data.ga4_obfuscated_sample_ecommerce",
    "question": "Can you give me an overview of our website traffic for December 2020? I'm particularly interested in the channel with the fourth highest number of sessions.",
    "external_knowledge": "ga4_dimensions_and_metrics.md",
    "special_functions": ["unnest_operator","array_agg","regexp_contains"],
    "database_tutorial": "ga4_tutorial.txt"
}
```

The gold SQLs are shown in [evaluation_suite/gold/sql](https://github.com/xlang-ai/Spider2/tree/main/Spider2-Text2SQL/evaluation_suite/gold/sql)



## Evaluation

We create [evaluation suite](https://github.com/xlang-ai/Spider2/tree/main/Spider2-Text2SQL/evaluation_suite) for Spider2-Text2SQL.

