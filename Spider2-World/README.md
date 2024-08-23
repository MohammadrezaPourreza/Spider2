# Spider2-C

Spider2-C is a code generation dataset centered on SQL generation, which integrates SQL, Python, and Command Line.

There are many project-level SQL generation tasks here, requiring the completion of a **DBT data transformation project**.

And for query related examples, many examples in Spider2-C share the same core SQL as those in Spider2-Text2SQL, but to make it a more realistic setting, we have applied the following modifications, added some resources for each SQL generation project.

#### Resource 1: Database Access
We don't provide complete detailed schema file like Spider2-Text2SQL and other previous works. Instead,
  - Only given the cloud DB interface / the local DB, need the method to explore DBs automatically
  - Given some partial schema with different types (Markdown, IMG, PDF, YAML, Create.sql, JSON). **A real SQL DB System can handle different schema types**
  - Can't access DB any (must combine with resource 3 in this case)

#### Resource 2: Retrieving external documents
Spider2SQL specifies the exact documents and functions needed for each example and processes them in advance. In contrast, Spider2C provides a realistic set of documents that require retrieval and selection.
- **Document Types**
  - SQL Dialect Documents about syntax / functions 
  - Background knowledge Documents
  - Database Introduction Documents

#### Resource 3: Demonstration Exemplars
- **Content Types**
  - Query Histories (Infer potential schema)
  - Question-SQL Pairs  (Few-shot examples)
  - Data-Answer Examples   (Used to check whether SQL execution is correct potentially)
  - Requirements Documents: Described in YAML files / Other answer columns description files
  - Partial finished Code


## Data content and format

All evaluation examples are in [`evaluation_examples`](https://github.com/xlang-ai/Spider2/tree/main/Spider2-C/evaluation_examples) 


- `instance_id`: (str) - A formatted instance identifier, UUID.
- `instruction`: (str) - The question body.
- `type`: (str) - [Local, Bigquery, DBT].
- `derived_from`: (str) - [ga001 / bq003 / local027 ...]

```
{
    "instance_id": "9863d716-0af4-422a-9bfd-65ff5684eca1", 
    "instruction": "I cannot access the database, please help me complete the SQL. I want to figure out the average difference in pageviews between users who bought something and those who didn\u2019t in December 2020.", 
    "type": "Bigquery", 
    "derived_from": "ga004"
}
```


## Evaluation

We create [evaluation suite](https://github.com/xlang-ai/Spider2/tree/main/Spider2-C/evaluation_suite) for Spider2-C.





