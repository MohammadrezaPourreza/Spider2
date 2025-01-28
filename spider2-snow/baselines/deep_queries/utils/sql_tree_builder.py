from graphviz import Digraph
from sqlglot import parse_one
from sqlglot.optimizer.qualify import qualify
import sqlglot

def draw_query_tree(query, graph=None, parent=None):
    """
    Recursively adds nodes and edges to the Graphviz graph for the SQL query tree.

    Args:
        tree (sqlglot.Expression): The root of the SQL query tree.
        graph (graphviz.Digraph): The Graphviz graph object.
        parent (str): The ID of the parent node.
    Returns:
        graphviz.Digraph: The graph representing the SQL tree.
    """
    tree = qualify(parse_one(query, read='snowflake', dialect='snowflake'), qualify_columns=False, validate_qualify_columns=False)

    if graph is None:
        graph = Digraph(format="png")
    
    # Add the current node to the graph
    node_id = str(id(tree))  # Use a unique identifier for the node
    label = tree.__class__.__name__ + (f" ({tree})" if not tree.is_type("identifier") else "")
    graph.node(node_id, label)
    
    # If there is a parent, create an edge
    if parent:
        graph.edge(parent, node_id)
    
    # Recursively add children nodes
    for child in tree.args.values():
        if isinstance(child, sqlglot.Expression):  # Single expression
            draw_query_tree(child, graph, node_id)
        elif isinstance(child, list):  # List of expressions
            for sub_child in child:
                if isinstance(sub_child, sqlglot.Expression):
                    draw_query_tree(sub_child, graph, node_id)
    
    return graph