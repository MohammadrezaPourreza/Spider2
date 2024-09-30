#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEV=_spider2-lite
LLM=gemini-1.5-pro

python ask_llm.py --model $LLM --question postprocessed_data/${DEV}_CTX-200 | tee ${script_dir}/postprocessed_data/${DEV}_CTX-200/ask_llm.log
echo "Ask LLM done."
