import logging
from typing import Dict, List, Optional

from sqlglot import parse_one, exp
from sqlglot.optimizer.qualify import qualify



def get_table_all_columns(tables_json, db_id, table_name: str) -> List[str]:
    if isinstance(tables_json, str):
        GT_dbs = [db_id]
    elif isinstance(tables_json, list):
        GT_dbs = db_id
    else:
        raise ValueError(f"tables_json should be str or list, not {type(tables_json)}")

    for db in tables_json:
        if db["db_id"] not in GT_dbs: continue
       
        table_names = db["table_names_original"]
        columns = db["column_names_original"]
        
        table_columns = []
        for table_index, table_name in enumerate(table_names):
            if table_name.lower() != table_name.lower():
                continue
            table_columns = []
            for col in columns:
                if col[0] == table_index:
                    table_columns.append(col[1])
        
        return table_columns
    raise ValueError(f"Database '{db_id}' not found")


def _get_main_parent(expression: exp.Expression) -> Optional[exp.Expression]:
    """
    Retrieves the main parent expression for a given SQL expression.
    
    Args:
        expression (exp.Expression): The SQL expression.
        
    Returns:
        Optional[exp.Expression]: The main parent expression or None if not found.
    """
    parent = expression.parent
    while parent and not isinstance(parent, exp.Subquery):
        parent = parent.parent
    return parent

def _get_table_with_alias(parsed_sql: exp.Expression, alias: str) -> Optional[exp.Table]:
    """
    Retrieves the table associated with a given alias.
    
    Args:
        parsed_sql (exp.Expression): The parsed SQL expression.
        alias (str): The table alias.
        
    Returns:
        Optional[exp.Table]: The table associated with the alias or None if not found.
    """
    return next((table for table in parsed_sql.find_all(exp.Table) if table.alias == alias), None)

def get_sql_columns_dict(tables_json, db_id, sql: str) -> Dict[str, List[str]]:
    """
    Retrieves a dictionary of tables and their respective columns involved in an SQL query.
    
    Args:
        db_path (str): Path to the database file.
        sql (str): The SQL query string.
        
    Returns:
        Dict[str, List[str]]: Dictionary of tables and their columns.
    """
    sql = qualify(parse_one(sql, read='snowflake'), qualify_columns=True, validate_qualify_columns=False) if isinstance(sql, str) else sql
    columns_dict = {}

    sub_queries = [subq for subq in sql.find_all(exp.Subquery) if subq != sql]
    for sub_query in sub_queries:
        subq_columns_dict = get_sql_columns_dict(tables_json, db_id, sub_query)
        for table, columns in subq_columns_dict.items():
            if table not in columns_dict:
                columns_dict[table] = columns
            else:
                columns_dict[table].extend([col for col in columns if col.lower() not in [c.lower() for c in columns_dict[table]]])

    for column in sql.find_all(exp.Column):
        column_name = column.name
        table_alias = column.table
        table = _get_table_with_alias(sql, table_alias) if table_alias else None
        table_name = table.name if table else None

        if not table_name:
            candidate_tables = [t for t in sql.find_all(exp.Table) if _get_main_parent(t) == _get_main_parent(column)]
            for candidate_table in candidate_tables:
                table_columns = get_table_all_columns(tables_json, db_id, candidate_table.name)
                if column_name.lower() in [col.lower() for col in table_columns]:
                    table_name = candidate_table.name
                    break

        if table_name:
            if table_name not in columns_dict:
                columns_dict[table_name] = []
            if column_name.lower() not in [c.lower() for c in columns_dict[table_name]]:
                columns_dict[table_name].append(column_name)

    return columns_dict