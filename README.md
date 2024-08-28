# Spider 2.0: Can Language Models Resolve Real-World Enterprise Text-to-SQL Workflows?

![Local Image](./assets/Spider2.png)

## 📰 News

- 2024-08-28: We released a smaller version of Spider 2.0 (approximately 25% of the full dataset) containing 190 examples to give users early access. The full dataset and the paper will be available in two weeks. Stay tuned! 


## 👋 Overview 



## 🚀 Quickstart



## ⚙️ Settings

To meet the diverse research needs, we set up Spider 2.0 with two settings, focusing on advanced Text2SQL and general coding agent tasks, respectively. Most examples in these two **settings** overlap, differing mainly in the settings themselves.

[Spider2](https://github.com/xlang-ai/spider2/tree/main/spider2): **Traditional Text2SQL Setting**. Focusing on Text2SQL, with detailed database metadata.

[Spider2-World](https://github.com/xlang-ai/spider2/tree/main/spider2-world): **Code agent setting**. SQL generation in a real-**world** setting requires automatically exploring complex databases, using Python, SQL, and command-line tools to solve complex SQL generation tasks across different databases and to perform project-level code agent tasks.


## Spider 2.0 Baselines

For `Spider2`, we proposed baselines based on widely used text2sql methods: [`Dail-SQL`](https://github.com/xlang-ai/Spider2/blob/main/spider2-baselines/DailSQL/README.md) and [`CodeS`](https://github.com/xlang-ai/Spider2/tree/main/spider2-baselines/CodeS/README.md), with evaluation results reported :test_tube:.

## Spider 2.0 Leaderboard

> - Spider2 leaderboard is ranked by the **Score**. 
> - The **Score [w/ Func & w/ Plan]** represents an oracle setting, utilizing reference plans and gold SQL functions for a set of analytical experiments.



| Method                  | Score   |    Score  [w/ Func & w/ Plan]     |
| -------------------------- | ---- | -------------------------
| DailSQL + GPT-4o |  **6.04% (9/149)** |   12.75% (19/149)        |
| CodeS-7B      | 1.34% (2/149) |   2.01% (3/149)            |




## Spider2-World Baselines
For `Spider2-World`, we proposed an agent framework [`Spider-Agent`](https://github.com/xlang-ai/Spider2/tree/main/spider-agent) baseline with interactive environment, which draws inspiration from the design of [Intercode](https://github.com/princeton-nlp/intercode) and is based on the `React` framework with specialized designs for database-related tasks.



## Spider2-World Leaderboard

> We will test more LLMs and Agent Frameworks! 
>
> We also warmly welcome you to evaluate your methods on Spider2.

| Method                     | Score |
| -------------------------- | ---- |
| Spider-Agent + GPT-4o   | 9.25% |

