# Spider 2.0


Spider 2.0, an evaluation framework with 600 real-world text-to-SQL tasks from enterprise databases. 
These databases, often with over 1,000 columns, come from cloud or local systems like BigQuery, Snowflake, and PostgreSQL.

Solving these tasks requires models to understand database metadata, dialects, and project code, navigating complex SQL environments and handling long contexts. The models must perform advanced reasoning and generate diverse SQL queries, sometimes over 100 lines, surpassing traditional text-to-SQL challenges.


## Data content and format

For [`Spider 2.0`](./README.md), all evaluation examples are aggregated in file [`spider2.jsonl`](./evaluation_examples/spider2.jsonl), where each data point contains the following field:
```json
{
    "instance_id": "3a348be1-aed2-44fb-8185-c66c9d14a6ef",
    "instruction": "Please tell me the number of sessions for each website traffic channel in December 2020.",
    "type": "Bigquery"
}
```

For each instance, we also provide a separate folder [`./evaluation_examples/{instruction_id}`](./evaluation_examples/) as its **Execution Contetxt** to simulate the agentic setting. Each folder may have the following files:

- `README.md`: detailed requirements of the `instruction` field for the current example with `instance_id`;
- `*_credential.json`: credential file connecting to realistic enterprise-level databases, e.g., BigQuery. Can be replaced with your OWN;
- `result.csv`: CSV file to store the execution results;
- other instance-specific materials which assist in finishing the current task:
    - 🏗️ partial project, e.g., [`dbt_project/`](./evaluation_examples/43d5ad49-0f99-4b90-a6df-d3afc5c216ff/).
    - 🎞️ query history or samples, e.g., [`QUERY_HISTORY/`](./evaluation_examples/1d009ac3-1c75-447b-a7e0-49ccc2b5fbf9/FIREBASE_QUERY_HISTORY/), [`BASIC_SQLS/`](./evaluation_examples/e4a35097-4ff3-4ca7-8304-f593e039735b/BASIC_SQLS), etc.
    - 📝 reference documentation: [`ga4_dimensions_and_metrics.md`](./evaluation_examples/3a348be1-aed2-44fb-8185-c66c9d14a6ef/ga4_dimensions_and_metrics.md), [`retention_rate.md`](./evaluation_examples/22faca18-f766-46f5-a22b-c79de56fb6ec/retention_rate.md), etc.
    - 🔍 query interface: We have predefined how to access the diverse database systems.


## Baseline

We proposed an agent framework [`Spider-Agent`](../methods/spider-agent) baseline with interactive environment.



## Evaluation

We create [evaluation suite](./evaluation_suite) for Spider 2.0.


#### Evaluation Results


| Method                | Score  |
| --------------------- | ------ |
| Spider-Agent + GPT-4o | 9.25%  |