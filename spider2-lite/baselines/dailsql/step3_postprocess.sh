#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEV=spider2-lite
LLM=gemini-1.5-pro

python postprocessed_data/spider2_postprocess.py --dev $DEV --model $LLM
echo "Postprocessing done."
