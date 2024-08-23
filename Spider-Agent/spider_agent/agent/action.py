#coding=utf8
import re
from dataclasses import dataclass, field
from typing import Optional, Any, Union, List, Dict
from abc import ABC

def remove_quote(text: str) -> str:
    """ 
    If the text is wrapped by a pair of quote symbols, remove them.
    In the middle of the text, the same quote symbol should remove the '/' escape character.
    """
    for quote in ['"', "'", "`"]:
        if text.startswith(quote) and text.endswith(quote):
            text = text[1:-1]
            text = text.replace(f"\\{quote}", quote)
            break
    return text.strip()


@dataclass
class Action(ABC):
    
    action_type: str = field(
        repr=False,
        metadata={"help": 'type of action, e.g. "exec_code", "create_file", "terminate"'}
    )


    @classmethod
    def get_action_description(cls) -> str:
        return """
Action: action format
Description: detailed definition of this action type.
Usage: example cases
Observation: the observation space of this action type.
"""

    @classmethod
    def parse_action_from_text(cls, text: str) -> Optional[Any]:
        raise NotImplementedError

@dataclass
class Bash(Action):

    action_type: str = field(
        default="exec_code",
        init=False,
        repr=False,
        metadata={"help": 'type of action, c.f., "exec_code"'}
    )

    code: str = field(
        metadata={"help": 'command to execute'}
    )

    @classmethod
    def get_action_description(cls) -> str:
        return """
## Bash Action
* Signature: Bash(code="shell_command")
* Description: This action string will execute a valid shell command in the `code` field. Only non-interactive commands are supported. Commands like "vim" and viewing images directly (e.g., using "display") are not allowed.
* Example: Bash(code="ls -l")
"""

    @classmethod
    def parse_action_from_text(cls, text: str) -> Optional[Action]:
        matches = re.findall(r'Bash\(code=(.*?)\)', text, flags=re.DOTALL)
        if matches:
            code = matches[-1]
            return cls(code=remove_quote(code))
        return None
    
    def __repr__(self) -> str:
        return f'{self.__class__.__name__}(code="{self.code}")'
    
    

@dataclass
class CreateFile(Action):

    action_type: str = field(
        default="create_file",
        init=False,
        repr=False,
        metadata={"help": 'type of action, c.f., "create_file"'}
    )

    code: str = field(
        metadata={"help": 'code to write into file'}
    )

    filepath: Optional[str] = field(
        default=None,
        metadata={"help": 'name of file to create'}
    )

    def __repr__(self) -> str:
        return f"CreateFile(filepath=\"{self.filepath}\"):\n```\n{self.code.strip()}\n```"

    @classmethod
    def get_action_description(cls) -> str:
        return """
## CreateFile
Signature: CreateFile(filepath="path/to/file"):
```
file_content
```
Description: This action will create a file in the field `filepath` with the content wrapped by paired ``` symbols. Make sure the file content is complete and correct. If the file already exists, you can only use EditFile to modify it.
Example: CreateFile(filepath="hello_world.py"):
```
print("Hello, world!")
```
"""

    @classmethod
    def parse_action_from_text(cls, text: str) -> Optional[Action]:
        matches = re.findall(r'CreateFile\(filepath=(.*?)\).*?```[ \t]*(\w+)?[ \t]*\r?\n(.*)[\r\n \t]*```', text, flags=re.DOTALL)
        if matches:
            filepath = matches[-1][0].strip()
            code = matches[-1][2].strip()
            return cls(code=code, filepath=remove_quote(filepath))
        return None
    
    def __repr__(self) -> str:
        return f"{self.__class__.__name__}(filepath='{self.filepath}':\n'''\n{self.code}\n''')"
       
