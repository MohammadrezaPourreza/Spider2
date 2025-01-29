
import re
import logging

from typing import Any

def extract_sql_queries(text):
    """
    Extracts SQL queries enclosed within <FINAL_ANSWER> and </FINAL_ANSWER> tags.


    Parameters:
        text (str): The large text containing SQL queries within code blocks.

    Returns:
        a SQL query
    """
    if "<FINAL_ANSWER>" in text and "</FINAL_ANSWER>" in text:
        pattern = re.compile(r"<FINAL_ANSWER>(.*?)</FINAL_ANSWER>", re.DOTALL)
        matches = pattern.findall(text)
        if matches:
            return matches[-1]
    return text


def extract_json_from_output(llm_output: str) -> str:
    """
    Extracts the JSON content between the ```json and ``` tags from the given LLM output.

    Parameters:
        llm_output (str): The complete LLM output string.

    Returns:
        str: The extracted JSON string. If no JSON block is found, returns an empty string.
    """
    pattern = re.compile(r"```json\s*(.*?)\s*```", re.DOTALL)
    match = pattern.search(llm_output)
    if match:
        # Extract the captured JSON string
        json_content = match.group(1)
        return json_content.strip()  # remove any extraneous whitespace
    return ""


def get_parser(parser_name: str) -> Any:
    """
    Returns the appropriate parser based on the provided parser name.

    Args:
        parser_name (str): The name of the parser to retrieve.

    Returns:
        BaseOutputParser: The appropriate parser instance.

    Raises:
        ValueError: If the parser name is invalid.
    """
    parser_configs = {
        "query_generation": extract_sql_queries,
        "json_extractor": extract_json_from_output
    }

    if parser_name not in parser_configs:
        logging.error(f"Invalid parser name: {parser_name}")
        raise ValueError(f"Invalid parser name: {parser_name}")

    logging.info(f"Retrieving parser for: {parser_name}")
    parser = parser_configs[parser_name]
    return parser