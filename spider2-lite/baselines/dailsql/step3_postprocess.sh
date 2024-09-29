#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEV=spider2-lite
LLM=gpt-4o

python postprocessed_data/spider2_postprocess.py --dev $DEV --model $LLM
echo "Postprocessing done."