@dataclass
class EditFile(Action):
    action_type: str = field(default="edit_file",init=False,repr=False,metadata={"help": 'type of action, c.f., "edit_file"'})

    code: str = field(metadata={"help": 'code to write into file'})

    filepath: Optional[str] = field(default=None,metadata={"help": 'name of file to edit'})

    def __repr__(self) -> str:
        return f"EditFile(filepath=\"{self.filepath}\"):\n```\n{self.code.strip()}\n```"

    @classmethod
    def get_action_description(cls) -> str:
        return """
## EditFile
Signature: EditFile(filepath="path/to/file"):
```
file_content
```
Description: This action will overwrite the file specified in the filepath field with the content wrapped in paired ``` symbols. Normally, you need to read the file before deciding to use EditFile to modify it.
Example: EditFile(filepath="hello_world.py"):
```
print("Hello, world!")
```
"""

    @classmethod
    def parse_action_from_text(cls, text: str) -> Optional[Action]:
        matches = re.findall(r'EditFile\(filepath=(.*?)\).*?```[ \t]*(\w+)?[ \t]*\r?\n(.*)[\r\n \t]*```', text, flags=re.DOTALL)
        if matches:
            filepath = matches[-1][0].strip()
            code = matches[-1][2].strip()
            return cls(code=code, filepath=remove_quote(filepath))
        return None    



@dataclass
class LOCAL_DB_SQL(Action):

    action_type: str = field(default="sql_command",init=False,repr=False,metadata={"help": 'type of action, c.f., "sql_command"'})
    code: str = field(metadata={"help": 'SQL command to execute'})
    file_path: str = field(default=None,metadata={"help": 'path to the database file'})
    output: str = field(default=None, metadata={"help": 'output file path or "direct"'})

    @classmethod
    def get_action_description(cls) -> str:
        return """
## SQL Action
* Signature: LOCAL_DB_SQL(file_path="path/to/database_file", command="sql_command", output="path/to/output_file.csv" or "direct")
* Description: Executes an SQL command on the specified database file. If `output` is set to a file path, the results are saved to this CSV file; if set to 'direct', results are displayed directly.
* Constraints:
  - The database file must be accessible and in a format compatible with SQLite (e.g., .sqlite, .db).
  - SQL commands must be valid and safely formatted to prevent security issues such as SQL injection.
* Examples:
  - Example1: LOCAL_DB_SQL(file_path="data.sqlite", command="SELECT name FROM sqlite_master WHERE type='table'", output="directly")
  - Example2: LOCAL_DB_SQL(file_path="data.db", command="SELECT * FROM users", output="users_output.csv")
"""
    @classmethod
    def parse_action_from_text(cls, text: str) -> Optional[Action]:
        matches = re.findall(r'LOCAL_DB_SQL\(file_path=(.*?), command=(.*?), output=(.*?)\)', text, flags=re.DOTALL)
        if matches:
            file_path, command, output = (item.strip() for item in matches[-1])
            return cls(file_path=remove_quote(file_path), code=remove_quote(command), output=remove_quote(output))
        return None

    def __repr__(self) -> str:
        return f'{self.__class__.__name__}(file_path="{self.file_path}", command="{self.code}", output="{self.output}")'
    

@dataclass
class BIGQUERY_EXEC_SQL(Action):
    sql_file_path: str = field(metadata={"help": 'path to save SQL file'})
    sql_query: str = field(metadata={"help": 'SQL query to execute'})
    is_save: bool = field(metadata={"help": 'whether to save result to CSV'})
    save_path: str = field(default=None, metadata={"help": 'path where the output CSV file is saved if is_save is True'})

    @classmethod
    def get_action_description(cls) -> str:
        return """
## BIGQUERY_EXEC_SQL Action
* Signature: BIGQUERY_EXEC_SQL(sql_file_path="path/to/your_sql_file.sql", sql_query="SELECT * FROM your_table", is_save=True, save_path="path/to/output_file.csv")
* Description: Executes a SQL query on Google Cloud BigQuery. It first saves the SQL query to a local file, then executes it. If `is_save` is True, the results are saved to a specified CSV file; otherwise, results are printed.
* Constraints:
  - SQL commands must be valid and formatted to prevent security issues such as SQL injection.
* Examples:
  - Example1: BIGQUERY_EXEC_SQL(sql_file_path="query1.sql", sql_query="SELECT count(*) FROM sales", is_save=False)
  - Example2: BIGQUERY_EXEC_SQL(sql_file_path="query2.sql", sql_query="SELECT user_id, sum(purchases) FROM transactions GROUP BY user_id", is_save=True, save_path="summary.csv")
"""

    @classmethod
    def parse_action_from_text(cls, text: str) -> Optional['BIGQUERY_EXEC_SQL']:
        matches = re.findall(r'BIGQUERY_EXEC_SQL\(sql_file_path=(.*?), sql_query=(.*?), is_save=(.*?), save_path=(.*?)\)', text, flags=re.DOTALL)
        if matches:
            sql_file_path, sql_query, is_save, save_path = (item.strip() for item in matches[-1])
            return cls(sql_file_path=remove_quote(sql_file_path), sql_query=remove_quote(sql_query), is_save=eval(is_save), save_path=remove_quote(save_path))
        return None

    def __repr__(self) -> str:
        save_info = f', save_path="{self.save_path}"' if self.is_save else ""
        return f'BIGQUERY_EXEC_SQL(sql_file_path="{self.sql_file_path}", sql_query="{self.sql_query}", is_save={self.is_save}{save_info})'

    
    
    
