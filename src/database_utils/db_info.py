import json
import os
import dotenv

dotenv.load_dotenv(override=True)

# Load the preprocessed dictionary as a global variable
SPIDER_PREPROCESSED_DATASET_DICT_PATH = os.environ.get("SPIDER_PREPROCESSED_DATASET_DICT_PATH")
spider_preprocessed_data = json.load(open(SPIDER_PREPROCESSED_DATASET_DICT_PATH, 'r', encoding='utf-8'))

def get_preprocessed_data(instance_id: str) -> dict:
    """
    Retrieve the preprocessed data for a given instance ID.
    
    Args:
        instance_id (str): The ID of the instance to retrieve
        
    Returns:
        dict: The preprocessed data dictionary for the instance, or None if not found
    """
   
    return spider_preprocessed_data.get(instance_id, None)
