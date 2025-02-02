import sqlglot
from sqlglot import exp

def is_select_minimal(select_expr, removable_clauses):
    """
    Check if a SELECT expression has been reduced to only the minimal parts:
      SELECT ... FROM ...
    We treat any of the clauses in `removable_clauses` (if present and truthy)
    as “extra.”
    """
    for clause_key in removable_clauses:
        # For flags like "distinct", we only consider them if they are truthy.
        if select_expr.args.get(clause_key):
            return False
    return True

def remove_clause_from_select(select_expr, clause):
    """
    Remove one clause from a SELECT expression if it exists.
    Returns True if something was removed.
    
    The mapping below maps a (lowercased) clause name to the key
    used in the sqlglot AST. You can extend this mapping as needed.
    """
    clause_map = {
        "limit": "limit",
        "offset": "offset",
        "order": "order",
        "having": "having",
        "group": "group",
        "qualify": "qualify",
        "window": "window",
        "where": "where",
        "distinct": "distinct",
    }
    arg_key = clause_map.get(clause.lower())
    if not arg_key:
        return False

    # If the clause exists (and is truthy), remove it.
    if select_expr.args.get(arg_key):
        # For a flag like DISTINCT, setting it to None (or False)
        # removes it from the expression.
        select_expr.set(arg_key, None)
        return True
    return False

def get_selects_in_preorder(expr):
    """
    Generator to yield all SELECT expressions in a pre-order traversal:
      1. Yield the current expression if it's a SELECT.
      2. Recurse into children.
    """
    if isinstance(expr, exp.Select):
        yield expr

    for value in expr.args.values():
        if isinstance(value, exp.Expression):
            yield from get_selects_in_preorder(value)
        elif isinstance(value, list):
            for item in value:
                if isinstance(item, exp.Expression):
                    yield from get_selects_in_preorder(item)

def get_selects_in_postorder(expr):
    """
    Generator to yield all SELECT expressions in a post-order traversal:
      1. Recurse into children
        2. Yield the current expression if it's a SELECT.
    """
    for value in expr.args.values():
        if isinstance(value, exp.Expression):
            yield from get_selects_in_postorder(value)
        elif isinstance(value, list):
            for item in value:
                if isinstance(item, exp.Expression):
                    yield from get_selects_in_postorder(item)

    if isinstance(expr, exp.Select):
        yield expr

def get_selects_in_level_order(expr):
    """
    Generator to yield all SELECT expressions in a level-order traversal:
      1. Yield the current expression if it's a SELECT.
      2. Recurse into children.
    """
    queue = [expr]
    while queue:
        current = queue.pop(0)
        if isinstance(current, exp.Select):
            yield current
        for value in current.args.values():
            if isinstance(value, exp.Expression):
                queue.append(value)
            elif isinstance(value, list):
                for item in value:
                    if isinstance(item, exp.Expression):
                        queue.append(item)

def remove_clauses_top_down_stepwise(sql_query, removal_order=None, only_last_select=False):
    """
    Remove clauses from a (possibly complex) SQL statement in a top-down
    and stepwise fashion. The default removal order now includes extra
    clauses such as 'offset', 'qualify', 'window', and 'distinct'.
    
    Returns a list of SQL strings showing the state after each removal.
    """
    # Parse the SQL using sqlglot.
    root_expr = sqlglot.parse_one(sql_query, read="snowflake")
    versions = [root_expr.sql()]  # record the original query

    # Default removal order. Feel free to change the order or add new keys.
    if removal_order is None:
        removal_order = [
            "limit",
            "offset",
            "order",
            "having",
            "group",
            "qualify",
            "window",
            "where",
            "distinct",
        ]

    # Get all SELECT nodes in pre-order (top-down).
    selects_in_preorder = list(get_selects_in_preorder(root_expr))
    selects_in_preorder = [selects_in_preorder[0]] if only_last_select else selects_in_preorder

    # For each SELECT node, remove extra clauses one at a time.
    for select_expr in selects_in_preorder:
        while not is_select_minimal(select_expr, removal_order):
            removed_something = False
            for clause in removal_order:
                if remove_clause_from_select(select_expr, clause):
                    versions.append(root_expr.sql())  # record each change
                    removed_something = True
                    # Remove one clause per iteration; then re-check from the top.
                    break
            if not removed_something:
                # If nothing was removed in a pass, break out.
                break

    return versions


def create_sub_queries(sql_query):
    """
    Create sub-queries from a SQL query by removing clauses one at a time.
    """
    sub_sqls = []
    root_expr = sqlglot.parse_one(sql_query, read="snowflake")
    selects_in_preorder = list(get_selects_in_postorder(root_expr))
    for select_expr in selects_in_preorder:
        sub_sqls.extend(remove_clauses_top_down_stepwise(select_expr.sql(), only_last_select=True)[::-1])
    return sub_sqls