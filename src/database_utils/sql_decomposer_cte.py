import sqlglot
from sqlglot import exp
import re  # New import
import regex

sample_sql = """
    WITH
cohortExpr AS (
  SELECT
    "sample_barcode",
    LOG(10, "normalized_count") AS "expr"
  FROM
    "TCGA_HG19_DATA_V0"."TCGA_HG19_DATA_V0"."RNASEQ_GENE_EXPRESSION_UNC_RSEM"
  WHERE
    "project_short_name" = 'TCGA-BRCA'
    AND "HGNC_gene_symbol" = 'TP53'
    AND "normalized_count" IS NOT NULL
    AND "normalized_count" > 0
),
cohortVar AS (
  SELECT
    "Variant_Type",
    "sample_barcode_tumor" AS "sample_barcode"
  FROM
    "TCGA_HG19_DATA_V0"."TCGA_HG19_DATA_V0"."SOMATIC_MUTATION_MC3"
  WHERE
    "SYMBOL" = 'TP53'
),
cohort AS (
  SELECT
    e."sample_barcode" AS "sample_barcode",
    v."Variant_Type" AS "group_name",
    e."expr"
  FROM
    cohortExpr e
  JOIN
    cohortVar v
  ON
    e."sample_barcode" = v."sample_barcode"
),
grandMeanTable AS (
  SELECT
    AVG("expr") AS "grand_mean"
  FROM
    cohort
),
groupMeansTable AS (
  SELECT
    AVG("expr") AS "group_mean",
    "group_name",
    COUNT("sample_barcode") AS "n"
  FROM
    cohort
  GROUP BY
    "group_name"
),
ssBetween AS (
  SELECT
    g."group_name",
    g."group_mean",
    gm."grand_mean",
    g."n",
    g."n" * POW(g."group_mean" - gm."grand_mean", 2) AS "n_diff_sq"
  FROM
    groupMeansTable g
  CROSS JOIN
    grandMeanTable gm
),
ssWithin AS (
  SELECT
    c."group_name" AS "group_name",
    c."expr",
    b."group_mean",
    b."n" AS "n",
    POW(c."expr" - b."group_mean", 2) AS "s2"
  FROM
    cohort c
  JOIN
    ssBetween b
  ON
    c."group_name" = b."group_name"
),
numerator AS (
  SELECT
    SUM("n_diff_sq") / (COUNT("group_name") - 1) AS "mean_sq_between"
  FROM
    ssBetween
),
denominator AS (
  SELECT
    COUNT(DISTINCT "group_name") AS "k",
    COUNT("group_name") AS "n",
    SUM("s2") / (COUNT("group_name") - COUNT(DISTINCT "group_name")) AS "mean_sq_within"
  FROM
    ssWithin
)

SELECT
  "n",
  "k",
  "mean_sq_between",
  "mean_sq_within",
  "mean_sq_between" / "mean_sq_within" AS "F"
FROM
  numerator,
  denominator;
    """



