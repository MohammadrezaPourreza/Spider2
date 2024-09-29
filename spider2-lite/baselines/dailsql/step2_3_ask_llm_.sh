#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEV=spider2-lite
LLM=gpt-4o

python ask_llm.py --openai_api_key $OPENAI_API_KEY --model $LLM --n 1 --question postprocessed_data/${DEV}_CTX-200 | tee ${script_dir}/postprocessed_data/${DEV}_CTX-200/ask_llm.log
echo "Ask LLM done."
