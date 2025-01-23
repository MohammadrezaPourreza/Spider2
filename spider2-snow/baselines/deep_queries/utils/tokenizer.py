import google.generativeai as genai
import os
import vertexai
import tiktoken

from google.oauth2 import service_account
from google.cloud import aiplatform
from vertexai.preview.tokenization import get_tokenizer_for_model



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


def count_tokens(text: str, model_name: str) -> int:
    """
    Count the number of tokens in the given text.

    Parameters:
        text (str): The text to tokenize.
        engine (Any): The tokenizer engine.

    Returns:
        int: The number of tokens in the text.
    """
    if "gemini" in model_name:
        return get_tokenizer_for_model("gemini-1.5-flash-002").count_tokens(text).total_tokens
    else:
        encoding = tiktoken.encoding_for_model('gpt-4o')
        return len(encoding.encode(text))

