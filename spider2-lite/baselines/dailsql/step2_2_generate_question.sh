#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEV=spider2-lite
LLM=gpt-4o

schema_type=full
golden_schema_path=/Users/stalaei/Desktop/Text2SQL/Spider2/spider2-lite/baselines/dailsql/schemas.json
fpr_noise=0.0

python generate_question.py --dev $DEV --model $LLM --tokenizer $LLM --prompt_repr SQL --k_shot 0 \
    --schema_type $schema_type --golden_schema_path $golden_schema_path --fpr_noise $fpr_noise
echo "Question generation done."
