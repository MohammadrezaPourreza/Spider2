# Spider 2.0: Evaluating Language Models on Real-World Enterprise Text-to-SQL Workflows


## 📰 News

- 2024-08-28: We released a smaller version of Spider 2.0 (~ 25% of the full dataset) containing 190 examples to give users early access. The full dataset and the paper will be available in two weeks. Stay tuned! 🤗

## 👋 Overview


![Local Image](./assets/Spider2.png)


### Why Spider 2.0?

In 2018, our group proposed [Spider 1.0](https://yale-lily.github.io/spider), which has been widely used in Text-to-SQL research. 

However, real-world enterprise-level Text-to-SQL workflows often involve complex data and require advanced SQL queries across various operations. **We lack a comprehensive testbed to fully evaluate and develop Text-to-SQL capabilities.**

To this end, we introduce Spider 2.0, an evaluation framework comprising 600 real-world text-to-SQL workflow problems derived from enterprise-level database use cases. 

We evaluated Spider 1.0, BIRD, and Spider 2.0 using the popular framework, [Dail-SQL](https://github.com/BeachWang/DAIL-SQL).

|                 | Spider 1.0 dev | Spider 1.0 test | BIRD test | Spider 2.0 |
| --------------- | -------------- | --------------- | --------- | ---------- |
| DailSQL + GPT-4 | 82.4           | 86.6            | 57.4      | 6.0        |
| CodeS-7B        | 85.4           | -               | 59.3      | 1.3        |




## 🚀 Quickstart


### Spider 2.0
For [`Spider 2.0`](https://github.com/xlang-ai/Spider2/tree/main/spider2#spider-20)
, all evaluation examples are in [`evaluation_examples`](https://github.com/xlang-ai/Spider2/tree/main/spider2/evaluation_examples).

- `instance_id`: (str) - A formatted instance identifier, UUID
- `instruction`: (str) - The instruction
- `type`: (str) - [Local, Bigquery, DBT, Snowflake]
- `./evaluation_examples/instanceid/*`: evaluation context


#### Run Spider-Agent

```
git clone https://github.com/xlang-ai/Spider2.git
cd methods/spider-agent

# Optional: Create a Conda environment for Spider 2.0
# conda create -n spider2 python=3.11
# conda activate spider2

# Install required dependencies
pip install -r requirements.txt

export OPENAI_API_KEY=your_openai_api_key
python run.py --model gpt-4o --suffix test1
```



### Spider 2.0-Lite

To meet the needs of the research community, we've also organized the Spider 2.0 data in a format similar to Spider 1.0. [`Spider 2.0-Lite`](https://github.com/xlang-ai/Spider2/tree/main/spider2-lite#spider-20-lite) covers 90% of examples from Spider 2.0 that are sampled to be more lightweight and standalone, with a focus on evaluating LLMs on classic Text-to-SQL.

Each file in `spider2-lite.json` contains the following fields:
- `instance_id`: the unique example id
- `db`: the database id to which this question is addressed
- `question`: the natural language question
- `external_knowledge`: the filenames of external knowledge, documentation, and information required to answer this question are stored in documents
- `plan`: detailed instruction / reference plan for solving this problem
- `special_functions`: special functions that may be needed to answer this question

> **Note that** `plan` and `special_functions` are **not** standard inputs of Spider 2.0 challenge; they are used for ablation experiments and analysis.




We proposed baselines based on the widely used text2sql methods: [`Dail-SQL`](https://github.com/xlang-ai/Spider2/tree/main/spider2-lite/baselines/dailsql#installation) and [`CodeS`](https://github.com/xlang-ai/Spider2/tree/main/spider2-lite/baselines/codes#installation), with evaluation results reported :test_tube:.

#### Run Dail-SQL

Set up the environment and dependencies:

```bash
conda create -n DAIL-SQL python=3.8
cd spider2-lite/baselines/dailsql
pip install -r requirements.txt
python nltk_downloader.py
pip install https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-3.5.0/en_core_web_sm-3.5.0-py3-none-any.whl
```

Simply run :laughing::
```
bash run.sh
```

For a detailed guideline of running Dail-SQL, please refer to [Installation](https://github.com/xlang-ai/Spider2/tree/main/spider2-lite/baselines/dailsql#installation).

# 💫 Contributions


# ✍️ Citation
If you find our work helpful, please use the following citations.
```

```
