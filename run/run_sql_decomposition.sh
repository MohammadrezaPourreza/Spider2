source .env
INPUT_QUERIES_PATH=$SPIDER_PREPROCESSED_DATASET_PATH
MODEL_NAME="gemini-1.5-pro-002"

# Run the Python script
echo "Starting SQL decomposition..."
python3 src/decompose_sqls.py \
    --input_queries_path "$INPUT_QUERIES_PATH" \
    --model_name "$MODEL_NAME" \
    --save_pdfs