@dataclass
class BQ_GET_TABLES(Action):

    action_type: str = field(default="get_tables",init=False,repr=False,metadata={"help": 'type of action, c.f., "get_tables"'})

    project_name: str = field(metadata={"help": 'Google Cloud project name'})

    dataset_name: str = field(metadata={"help": 'Dataset name within the project'})

    save_path: str = field(metadata={"help": 'path where the output CSV file is saved'})

    @classmethod
    def get_action_description(cls) -> str:
        return """
## GET_TABLES Action
* Signature: GET_TABLES(project_name="your_project_name", dataset_name="your_dataset_name", save_path="path/to/output_file.csv")
* Description: Executes a query to fetch all table names and their corresponding DDL from the specified dataset in Google Cloud BigQuery. The results are saved to the specified CSV file.
* Constraints:
  - The specified project and dataset must exist in Google Cloud BigQuery and be accessible using the provided credentials.
  - The output path must be writable.
* Examples:
  - Example1: GET_TABLES(project_name="bigquery-public-data", dataset_name="new_york", save_path="dataset_metadata.csv")
"""
    @classmethod
    def parse_action_from_text(cls, text: str) -> Optional[Action]:
        matches = re.findall(r'GET_TABLES\(project_name=(.*?), dataset_name=(.*?), save_path=(.*?)\)', text, flags=re.DOTALL)
        if matches:
            project_name, dataset_name, save_path = (item.strip() for item in matches[-1])
            return cls(project_name=remove_quote(project_name), dataset_name=remove_quote(dataset_name), save_path=remove_quote(save_path))
        return None

    def __repr__(self) -> str:
        return f'{self.__class__.__name__}(project_name="{self.project_name}", dataset_name="{self.dataset_name}", save_path="{self.save_path}")'
    
    
@dataclass
class BQ_GET_TABLE_INFO(Action):

    action_type: str = field(default="get_table_info",init=False,repr=False,metadata={"help": 'type of action, c.f., "get_table_info"'})

    project_name: str = field(metadata={"help": 'Google Cloud project name'})

    dataset_name: str = field(metadata={"help": 'Dataset name within the project'})

    table: str = field(metadata={"help": 'Name of the table to fetch information from'})

    save_path: str = field(metadata={"help": 'path where the output CSV file is saved'})

    @classmethod
    def get_action_description(cls) -> str:
        return """
## GET_TABLE_INFO Action
* Signature: GET_TABLE_INFO(project_name="your_project_name", dataset_name="your_dataset_name", table="table_name", save_path="path/to/output_file.csv")
* Description: Executes a query to fetch all column information (field path, data type, and description) from the specified table in the dataset in Google Cloud BigQuery. The results are saved to the specified CSV file.
* Constraints:
  - The specified project, dataset, and table must exist in Google Cloud BigQuery and be accessible using the provided credentials.
  - The output path must be writable.
* Examples:
  - Example1: GET_TABLE_INFO(project_name="bigquery-public-data", dataset_name="samples", table="shakespeare", save_path="shakespeare.info.csv")
"""
    @classmethod
    def parse_action_from_text(cls, text: str) -> Optional[Action]:
        matches = re.findall(r'GET_TABLE_INFO\(project_name=(.*?), dataset_name=(.*?), table=(.*?), save_path=(.*?)\)', text, flags=re.DOTALL)
        if matches:
            project_name, dataset_name, table, save_path = (item.strip() for item in matches[-1])
            return cls(project_name=remove_quote(project_name), dataset_name=remove_quote(dataset_name), table=remove_quote(table), save_path=remove_quote(save_path))
        return None

    def __repr__(self) -> str:
        return f'{self.__class__.__name__}(project_name="{self.project_name}", dataset_name="{self.dataset_name}", table="{self.table}", save_path="{self.save_path}")'


