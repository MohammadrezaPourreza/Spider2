#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEV=spider2-lite
LLM=gpt-4o
eval_suite_dir=$(readlink -f "${script_dir}/../../evaluation_suite")

cd ${eval_suite_dir}
python evaluate.py --mode sql --result_dir ${script_dir}/postprocessed_data/${DEV}_CTX-200/RESULTS_MODEL-${LLM}-SQL-postprocessed | tee ${script_dir}/postprocessed_data/${DEV}_CTX-200/evaluate.log
