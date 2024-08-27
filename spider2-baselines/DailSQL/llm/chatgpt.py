import json.decoder

import openai
from utils.enums import LLM
import time


def init_chatgpt(OPENAI_API_KEY, OPENAI_GROUP_ID, model):
    # if model == LLM.TONG_YI_QIAN_WEN:
    #     import dashscope
    #     dashscope.api_key = OPENAI_API_KEY
    # else:
    #     openai.api_key = OPENAI_API_KEY
    #     openai.organization = OPENAI_GROUP_ID
    openai.api_key = OPENAI_API_KEY
    openai.organization = OPENAI_GROUP_ID


def ask_completion(model, batch, temperature, max_tokens):
    response = openai.Completion.create(
        model=model,
        prompt=batch,
        temperature=temperature,
        max_tokens=max_tokens,
        top_p=1,
        frequency_penalty=0,
        presence_penalty=0,
        stop=[";"]
    )
    response_clean = [_["text"] for _ in response["choices"]]
    return dict(
        response=response_clean,
        **response["usage"]
    )


def ask_chat(model, messages: list, temperature, n, max_tokens):
    print('>>>max_tokens:', max_tokens)
    response = openai.ChatCompletion.create(
        model=model,
        messages=messages,
        temperature=temperature,
        max_tokens=max_tokens,
        n=n
    )
    response_clean = [choice["message"]["content"] for choice in response["choices"]]
    if n == 1:
        response_clean = response_clean[0]
    return dict(
        response=response_clean,
        **response["usage"]
    )


def ask_llm(model: str, batch: list, temperature: float, n:int, max_tokens):
    n_repeat = 0
    while True:

        if n_repeat >= 1:
            # print('Repeat for 1 times, return "SELECT" instead')
            response = {"total_tokens": 0, "response": ["SELECT"]}
            break

        try:
            if model in LLM.TASK_COMPLETIONS:
                # TODO: self-consistency in this mode
                assert n == 1
                response = ask_completion(model, batch, temperature, max_tokens)
            elif model in LLM.TASK_CHAT:
                # batch size must be 1
                assert len(batch) == 1, "batch must be 1 in this mode"
                messages = [{"role": "user", "content": batch[0]}]
                response = ask_chat(model, messages, temperature, n, max_tokens)
                response['response'] = [response['response']]
            break
        except openai.error.RateLimitError as e:
            n_repeat += 1
            print(f"Repeat for the {n_repeat} times for RateLimitError", end="\n")
            print(f"Error message: {e}")
            time.sleep(1)
            continue
        except json.decoder.JSONDecodeError:
            n_repeat += 1
            print(f"Repeat for the {n_repeat} times for JSONDecodeError", end="\n")
            time.sleep(1)
            continue
        except Exception as e:
            n_repeat += 1
            print(f"Repeat for the {n_repeat} times for exception: {e}", end="\n")
            time.sleep(1)
            continue



    return response

