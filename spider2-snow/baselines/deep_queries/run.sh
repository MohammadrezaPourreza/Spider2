#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DEV=spider2-snow
# DEV=toy
LLM=gemini-1.5-pro-002

# step1. preprocess
cd ${script_dir}  
python preprocessed_data/spider2_preprocess.py --dev $DEV

# python 