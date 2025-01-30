import os
import sys
from typing import Dict, Any
import copy
import time
import threading
from concurrent.futures import ThreadPoolExecutor, TimeoutError as FuturesTimeoutError, as_completed

from dotenv import load_dotenv
from langchain_together import ChatTogether
from langchain_openai import ChatOpenAI
from langchain_google_vertexai import VertexAI
from langchain_openai import ChatOpenAI
from langchain_google_vertexai.model_garden import ChatAnthropicVertex
from langchain_google_vertexai import VertexAI
from google.oauth2 import service_account
from google.cloud import aiplatform
from typing import Dict, Any
import vertexai
import os
import os.path as osp
from langchain_google_vertexai import HarmBlockThreshold, HarmCategory

# Load environment variables
load_dotenv(override=True)

proj_dir = osp.dirname(osp.abspath(__file__))

safety_settings = {
    HarmCategory.HARM_CATEGORY_UNSPECIFIED: HarmBlockThreshold.BLOCK_NONE,
    HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT: HarmBlockThreshold.BLOCK_NONE,
    HarmCategory.HARM_CATEGORY_HATE_SPEECH: HarmBlockThreshold.BLOCK_NONE,
    HarmCategory.HARM_CATEGORY_HARASSMENT: HarmBlockThreshold.BLOCK_NONE,
    HarmCategory.HARM_CATEGORY_SEXUALLY_EXPLICIT: HarmBlockThreshold.BLOCK_NONE,
}


SCOPES = ["https://www.googleapis.com/auth/cloud-platform"]
GCP_PROJECT = os.getenv('GCP_PROJECT')
GCP_REGION = os.getenv('GCP_REGION')
GCP_CREDENTIALS = os.getenv("GCP_CREDENTIALS")

# print(f"GCP_PROJECT: {GCP_PROJECT}, GCP_REGION: {GCP_REGION}")




aiplatform.init(
  project=GCP_PROJECT,
  location=GCP_REGION,
  credentials=service_account.Credentials.from_service_account_file(GCP_CREDENTIALS, scopes=SCOPES),
)
vertexai.init(project=GCP_PROJECT, location=GCP_REGION, credentials=service_account.Credentials.from_service_account_file(GCP_CREDENTIALS, scopes=SCOPES))


engine_configs = {
    "gpt-4": {
        "constructor": ChatOpenAI,
        "params": {"model": "gpt-4", "temperature": 0}
    },
    "gpt-o1": {
        "constructor": ChatOpenAI,
        "params": {"model": "o1", "temperature": 0}
    },
    "gpt-o1-mini": {
        "constructor": ChatOpenAI,
        "params": {"model": "o1-mini"}
    },
    "gpt-3.5-turbo": {
        "constructor": ChatOpenAI,
        "params": {"model": "gpt-3.5-turbo", "temperature": 0}
    },
    "gpt-4o-mini-2024-07-18": {
        "constructor": ChatOpenAI,
        "params": {"model": "gpt-4o-mini-2024-07-18", "temperature": 0}
    },
    "gpt-3.5-turbo-0125": {
        "constructor": ChatOpenAI,
        "params": {"model": "gpt-3.5-turbo-0125", "temperature": 0}
    },
    "gpt-4o": {
        "constructor": ChatOpenAI,
        "params": {"model": "gpt-4o", "temperature": 0}
    },
    "Llama-3-8B-Instruct-Turbo": {
        "constructor": ChatTogether,
        "params": {"model": "meta-llama/Meta-Llama-3-8B-Instruct-Turbo", "temperature": 0}
    },
    "Llama-3-70B-Instruct-Turbo": {
        "constructor": ChatTogether,
        "params": {"model": "meta-llama/Meta-Llama-3-70B-Instruct-Turbo", "temperature": 0}
    },
    "gemini-1.5-pro": {
        "constructor": VertexAI,
        "params": {"model": "gemini-1.5-pro", "temperature": 0, "safety_settings": safety_settings}
    },
    "gemini-1.5-pro-002": {
        "constructor": VertexAI,
        "params": {"model": "gemini-1.5-pro-002", "temperature": 0, "safety_settings": safety_settings}
    },
    "gemini-2.0-flash-exp":{
        "constructor": VertexAI,
        "params": {"model": "gemini-2.0-flash-exp", "temperature": 0, "safety_settings": safety_settings}
    },
    "gemini-1.5-flash":{
        "constructor": VertexAI,
        "params": {"model": "gemini-1.5-flash", "temperature": 0, "safety_settings": safety_settings}
    },
    "claude-3-5-sonnet": {
        "constructor": ChatAnthropicVertex,
        "params": {
            "model": "claude-3-5-sonnet-v2@20241022", 
            "temperature": 0, 
            "location": "europe-west1", 
            "project": "sercan-v1", 
            "credentials": service_account.Credentials.from_service_account_file(GCP_CREDENTIALS, scopes=SCOPES)
        }
    }
}