@dataclass
class BQ_SAMPLE_ROWS(Action):

    action_type: str = field(default="bq_sample_rows",init=False,repr=False,metadata={"help": 'type of action, c.f., "bq_sample_rows"'})

    project_name: str = field(metadata={"help": 'Google Cloud project name'})

    dataset_name: str = field(metadata={"help": 'Dataset name within the project'})

    table: str = field(metadata={"help": 'Name of the table to sample data from'})

    row_number: int = field(metadata={"help": 'Number of rows to sample'})

    save_path: str = field(metadata={"help": 'path where the output JSON file is saved'})

    @classmethod
    def get_action_description(cls) -> str:
        return """
## BQ_SAMPLE_ROWS Action
* Signature: BQ_SAMPLE_ROWS(project_name="your_project_name", dataset_name="your_dataset_name", table="table_name", row_number=3, save_path="path/to/output_file.json")
* Description: Executes a query to sample a specified number of rows from the table in the dataset in Google Cloud BigQuery using the TABLESAMPLE SYSTEM method. The results are saved in JSON format to the specified path.
* Constraints:
  - The specified project, dataset, table, and row number must exist in Google Cloud BigQuery and be accessible using the provided credentials.
  - The output path must be writable.
* Examples:
  - Example1: BQ_SAMPLE_ROWS(project_name="bigquery-public-data", dataset_name="samples", table="shakespeare", row_number=3, save_path="shakespeare_sample_data.json")
"""
    @classmethod
    def parse_action_from_text(cls, text: str) -> Optional[Action]:
        matches = re.findall(r'BQ_SAMPLE_ROWS\(project_name=(.*?), dataset_name=(.*?), table=(.*?), row_number=(.*?), save_path=(.*?)\)', text, flags=re.DOTALL)
        if matches:
            project_name, dataset_name, table, row_number, save_path = (item.strip() for item in matches[-1])
            return cls(project_name=remove_quote(project_name), dataset_name=remove_quote(dataset_name), table=remove_quote(table), row_number=int(row_number), save_path=remove_quote(save_path))
        return None

    def __repr__(self) -> str:
        return f'{self.__class__.__name__}(project_name="{self.project_name}", dataset_name="{self.dataset_name}", table="{self.table}", row_number={self.row_number}, save_path="{self.save_path}")'
    


@dataclass
class Terminate(Action):

    action_type: str = field(
        default="terminate",
        init=False,
        repr=False,
        metadata={"help": "terminate action representing the task is finished, or you think it is impossible for you to complete the task"}
    )

    output: Optional[str] = field(
        default=None,
        metadata={"help": "answer to the task or output file path or 'FAIL', if exists"}
    )

    code : str = field(
        default=''
    )

    @classmethod
    def get_action_description(cls) -> str:
        return """
## Terminate Action
* Signature: Terminate(output="literal_answer_or_output_path")
* Description: This action denotes the completion of the entire task and returns the final answer or the output file/folder path. If you think the answer is a table, tell me the name of the CSV file. If the answer is not a table, just tell me the answer. Make sure the output file is located in the initial workspace directory. 
* Examples:
  - Example1: Terminate(output="New York")
  - Example2: Terminate(output="result.csv")
  - Example3: Terminate(output="FAIL")
"""

    def __repr__(self) -> str:
        return f'{self.__class__.__name__}(output="{self.output}")'

    @classmethod
    def parse_action_from_text(cls, text: str) -> Optional[Action]:
        matches = re.findall(r'Terminate\(output=(.*?)\)', text, flags=re.DOTALL)
        if matches:
            output = matches[-1]
            return cls(output=remove_quote(output))
        return None
    

