# Spider2: A Realistic and Challenging Benchmark for SQL Generation

![Local Image](./assets/Spider2_Main.png)


## 📢 Updates

- 2024-09-XX: We released our paper.


## ⚙️ Settings

To facilitate the use and promotion of Spider2 within the community, we have set up Spider2 with two settings, focusing on Advanced Text2SQL and general coding agent tasks, respectively. Most examples in these two settings overlap, differing mainly in the settings themselves.

[Spider2](https://github.com/xlang-ai/Spider2/tree/main/Spider2): **Traditional Text2SQL Setting**. Focusing on Text2SQL, with detailed database metadata and excluding project-level tasks. （Progress: 60%)

[Spider2-World](https://github.com/xlang-ai/Spider2/tree/main/Spider2-World): **Comprehensive code agent setting**. It needs to automatically explore complex database, using Python, SQL, and Command-line to solve complex SQL generation and project-level tasks. (Progress: 20%)


## Baselines

For Spider2, we proposed a baseline based on the widely used method [`Dail-SQL`](https://github.com/xlang-ai/Spider2/tree/main/Spider2-baselines/DailSQL) and [`CodeS`](https://github.com/xlang-ai/Spider2/tree/main/Spider2-baselines/CodeS).

For Spider2-World, we proposed an agent framework [`Spider-Agent`](https://github.com/xlang-ai/Spider2/tree/main/Spider-Agent) baseline with interactive environment. 




