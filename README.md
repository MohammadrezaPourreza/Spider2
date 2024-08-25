# Spider2: A Realistic and Challenging Benchmark for SQL Generation

![Local Image](./assets/Spider2.png)

## 📢 Updates

- 2024-08-25: We released a subset of Spider2 to allow users early access. The full dataset and the paper will be released in two weeks. Stay tuned! 🤗


## ⚙️ Settings

To meet the diverse research needs, we set up Spider2 with two settings, focusing on Advanced Text2SQL and general coding agent tasks, respectively. Most examples in these two settings overlap, differing mainly in the settings themselves.

[Spider2](https://github.com/xlang-ai/Spider2/tree/main/Spider2): **Traditional Text2SQL Setting**. Focusing on Text2SQL, with detailed database metadata.（Tiny Version: 20%)

[Spider2-World](https://github.com/xlang-ai/Spider2/tree/main/Spider2-World): **Code agent setting**. SQL generation in a real-**world** setting requires automatically exploring complex databases, using Python, SQL, and command-line tools to solve complex SQL generation tasks across different databases and to perform project-level code agent tasks. （Tiny Version: 10%)


## Spider2 Baselines

For `Spider2`, we proposed baselines based on the widely used method: 
- [`Dail-SQL`](https://github.com/xlang-ai/Spider2/blob/main/Spider2-baselines/DailSQL/README.md), with evaluation results reported :test_tube:.
- [`CodeS`](https://github.com/xlang-ai/Spider2/tree/main/Spider2-baselines/CodeS/README.md), the evaluation results will be avaiable soon.


### Dail-SQL

For a detailed guideline of running Dail-SQL, please refer to [README of Dail-SQL](https://github.com/xlang-ai/Spider2/tree/main/Spider2-baselines/DailSQL).

#### Evaluation Results of Dail-SQL

We evaluate two approaches:
- **Vanilla DailSQL**: This method utilizes the Code Representation (CR) prompt from the original DailSQL paper. To accommodate the complexity of the Spider2 dataset, we enhance the prompt by **incorporating column descriptions, sampled rows, and external knowledge**.
- **DailSQL+Func+Plan**: Building on Vanilla DailSQL, this approach augments the prompt with descriptions of 
- 1) **potentially relevant SQL functions** 
- 2) **reference plan** that assists in generating the components of a complete SQL query.
  
Given the large number of tables and columns in the Spider2 dataset, we leverage **GPT-4o** with a 128k context window to prevent prompt size limitations. The performance of the two methods is shown as:

| Method                     | EX   | Correct Queries                       |
| -------------------------- | ---- | ------------------------------------- |
| vanilla DailSQL (GPT-4o)   | 1.79% | bq019_2, bq329                   |
| DailSQL+Func+Plan (GPT-4o) | 4.46% | bq006, bq076, bq123, bq329, bq339 |

### CodeS

For a detailed guideline of running CodeS, please refer to [README of CodeS](https://github.com/xlang-ai/Spider2/tree/main/Spider2-baselines/CodeS).


## Spider2-World Baselines
For `Spider2-World`, we proposed an agent framework [`Spider-Agent`](https://github.com/xlang-ai/Spider2/tree/main/Spider-Agent) baseline with interactive environment. 



#### Evaluation Results


| Method                     | Score |
| -------------------------- | ---- | 
| Spider-Agent (GPT-4o)   | 6.00% | 
| Spider-Agent (Gemini) | 4.00% |
| CodeAct-Agent (GPT-4o) | 2.00% |
