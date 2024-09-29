#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEV=spider2-lite

cd ${script_dir}
python preprocessed_data/spider2_preprocess.py --dev $DEV
echo "Preprocessing done."
