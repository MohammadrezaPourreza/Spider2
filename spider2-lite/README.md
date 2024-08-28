# Spider 2.0-Lite

To meet with research interests in traditional Text2SQL settings, we have released a subset of Spider 2.0 called Spider 2.0-Lite. Spider 2.0-Lite covers 90% of examples from Spider 2.0 that are sampled to be more lightweight and standalone, with a focus on evaluating Large Language Models on SQL generation.


## Folder

```
.
├── README.md
├── bigquery_credential.json
├── databases                   # DB/DB metadata for Spider2 dataset
│   ├── bigquery                # The information of DB on Bigquery
│   │   ├── metadata                 # The details data of each DB, including DB DDL, table, column information, and sample data.
│   │   └── metadata_markdown        # Some human-readable markdown documentation schema 
│   ├── local                   # The DB of the local databases
│   └── snowflake               # The information of DB on Snowflake
├── interface                   # Scripts for interacting with the database.
├── externel_information        # All externel information used for Spider2
│   ├── externel_knowledge      # Knowledge pool of Spider2   
│   ├── bigquery_documents  
│   ├── bigquery_functions         
│   └── bigquery_functions.json 
├── evaluation_suite            # Evaluation Suite for Spider2
│   ├── README.md
│   ├── bigquery_credential.json
│   ├── evaluate.py
│   ├── gold
│   │   ├── exec_result
│   │   ├── spider2sql_eval.jsonl
│   │   └── sql
│   └── spider2sql_example_submit
└── spider2-sql.json            # The standard evaluation examples of Spider2
```



## 🚀 Quickstart
You don't need to download any data. The current version of the database is entirely in the cloud.

If your method doesn't require dynamic interaction with the databases, you can make full use of the data in the [`databases`](https://github.com/xlang-ai/Spider2/tree/main/spider2/databases) and the content in the [`externel_information`](https://github.com/xlang-ai/Spider2/tree/main/spider2/external_information).

If your method requires dynamic interaction with the database, in addition to these, you can use the scripts in the [`interface`](https://github.com/xlang-ai/Spider2/tree/main/spider2/interface) to interact with the cloud database.

In addition, if you want to view the data in more detail, you need to register for a BigQuery account. Here is a [Bigquery Guideline](https://github.com/xlang-ai/Spider2/blob/main/assets/Bigquery_Guideline.md).

If you want to quickly view the database schema in this repository rather than use Bigquery WebUI, you can check [databases/bigquery/metadata_markdown](https://github.com/xlang-ai/Spider2/tree/main/spider2/databases/bigquery/metadata_markdown/).


## Data Content and Format

Each file in `spider2-sql.json` contains the following fields:
- `instance_id`: the unique example id
- `db`: the database id to which this question is addressed.
- `question`: the natural language question
- `external_knowledge`: The filenames of external knowledge, documentation, and information required to answer this question are stored in documents.
- `plan`: detailed instruction / reference plan for solving this problem
- `special_functions`: Special functions that may be needed to answer this question.

> **Note that** `plan` and `special_functions` are **not** standard inputs of Spider2 challenge; they are used for ablation experiments and analysis.

The [`databases`](https://github.com/xlang-ai/Spider2/tree/main/spider2/databases) and the content in [`external_information`](https://github.com/xlang-ai/Spider2/tree/main/spider2/externel_information) are resources you can use when benchmarking methods.



```
{
    "instance_id": "ga010",
    "db": "bigquery-public-data.ga4_obfuscated_sample_ecommerce",
    "question": "Can you give me an overview of our website traffic for December 2020? I'm particularly interested in the channel with the fourth highest number of sessions.",
    "external_knowledge": "ga4_dimensions_and_metrics.md",
    "plan": "1.First, read the document to understand how traffic is divided into 18 channel groups, primarily based on the metrics of source, medium, and campaign.\n2.Extract all visits from the database for December, each visit having a unique user ID and session ID. Retrieve the source, medium, and campaign for each visit.\n3.Based on the classification standards for channel groups in the document, write conditional statements to determine which channel each set of data belongs to, mainly using regular expressions. If the data source (source) contains any of the 4.following: 'badoo', 'facebook', 'fb', 'instagram', 'linkedin', 'pinterest', 'tiktok', 'twitter', or 'whatsapp', and the medium (medium) includes 'cp', 'ppc', or starts with 'paid', then categorize it as 'Paid Social'.\n5.Calculate the number of sessions for each channel based on the channel grouping.\n6.Select the name of the channel ranked fourth as the answer.",
    "special_function": [
        "aggregate-functions/ARRAY_AGG",
        "aggregate-functions/COUNT",
        "aggregate-functions/GROUPING",
        "differentially-private-aggregate-functions/COUNT",
        "string-functions/CONCAT",
        "string-functions/REGEXP_CONTAINS"
    ]
}
```

The gold SQLs are shown in [evaluation_suite/gold/sql](https://github.com/xlang-ai/Spider2/tree/main/spider2/evaluation_suite/gold/sql)



## Evaluation

We create [evaluation suite](https://github.com/xlang-ai/Spider2/tree/main/spider2/evaluation_suite) for Spider2.


