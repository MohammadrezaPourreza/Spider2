#!/bin/bash
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# step1. preprocess
cd ${script_dir}  
python preprocessed_data/spider2_preprocess.py

# step2. run DAIL-SQL
python data_preprocess.py
python generate_question.py --data_type spider2c --split test --tokenizer gpt-3.5-turbo --max_seq_len 4096 --prompt_repr SQL --k_shot 0 --example_type QA --selector_type RANDOM
python ask_llm.py --openai_api_key $OPENAI_API_KEY --model gpt-3.5-turbo --n 1 --question postprocessed_data/SPIDER2C-TEST_SQL_0-SHOT_CTX-200_ANS-4096

# step3. postprocess
python postprocessed_data/spider2_postprocess.py

# step4. evaluate
eval_suite_dir=$(readlink -f "${script_dir}/../evaluation_suite")
cd ${eval_suite_dir}
python evaluate.py --mode sql --result_dir ${script_dir}/postprocessed_data/SPIDER2C-TEST_SQL_0-SHOT_CTX-200_ANS-4096/RESULTS_MODEL-gpt-3.5-turbo-SQL-postprocessed


