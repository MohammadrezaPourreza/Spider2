# Spider2 Evaluation Suite


## Folder Structure

Please organize your submissions in the following structure:

```
.
├── README.md
├── bigquery_credential.json         # Bigquery
├── evaluate.py                      # main scripts of evaluation 
├── gold                             # gold information of Spider2-SQL (DON'T CHANGE)
│   ├── exec_result                      # Gold execution results
│   ├── sql                              # Gold SQL
│   └── spider2sql_eval.jsonl            # Config file
├── spider2sql_example_submit        # Predicted SQLs
│   ├── bq001.sql
│   ├── bq009.sql
│   └── ...
├── spider2sql_example_submit_result # Not commonly used, unless your method directly executes to obtain results.
│   ├── ga003.csv
│   ├── bq004.sql
│   └── ...
└── temp                             # cache
```


## How to evaluate ?

There are two modes of your submission data, sql or exec_result. You only need to select one, we recommand the `sql` mode.
- sql: Provide the SQL you predicted for each task.
- exec_result: Provide the execution result for each SQL, stored in a CSV file (not commonly used)

```
python evaluate.py --mode sql --result_dir <your pred folder>
```

or

```
python evaluate.py --mode exec_result  --result_dir <your pred folder>
```

We provide two sample submissions, `spider2sql_example_submit` and `spider2sql_example_submit_result`

```
python evaluate.py --mode sql --result_dir spider2sql_example_submit
or
python evaluate.py --mode exec_result --result_dir spider2sql_example_submit_result

```