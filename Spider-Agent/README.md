# Spider-Agent

An Agent Method Baseline for Spider2-C based on Docker ENV


## 🚀 Quickstart

#### Setup
```
pip install -r requirements.txt
```

#### Run Spider-Agent
```python
python run.py --suffix <The name of this experiment>
python run.py --suffix gpt-4-try2
```

#### Extract Results

Reorganize run results into a standard submission format, here we store the answer directly into the evaluation suite

```python
python get_spider2c_submission_data.py --experiment_suffix <The name of this experiment> --results_folder_name <Standard Submission Folders>
python get_spider2c_submission_data.py --experiment_suffix gpt-4-try2 --results_folder_name ../Spider2-C/evaluation_suite/gpt-4-try1
```

#### Evaluation

You can run `evaluate.py` in the evaluation suite folder of `Spider2-C` to get the evaluation results.

## Agent Framework

#### Action

- `Python`: 
- `Bash`: Check the information of files. run some code. run DBT
- `SQL query`:
  - `get schema`: 
  - `schema tailoring`
  - `sample rows`
  - `sample specific columns`
  - `run sql`


