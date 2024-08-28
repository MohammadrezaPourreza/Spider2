# Spider 2.0: Can Language Models Resolve Real-World Enterprise Text-to-SQL Workflows?


## 📰 News

- 2024-08-28: We released a smaller version of Spider 2.0 (~ 25% of the full dataset) containing 190 examples to give users early access. The full dataset and the paper will be available in two weeks. Stay tuned! 🤗

## 👋 Overview

Spider 2.0 is a benchmark of real world SQL generation tasks across enterprise-grade databases and diverse realistic scenarios.

![Local Image](./assets/Spider2.png)

[`Spider 2.0`](https://github.com/xlang-ai/Spider2/tree/main/spider2) provides a benchmark dataset tailored for real-world SQL generation, featuring diverse SQL dialects and complex queries that mirror enterprise challenges. It facilitates rigorous testing of text-to-SQL technologies against practical, industry-level scenarios.

[`Spider 2.0-Lite`](https://github.com/xlang-ai/Spider2/tree/main/spider2-lite) covers 90% of examples from Spider 2.0 that are sampled to be more lightweight and standalone, with a focus on evaluating Large Language Models on classic Text-to-SQL.


<!-- ### Why Spider 2.0?
Spider 2.0 addresses the pressing challenges in SQL generation encountered in real industrial settings. Unlike previous benchmarks, Spider 2.0 offers a more realistic and challenging dataset, reflecting the complexity and diversity of real-world database schemas and intricate SQL logic. 

Spider 2.0 includes 600 examples (expected), encompassing diverse SQL generation scenarios derived from enterprise-grade databases across various fields. Additionally, Spider 2.0 introduces project-level SQL generation tasks that mimic real data transformation projects, offering a practical, industry-relevant challenge for researchers. -->


## 🚀 Quickstart


## Spider 2.0 Baselines

For `Spider 2.0`, we proposed an agent framework [`Spider-Agent`](https://github.com/xlang-ai/Spider2/tree/main/spider-agent) baseline with interactive environment, which draws inspiration from the design of [Intercode](https://github.com/princeton-nlp/intercode) and is based on the `React` framework with specialized designs for database-related tasks.

### Performance


| Method                     | Score |
| -------------------------- | ---- |
| Spider-Agent + GPT-4o   | 9.25% |

> We will test more LLMs and Agent Frameworks! 
>
> We also warmly welcome you to evaluate your methods on Spider 2.0.


## Spider 2.0-Lite Baselines

For `Spider 2.0-Lite`, we proposed baselines based on widely used text2sql methods: [`Dail-SQL`](https://github.com/xlang-ai/Spider2/blob/main/spider2-baselines/DailSQL/README.md) and [`CodeS`](https://github.com/xlang-ai/Spider2/tree/main/spider2-baselines/CodeS/README.md), with evaluation results reported :test_tube:.

### Performance Comparison

> **Score [w/ Func & w/ Plan]** represents an oracle setting, utilizing reference plans and gold SQL functions for a set of analytical experiments.


| Method                  | Score   |    Score  [w/ Func & w/ Plan]     |
| -------------------------- | ---- | -------------------------
| DailSQL + GPT-4o |  **6.04% (9/149)** |   12.75% (19/149)        |
| CodeS-7B      | 1.34% (2/149) |   2.01% (3/149)            |


