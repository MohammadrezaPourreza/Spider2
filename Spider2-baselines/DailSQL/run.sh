#!/bin/bash
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DEV=toy

LLM=gpt-3.5-turbo

# step1. preprocess
cd ${script_dir}  
python preprocessed_data/spider2_preprocess.py --dev $DEV

# step2. run DAIL-SQL
python data_preprocess.py --dev $DEV
python generate_question.py --dev $DEV --tokenizer $LLM --max_seq_len 4096 --prompt_repr SQL --k_shot 0 --example_type QA --selector_type RANDOM
python ask_llm.py --openai_api_key $OPENAI_API_KEY --model $LLM --n 1 --question postprocessed_data/${DEV}_SQL_0-SHOT_CTX-200_ANS-4096

# step3. postprocess
python postprocessed_data/spider2_postprocess.py --dev $DEV --model $LLM

# step4. evaluate
eval_suite_dir=$(readlink -f "${script_dir}/../../Spider2/evaluation_suite")
cd ${eval_suite_dir}
python evaluate.py --mode sql --result_dir ${script_dir}/postprocessed_data/${DEV}_SQL_0-SHOT_CTX-200_ANS-4096/RESULTS_MODEL-${LLM}-SQL-postprocessed


