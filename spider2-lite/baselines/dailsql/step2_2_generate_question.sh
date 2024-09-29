#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEV=spider2-lite
LLM=gpt-4o

python generate_question.py --dev $DEV --model $LLM --tokenizer $LLM --prompt_repr SQL --k_shot 0
echo "Question generation done."