def is_select_minimal(select_expr, removable_clauses):
    """
    Check if a SELECT expression has been reduced to only the minimal parts:
      SELECT ... FROM ...
    We treat any of the clauses in `removable_clauses` (if present and truthy)
    as "extra."
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
        # "having": "having",
        # "group": "group",
        "qualify": "qualify",
        "window": "window",
        "where": "where",
        # "distinct": "distinct",
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
        alias = expr.args.get('alias')
        # if alias:
            # print(f"SELECT with alias: {alias.name}")
        yield expr

    # Handle WITH clauses specifically
    if isinstance(expr, exp.With):
        for cte in expr.args.get('expressions', []):
            if isinstance(cte, exp.CTE):
                # print(f"CTE with alias: {cte.alias}")
                yield from get_selects_in_preorder(cte.this)

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
    # Handle WITH clauses specifically
    if isinstance(expr, exp.With):
        for cte in expr.args.get('expressions', []):
            if isinstance(cte, exp.CTE):
                # print(f"CTE with alias: {cte.alias}")
                yield from get_selects_in_postorder(cte.this)

    for value in expr.args.values():
        if isinstance(value, exp.Expression):
            yield from get_selects_in_postorder(value)
        elif isinstance(value, list):
            for item in value:
                if isinstance(item, exp.Expression):
                    yield from get_selects_in_postorder(item)

    if isinstance(expr, exp.Select):
        alias = expr.args.get('alias')
        # if alias:
        #     print(f"SELECT with alias: {alias.name}")
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
            alias = current.args.get('alias')
            # if alias:
            #     print(f"SELECT with alias: {alias.name}")
            yield current
        
        # Handle WITH clauses specifically
        if isinstance(current, exp.With):
            for cte in current.args.get('expressions', []):
                if isinstance(cte, exp.CTE):
                    # print(f"CTE with alias: {cte.alias}")
                    queue.append(cte.this)

        for value in current.args.values():
            if isinstance(value, exp.Expression):
                queue.append(value)
            elif isinstance(value, list):
                for item in value:
                    if isinstance(item, exp.Expression):
                        queue.append(item)

def preprocess_sql(sql_query):
    """Preprocess SQL query to handle edge cases"""
    replacements = [
        ("NOT DISTINCT", "NOT_DISTINCT"),
        ("NOT_DISTINCT", "IS NOT NULL"),  # Convert NOT DISTINCT to simpler form
        ("FILTER(WHERE", "FILTER (WHERE"),  # Add space to help parser
        ("FILTER WHERE", "FILTER (WHERE")   # Normalize filter syntax
    ]
    for old, new in replacements:
        sql_query = sql_query.replace(old, new)
    return sql_query

def remove_clauses_top_down_stepwise(sql_query, removal_order=None, only_last_select=False):
    """
    Remove clauses from a (possibly complex) SQL statement in a top-down
    and stepwise fashion. The default removal order now includes extra
    clauses such as 'offset', 'qualify', 'window', and 'distinct'.
    
    Returns a list of SQL strings showing the state after each removal.
    """
    sql_query = preprocess_sql(sql_query)
    
    root_expr = sqlglot.parse_one(sql_query, read="snowflake")

    versions = [root_expr.sql()]  # record the original query

    # Default removal order. Feel free to change the order or add new keys.
    if removal_order is None:
        removal_order = [
            # "limit",
            # "offset",
            # "order",
            # "having",
            # "group",
            # "qualify",
            # "window",
            # "where",
            # "distinct",
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
    Create sub-queries from a SQL query by traversing the DAG structure bottom-up.
    Returns a list of dictionaries, each containing:
        - id: A unique identifier (A, B, C, ...)
        - alias: The CTE or subquery alias (if any)
        - sql_query: the SQL query string
        - dag_dependencies: list of IDs this query depends on

    This version has been updated so that when a set operator (e.g. UNION or UNION ALL)
    is present, the union expression is preserved as a single node. For example:
        SELECT A UNION ALL SELECT B
    (or even a UNION tree with three or more SELECTs) will be kept together rather than
    splitting into two separate nodes.
    """

    sql_query = preprocess_sql(sql_query)
    # NEW: Store the original text to preserve formatting.
    original_text = sql_query

    sub_queries = []
    id_map = {}  # Maps CTE/table names to their assigned IDs
    processed_ctes = set()
    next_id = ord('A')

    root_expr = sqlglot.parse_one(sql_query, read="snowflake")
   

    def get_next_id():
        nonlocal next_id
        current_id = chr(next_id)
        next_id += 1
        return current_id

    def get_cte_hash(cte_expr):
        """Generate a unique hash for a CTE expression"""
        return hash(cte_expr.sql())

    def process_cte(cte):
        cte_hash = get_cte_hash(cte)
        if cte_hash in processed_ctes:
            return
        processed_ctes.add(cte_hash)
        alias = cte.alias
        if alias in id_map:
            current_id = id_map[alias]
        else:
            current_id = get_next_id()
            if alias:
                id_map[alias] = current_id
        # --- Begin modification: extract query using robust regex ---
          # use the 'regex' module for recursive matching
        if alias is None:
            extracted_query = original_text
        else:
          pattern = (
              r'(?is)\b' + regex.escape(alias) +
              r'\b\s+AS\s*\(\s*(?P<inner>(?:(?>[^()]+)|\((?&inner)\))*)\s*\)'
              r'(?=\s*(?:,|\bSELECT\b|$))'
          )

          match = regex.search(pattern, original_text)
          if match:
              extracted_query = match.group(1).strip()
          else:
              extracted_query = cte.this.sql()  # fallback if regex does not match
        versions = [extracted_query]
        # --- End modification ---
        for version in versions:
            sub_queries.append({
                'id': current_id,
                'alias': alias,
                'sql_query': version,
                'dag_dependencies': []  # will be computed below
            })
        if sub_queries and sub_queries[-1]['alias'] is None:
            last_component_id = sub_queries[-1]['id']
            for sub_query in sub_queries[::-1]:
                if sub_query['id'] != last_component_id:
                    break
                sub_query['alias'] = "$MAIN$"

    # Updated WITH clause detection:
    if root_expr.args.get("with"):
        with_expr = root_expr.args.get("with")
        ctes = with_expr.args.get("expressions") or list(with_expr.find_all(exp.CTE))
        for cte in ctes:
            if isinstance(cte, exp.CTE):
                process_cte(cte)
        # Use the main query from root_expr (which still includes the WITH clause)
        main_sql = root_expr.sql()
        main_id = get_next_id()
        sub_queries.extend([{
            'id': main_id,
            'alias': "$MAIN$",
            'sql_query': original_text,
            'dag_dependencies': []
        }])
        # sub_queries.extend([{
        #     'id': main_id,
        #     'alias': "$MAIN$",
        #     'sql_query': v,
        #     'dag_dependencies': []
        # } for v in remove_clauses_top_down_stepwise(main_sql, only_last_select=True)[::-1]])
    else:
        # No WITH clause; treat entire query as main.
        main_sql = root_expr.sql()
        main_id = get_next_id()
        sub_queries.extend([{
            'id': main_id,
            'alias': "$MAIN$",
            'sql_query': original_text,
            'dag_dependencies': []
        }])
        # sub_queries.extend([{
        #     'id': main_id,
        #     'alias': "$MAIN$",
        #     'sql_query': v,
        #     'dag_dependencies': []
        # } for v in remove_clauses_top_down_stepwise(main_sql, only_last_select=True)[::-1]])
    
    # ...existing dependency and wrapping logic...
    for sub_query in sub_queries:
        parsed = sqlglot.parse_one(sub_query['sql_query'], read="snowflake")
        # Re-compute dependencies with the complete id_map.
        def find_dependencies(expr):
            dependencies = set()
            for table in expr.find_all(exp.Table):
                table.name
                if table.name in id_map:
                    dependencies.add(id_map[table.name])
            return list(dependencies)
        sub_query['dag_dependencies'] = sorted(set(find_dependencies(parsed)))

    last_id, same_ids = None, []
    for sub_query in sub_queries:
        if last_id is None or sub_query['id'] == last_id:
            same_ids.append(sub_query)
            last_id = sub_query['id']
        else:
            if len(same_ids) > 1:
                for i, sql_dict in enumerate(list(reversed(same_ids))[1:]):
                    sql_dict['id'] = f"{last_id}.{i+1}"
            last_id = sub_query['id']
            same_ids = [sub_query]
    if len(same_ids) > 1:
        for i, sql_dict in enumerate(list(reversed(same_ids))[1:]):
            sql_dict['id'] = f"{last_id}.{i+1}"

    prev_alias, prev_id = None, None
    for sub_query in sub_queries:
        if prev_alias is not None and sub_query['alias'] is not None and sub_query['alias'] == prev_alias:
            sub_query['dag_dependencies'] = sorted(set(sub_query['dag_dependencies'] + [prev_id]))
        prev_alias = sub_query['alias']
        prev_id = sub_query['id']

    # NEW CODE: Compute wrapped_sql_query without modifying the original sql_query.
    subq_map = {sub['id']: sub for sub in sub_queries}

    def get_dependency_closure(node_id, visited=None):
        if visited is None:
            visited = set()
        if node_id in visited:
            return set()
        visited.add(node_id)
        deps = set(subq_map[node_id]['dag_dependencies'])
        closure = set(deps)
        for dep in deps:
            closure |= get_dependency_closure(dep, visited)
        return closure

    def order_top_level_dependencies(top_deps):
        ordered = []
        visited = set()
        def dfs(nid):
            if nid in visited:
                return
            visited.add(nid)
            for dep in subq_map[nid]['dag_dependencies']:
                if dep in top_deps:
                    dfs(dep)
            ordered.append(nid)
        for nid in top_deps:
            dfs(nid)
        return ordered

    def wrap_with_clause(deps_ordered, main_sql):
        ct_list = []
        for dep_id in deps_ordered:
            alias = subq_map[dep_id]['alias'] or dep_id
            ct_sql = subq_map[dep_id]['sql_query']
            ct_list.append(f"{alias} AS ({ct_sql})")
        with_clause = "WITH " + ", ".join(ct_list)
        return f"{with_clause} {main_sql}"

    # Updated wrapped_sql_query logic:
    for sub in sub_queries:
        if sub['alias'] == "$MAIN$":
            sub['wrapped_sql_query'] = sub['sql_query']
            continue
        closure = get_dependency_closure(sub['id'])
        top_level_deps = {nid for nid in closure if "." not in nid}
        if sub['id'] in top_level_deps:
            top_level_deps.remove(sub['id'])
        if top_level_deps:
            ordered_ids = order_top_level_dependencies(top_level_deps)
            sub['wrapped_sql_query'] = wrap_with_clause(ordered_ids, sub['sql_query'])
        else:
            sub['wrapped_sql_query'] = sub['sql_query']

    return sub_queries