def get_engine(model_name: str, **kwargs):
    """
    Creates and returns a language model engine based on the specified model name.

    Args:
        model_name (str): Name of the model to initialize
        **kwargs: Additional keyword arguments to pass to the model constructor

    Returns:
        LangChain chat model instance configured with the specified parameters

    Note:
        Handles special case for 'gpt-4o-mini' by mapping it to its full version name
        For 'gemini-1.5-pro', applies safety settings automatically
    """
    if model_name == "gpt-4o-mini":
        model_name = "gpt-4o-mini-2024-07-18"
    kwargs["model_name"] = model_name
    # if model_name == "gemini-1.5-pro":
    #     kwargs["safety_settings"] = safety_settings
    
    # Start with base params from config
    params = copy.deepcopy(engine_configs[model_name]["params"])
    # Override with any provided kwargs
    params.update(kwargs)
    
    return engine_configs[model_name]["constructor"](**params)

def invoke_with_log_probs(engine, prompt, **kwargs):
    """
    Invokes the language model and returns both the response content and log probability.

    Args:
        engine: The language model engine to use
        prompt: The input prompt to send to the model
        **kwargs: Additional keyword arguments for the model invocation

    Returns:
        tuple: (content, logprob) where content is the model's response text and
               logprob is the log probability of the first token

    Note:
        Handles different log probability formats for ChatOpenAI and ChatTogether models
    """
    engine = engine.bind(logprobs=True)
    response = engine.invoke(prompt, **kwargs)
    content = response.content
    if isinstance(engine.bound, ChatOpenAI):
        logprob = response.response_metadata['logprobs']['content'][0]['logprob']
    elif isinstance(engine.bound, ChatTogether):
        logprob = response.response_metadata['logprobs']['token_logprobs'][0]
    return content, logprob

def log_message(text, role, log_path, step_id=None):
    flag = f"=================== {role} at {step_id} ==================="
    text_to_dump = f"{flag}\n{text}\n{flag}\n"
    # Create directory if it doesn't exist
    os.makedirs(os.path.dirname(log_path), exist_ok=True)
    with open(log_path, "a") as f:
        f.write(text_to_dump)


def invoke_engine(engine, prompt, log_path=None, step_id=None, max_retries=5, timeout=60, **kwargs):
    """
    Simple wrapper to invoke a language model engine and return its response.

    Args:
        engine: The language model engine to use
        prompt: The input prompt to send to the model
        **kwargs: Additional keyword arguments for the model invocation

    Returns:
        str: The model's response text. For gemini-1.5-pro, returns the raw response object;
             for other models, returns just the content
    """
    

    base_wait = 5  # Start with 1 second
    max_wait = 60  # Max wait of 1 minute
    
    for attempt in range(max_retries):
        try:            
            with ThreadPoolExecutor(max_workers=1) as executor:
                if log_path:
                    log_message(prompt, "User", log_path, step_id)
                future = executor.submit(lambda: (
                    engine.invoke(prompt, **kwargs).content 
                    if "gemini" not in engine.model_name
                    else engine.invoke(prompt, **kwargs)
                ))
                
                try:
                    result = future.result(timeout=timeout)
                    if log_path:
                        log_message(result, "Assistant", log_path, step_id)
                    return result
                except FuturesTimeoutError:
                    if log_path:
                        log_message("Request timed out", "Assistant", log_path, step_id)
                    raise TimeoutError(f"Request timed out after {timeout} seconds")
                except Exception as e:
                    log_message(f"Error: {e}", "Assistant", log_path, step_id)
        except Exception as e:
            if attempt == max_retries - 1:
                print(f"Error: {e}")
                raise e # Re-raise the exception on the last attempt
            
            # Calculate wait time with exponential backoff, capped at max_wait
            wait_time = min(base_wait * (2 ** attempt), max_wait)
            time.sleep(wait_time)