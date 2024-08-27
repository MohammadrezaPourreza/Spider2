# Spider2: Can Language Models Resolve Real-World Enterprise Text-to-SQL Workflows?

![Local Image](./assets/Spider2.png)

## 📢 Updates

- 2024-08-25: We released a subset of Spider2 to allow users early access. The full dataset and the paper will be released in two weeks. Stay tuned! 🤗


## ⚙️ Settings

To meet the diverse research needs, we set up Spider2 with two settings, focusing on Advanced Text2SQL and general coding agent tasks, respectively. Most examples in these two **settings** overlap, differing mainly in the settings themselves.

[Spider2](https://github.com/xlang-ai/spider2/tree/main/spider2): **Traditional Text2SQL Setting**. Focusing on Text2SQL, with detailed database metadata.（Tiny Version: 20%)

[Spider2-World](https://github.com/xlang-ai/spider2/tree/main/spider2-world): **Code agent setting**. SQL generation in a real-**world** setting requires automatically exploring complex databases, using Python, SQL, and command-line tools to solve complex SQL generation tasks across different databases and to perform project-level code agent tasks. （Tiny Version: 10%)


## Spider2 Baselines

For `Spider2`, we proposed baselines based on the widely used method: 
- [`Dail-SQL`](https://github.com/xlang-ai/spider2/blob/main/spider2-baselines/DailSQL/README.md), with evaluation results reported :test_tube:.
- [`CodeS`](https://github.com/xlang-ai/spider2/tree/main/spider2-baselines/CodeS/README.md), the evaluation results will be avaiable soon.


### Dail-SQL

We evaluate two approaches, **Vanilla DailSQL** and **DailSQL+Func+Plan** with GPT-4o:
  
| Method                     | EX   |
| -------------------------- | ---- |
| vanilla DailSQL (GPT-4o)   | 6.04% (9/149) |
| DailSQL+Func+Plan (GPT-4o) | 12.75% (19/149) |


For a detailed guideline of running Dail-SQL and evaluation results, please refer to [Dail-SQL](https://github.com/xlang-ai/spider2/tree/main/spider2-baselines/DailSQL).

### CodeS

We evaluate two approaches with CodeS-7b:

| Method                     | EX   |
| -------------------------- | ---- |
| CodeS-7b   | 1.34% (2/149) |
| CodeS-7b (w/ Func & w/ Plan) | 2.01% (3/149) |

For a detailed guideline of running CodeS and evaluation results, please refer to [CodeS](https://github.com/xlang-ai/spider2/tree/main/spider2-baselines/CodeS).


## Spider2-World Baselines
For `Spider2-World`, we proposed an agent framework [`Spider-Agent`](https://github.com/xlang-ai/spider2/tree/main/spider-agent) baseline with interactive environment. 



## Spider2-World Leaderboard


| Method                     | Score |
| -------------------------- | ---- |
| Spider-Agent (GPT-4o)   | 10.00% |
| CodeAct-Agent (GPT-4o) | 8.00% |  
| Spider-Agent (Gemini) | 4.00% |
| reflexion (Gemini) | 2.00% |
