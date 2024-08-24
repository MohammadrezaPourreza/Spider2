# Spider2-World

Spider2-World is a code generation dataset centered on SQL generation, which integrates SQL, Python, and Command Line.

#### Query-level Task
The most distinctive feature of Spider2-World is that it doesn't provide predefined schema information; you need to explore the database on your own and interactively write SQL. (Somewhat similar to the setting in [`Intercode`](https://github.com/princeton-nlp/intercode))

#### Project-level Task
We propose examples based on the **DBT project**, which is a highly realistic SQL generation scenario commonly used in industry development, requires completing a complex data transformation task. (Somewhat similar to the setting in [`SWE-Bench`](https://www.swebench.com/).



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

We create [evaluation suite](https://github.com/xlang-ai/Spider2/tree/main/Spider2-World/evaluation_suite) for Spider2-World.





