DAG_LOG_DIR="logs/decomposed_sqls/test"
MODEL_NAME="gemini-1.5-pro-002"
GENERATION_PROMPT="simple_sql_generation"
REFINEMENT_PROMPT="self_refiner_prompt"
NUM_CANDIDATES=1
MAX_REFINEMENT=1
NUM_WORKERS=1

# Run the Python script
echo "Starting the query generation for DAGs..."
python3 -m src.main \
    --dag_log_dir "$DAG_LOG_DIR" \
    --model_name "$MODEL_NAME" \
    --generation_prompt "$GENERATION_PROMPT" \
    --refinement_prompt "$REFINEMENT_PROMPT" \
    --num_candidates "$NUM_CANDIDATES" \
    --max_refinement "$MAX_REFINEMENT" \
    --num_workers "$NUM_WORKERS"
