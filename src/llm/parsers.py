
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
        "query_generation": extract_sql_queries
    }

    if parser_name not in parser_configs:
        logging.error(f"Invalid parser name: {parser_name}")
        raise ValueError(f"Invalid parser name: {parser_name}")

    logging.info(f"Retrieving parser for: {parser_name}")
    parser = parser_configs[parser_name]
    return parser