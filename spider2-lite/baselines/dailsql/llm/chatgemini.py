import json.decoder
from utils.enums import LLM
from langchain_google_vertexai import VertexAI

from google.oauth2 import service_account
from google.cloud import aiplatform
import vertexai
from langchain_google_vertexai import HarmBlockThreshold, HarmCategory
import os

from dotenv import load_dotenv

load_dotenv(override=True)

safety_settings = {
    HarmCategory.HARM_CATEGORY_UNSPECIFIED: HarmBlockThreshold.BLOCK_NONE,
    HarmCategory.HARM_CATEGORY_DANGEROUS_CONTENT: HarmBlockThreshold.BLOCK_NONE,
    HarmCategory.HARM_CATEGORY_HATE_SPEECH: HarmBlockThreshold.BLOCK_NONE,
    HarmCategory.HARM_CATEGORY_HARASSMENT: HarmBlockThreshold.BLOCK_NONE,
    HarmCategory.HARM_CATEGORY_SEXUALLY_EXPLICIT: HarmBlockThreshold.BLOCK_NONE,
}


GCP_PROJECT = os.getenv("GCP_PROJECT")
GCP_REGION = os.getenv("GCP_REGION")
GCP_CREDENTIALS = os.getenv("GCP_CREDENTIALS")

def init_gemini():
    aiplatform.init(
        project=GCP_PROJECT,
        location=GCP_REGION,
        credentials=service_account.Credentials.from_service_account_file(GCP_CREDENTIALS)
    )
    vertexai.init(project=GCP_PROJECT, location=GCP_REGION, credentials=service_account.Credentials.from_service_account_file(GCP_CREDENTIALS))


def ask_chat(model, message_text: str, temperature, max_tokens):
    print('>>>max_tokens:', max_tokens)
    llm = VertexAI(
        model=model,
        temperature=temperature,
        max_tokens=max_tokens,
        safety_settings=safety_settings
    )
    response = llm.invoke(message_text)
    response_clean = [response]
    return dict(
        response=response_clean,
        total_tokens=0
    )


def ask_llm(model: str, batch: list, temperature: float, n:int, max_tokens):
    try:
        assert model in LLM.TASK_CHAT, "LLM.TASK_COMPLETIONS is too old. not supported."
        assert len(batch) == 1, "batch must be 1 in this mode"
        assert n == 1, "n must be 1 in this model"
        response = ask_chat(model, batch[0], temperature, max_tokens)
        response['response'] = [response['response']]  # hard-code for batch_size=1
    except (json.decoder.JSONDecodeError, Exception) as e:
        print(f"Error occurred: {e}")
        response = {"total_tokens": 0, "response": [["SELECT" for _ in range(n)]]}
    
    return response

