# Spider-Agent

An Agent Method Baseline for Spider2-World based on Docker ENV


## 🚀 Quickstart

### Setup

#### 1. Conda Env
```
# Clone the Spider2 repository
git clone https://github.com/xlang-ai/Spider2.git
pip install -r requirements.txt

# Optional: Create a Conda environment for Spider2
# conda create -n spider2 python=3.11
# conda activate spider2

# Install required dependencies
pip install -r requirements.txt
```
#### 2. Docker

docker: Learn more [here](https://docs.docker.com/get-started/get-docker/) to install. Before running the below code, make sure the Docker daemon/application is running locally.


### Run Spider-Agent

#### Set LLM API Key

```
export AZURE_API_KEY=your_azure_api_key
export AZURE_ENDPOINT=your_azure_endpoint
export OPENAI_API_KEY=your_openai_api_key
export GEMINI_API_KEY=your_genmini_api_key
```

#### Run 


```python
python run.py --suffix <The name of this experiment>
python run.py --model gpt-4o --suffix try1
```



### Evaluation

#### Extract Results

Reorganize run results into a standard submission format, here we store the answer directly into the evaluation suite

```python
python get_spider2c_submission_data.py --experiment_suffix <The name of this experiment> --results_folder_name <Standard Submission Folders>
python get_spider2c_submission_data.py --experiment_suffix gpt-4-try2 --results_folder_name ../Spider2-World/evaluation_suite/gpt-4-try1
```

#### Run Evaluation Scripts

You can run `evaluate.py` in the evaluation suite folder of `Spider2-World` to get the evaluation results.


## Agent Framework

#### Action

- `Bash`: Executes shell commands, such as checking file information, running code, or executing DBT commands.
- `CREATE_FILE`: Creates a new file with specified content.
- `EDIT_FILE`: Edits or overwrites the content of an existing file.
- `BIGQUERY_EXEC_SQL`: Executes a SQL query on BigQuery, with an option to save the results.
- `BQ_GET_TABLES`: Retrieves all table names and schemas from a specified BigQuery dataset.
- `BQ_GET_TABLE_INFO`: Retrieves detailed column information for a specific table in BigQuery.
- `BQ_SAMPLE_ROWS`: Samples a specified number of rows from a BigQuery table and saves them as JSON.
- `Terminate`: Marks the completion of the task, returning the final result or file path.


