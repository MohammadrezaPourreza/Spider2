# Spider-Agent

An Agent Method Baseline for Spider2-World based on Docker ENV


## 🚀 Quickstart

### Setup

#### 1. Conda Env
```
# Clone the Spider2 repository
git clone https://github.com/xlang-ai/OSWorld
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
python run.py --suffix gpt-4-try2
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

- `Python`: write code in Python file
- `Bash`: Check the information of files. run some code. run DBT
- `SQL`:
  - `get schema`: get the schema of different kinds of DBs
  - `schema tailoring`: Preliminary screening of schemas related to the problem
  - `sample rows`: sample n rows of this DB
  - `sample specific columns`: View the distinct value in a column
  - `run sql`: Run a SQL query on a specified DB


