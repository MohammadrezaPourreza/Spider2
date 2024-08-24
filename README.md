# Spider2: A Realistic and Challenging Benchmark for SQL Generation

## 📢 Updates

- 2024-08-25: We released a subset of Spider2 to allow users early access. The full dataset and the paper will be released in two weeks. Stay tuned! 🤗


## ⚙️ Settings

To meet the diverse research needs, we set up Spider2 with two settings, focusing on Advanced Text2SQL and general coding agent tasks, respectively. Most examples in these two settings overlap, differing mainly in the settings themselves.

[Spider2](https://github.com/xlang-ai/Spider2/tree/main/Spider2): **Traditional Text2SQL Setting**. Focusing on Text2SQL, with detailed database metadata.（Progress: 20%)

[Spider2-World](https://github.com/xlang-ai/Spider2/tree/main/Spider2-World): **Code agent setting**. SQL generation in a real-**world** setting requires automatically exploring complex databases, using Python, SQL, and command-line tools to solve complex SQL generation tasks across different databases and to perform project-level code agent tasks. (Progress: 10%)


## Baselines

For `Spider2`, we proposed baselines based on the widely used method: 
- [`Dail-SQL`](https://github.com/xlang-ai/Spider2/blob/main/Spider2-baselines/DailSQL/README.md), with evaluation results reported :test_tube:.
- [`CodeS`](https://github.com/xlang-ai/Spider2/tree/main/Spider2-baselines/CodeS/README.md), the evaluation results will be avaiable soon.

For `Spider2-World`, we proposed an agent framework [`Spider-Agent`](https://github.com/xlang-ai/Spider2/tree/main/Spider-Agent) baseline with interactive environment. 




### Dail-SQL

#### 1. Installation 

The following installation guidance is derived from [Dail-SQL](https://github.com/BeachWang/DAIL-SQL).

Set up the Python environment:
```
conda create -n DAIL-SQL python=3.8
conda activate DAIL-SQL
cd Spider2-C/Spider2-SQL/DailSQL
pip install -r requirements.txt
python nltk_downloader.py
```


In addition, download the model for spacy:
```
pip install https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-3.5.0/en_core_web_sm-3.5.0-py3-none-any.whl
```

#### 2. Running

Export your OpenAI API key:
```
export OPENAI_API_KEY=YOUR_OPENAI_API_KEY
```

Replace the VPN launch approach below with your own method, to gain access to OpenAI and Google BigQuery:
```
export https_proxy=http://127.0.0.1:15777 http_proxy=http://127.0.0.1:15777
```

Finally, simply run :laughing::
```
bash run.sh
```
this script automatically conducts all procedures: 1) converting spider2-SQL data into a format compatible with DailSQL, 2) executing Dail-SQL, 3) evaluation. You can find the output SQL in `Spider2-SQL/DailSQL/postprocessed_data`.

#### 3. Evaluation of Dail-SQL

We evaluate two approaches:
- **Vanilla DailSQL**: This method utilizes the Code Representation (CR) prompt from the original DailSQL paper. To accommodate the complexity of the Spider2 dataset, we enhance the prompt by **incorporating column descriptions, sampled rows, and external knowledge**.
- **DailSQL+Func+Plan**: Building on Vanilla DailSQL, this approach augments the prompt with descriptions of 1) **potentially relevant SQL functions** and 2) a **plan** that assists in generating the components of a complete SQL query.
  
Given the large number of tables and columns in the Spider2 dataset, we leverage **GPT-4o** with a 128k context window to prevent prompt size limitations. The performance of the two methods is shown as:

| Method                     | EX   | Correct Queries                       |
| -------------------------- | ---- | ------------------------------------- |
| vanilla DailSQL (GPT-4o)   | 1.79% | bq019_2, bq329                   |
| DailSQL+Func+Plan (GPT-4o) | 4.46% | bq006, bq076, bq123, bq329, bq339 |

### CodeS

For a detailed guideline of using CodeS, please refer to [README of CodeS](https://github.com/xlang-ai/Spider2/tree/main/Spider2-baselines/CodeS).


## Spider2-World Baselines
For `Spider2-World`, we proposed an agent framework [`Spider-Agent`](https://github.com/xlang-ai/Spider2/tree/main/Spider-Agent) baseline with interactive environment. 




