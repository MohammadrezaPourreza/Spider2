# Spider 2.0: Can Language Models Resolve Real-World Enterprise Text-to-SQL Workflows?


## 📰 News

- 2024-08-28: We released a smaller version of Spider 2.0 (~ 25% of the full dataset) containing 190 examples to give users early access. The full dataset and the paper will be available in two weeks. Stay tuned! 🤗

## 👋 Overview


![Local Image](./assets/Spider2.png)


### Why Spider 2.0?

In 2018, our group proposed [Spider 1.0](https://yale-lily.github.io/spider), which has been widely used in Text-to-SQL research. 

However, real-world enterprise-level Text-to-SQL workflows often involve complex data and require advanced SQL queries across various operations. **We lack a comprehensive testbed to fully evaluate and develop Text-to-SQL capabilities.**

To this end, we introduce Spider 2.0, an evaluation framework of real-world SQL generation tasks across enterprise-grade databases and diverse realistic scenarios.

We evaluated Spider 1.0, BIRD, and Spider 2.0 using the popular framework, [Dail-SQL](https://github.com/BeachWang/DAIL-SQL).

|                    | Spider 1.0 dev | Spider 1.0 test | BIRD test  | Spider 2.0 |
|--------------------|------------|-------|------------|---------|
| DailSQL + GPT-4    |  82.4      |  86.6 | 57.4  | 6.0        |
| CodeS-7B           | 85.4       |   -    | 59.3  | 1.3        |




## 🚀 Quickstart


### Spider 2.0
For [`Spider 2.0`](https://github.com/xlang-ai/Spider2/tree/main/spider2)
, all evaluation examples are in [`evaluation_examples`](https://github.com/xlang-ai/Spider2/tree/main/spider2/evaluation_examples) 

- `instance_id`: (str) - A formatted instance identifier, UUID.
- `instruction`: (str) - The instruction.
- `type`: (str) - [Local, Bigquery, DBT, Snowflake].
- `./evaluation_examples/instanceid/*`: evaluation context


#### Run Spider-Agent

```
git clone https://github.com/xlang-ai/Spider2.git
cd methods/spider-agent

# Optional: Create a Conda environment for Spider2
# conda create -n spider2 python=3.11
# conda activate spider2

export OPENAI_API_KEY=your_openai_api_key
python run.py --model gpt-4o --suffix test1
```



### Spider 2.0-Lite

Additionally, to meet the needs of the research community, we have also organized the Spider 2.0 data in a format similar to Spider 1.0. [`Spider 2.0-Lite`](https://github.com/xlang-ai/Spider2/tree/main/spider2-lite) covers 90% of examples from Spider 2.0 that are sampled to be more lightweight and standalone, with a focus on evaluating LLMs on classic Text-to-SQL.

Each file in `spider2-lite.json` contains the following fields:
- `instance_id`: the unique example id
- `db`: the database id to which this question is addressed.
- `question`: the natural language question
- `external_knowledge`: The filenames of external knowledge, documentation, and information required to answer this question are stored in documents.
- `plan`: detailed instruction / reference plan for solving this problem
- `special_functions`: Special functions that may be needed to answer this question.

> **Note that** `plan` and `special_functions` are **not** standard inputs of Spider2 challenge; they are used for ablation experiments and analysis.




We proposed baselines based on widely used text2sql methods: [`Dail-SQL`](https://github.com/xlang-ai/Spider2/blob/main/spider2-baselines/DailSQL/README.md) and [`CodeS`](https://github.com/xlang-ai/Spider2/tree/main/spider2-baselines/CodeS/README.md), with evaluation results reported :test_tube:.



# 💫 Contributions


# ✍️ Citation
If you find our work helpful, please use the following citations.
```

```

<!-- 

## Spider 2.0 Performance





#### Performance


| Method                     | Score |
| -------------------------- | ---- |
| Spider-Agent + GPT-4o   | 9.25% |

> We will test more LLMs and Agent Frameworks! 
>
> We also warmly welcome you to evaluate your methods on Spider 2.0.


## Spider 2.0-Lite Baselines

For [`Spider 2.0-Lite`](https://github.com/xlang-ai/Spider2/blob/main/spider2-lite/README.md#spider-20-lite), we proposed baselines based on widely used text2sql methods: [`Dail-SQL`](https://github.com/xlang-ai/Spider2/blob/main/spider2-baselines/DailSQL/README.md) and [`CodeS`](https://github.com/xlang-ai/Spider2/tree/main/spider2-baselines/CodeS/README.md), with evaluation results reported :test_tube:.

### Performance Comparison

> **Score [w/ Func & w/ Plan]** represents an oracle setting, utilizing reference plans and gold SQL functions for a set of analytical experiments.


| Method                  | Score   |    Score  [w/ Func & w/ Plan]     |
| -------------------------- | ---- | -------------------------
| DailSQL + GPT-4o |  **6.04% (9/149)** |   12.75% (19/149)        |
| CodeS-7B      | 1.34% (2/149) |   2.01% (3/149)            |

 -->
