#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEV=spider2-lite

python data_preprocess.py --dev $DEV
echo "Data preprocessing done."
