# Set up environment variables and paths
INPUT_QUERIES_PATH="data/spider2-snow_preprocessed.json"
MODEL_NAME="gemini-1.5-pro-002"

# Run the Python script
echo "Starting SQL decomposition..."
python3 src/decompose_sqls.py \
    --input_queries_path "$INPUT_QUERIES_PATH" \
    --model_name "$MODEL_NAME" \
    --save_pdfs
