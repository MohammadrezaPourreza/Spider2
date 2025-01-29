import re
import json
import os
from datetime import datetime
from tqdm import tqdm
import networkx as nx
import matplotlib.pyplot as plt
from concurrent.futures import ThreadPoolExecutor, as_completed
from typing import List, Dict, Tuple, Optional

from src.llm.engines import get_engine, invoke_engine

def parse_llm_output(string: str) -> List[Dict]:
    """
    Parses a JSON-formatted string into a list of dictionaries.
    
    Args:
        string (str): JSON string representing the LLM output.
        
    Returns:
        list: A list of dictionaries, each containing component details.
    """
    try:
        if "```python" in string:
            string = string.split("```python")[1].strip()
            string = string.split("```")[0].strip()
        if "```json" in string:
            string = string.split("```json")[1].strip()
            string = string.split("```")[0].strip()
        components = json.loads(string)
        return components
    except json.JSONDecodeError as e:
        print(f"Error decoding JSON: {e}")
        return []

def create_dag(components: List[Dict]) -> nx.DiGraph:
    """
    Creates a Directed Acyclic Graph (DAG) from a list of component dictionaries.
    
    Args:
        components (list): A list of dictionaries, each containing component details.
        
    Returns:
        DiGraph: A NetworkX directed graph representing the DAG.
    """
    G = nx.DiGraph()

    # Add nodes with their attributes
    for component in components:
        G.add_node(component['id'], 
                   description=component['description'],
                   equivalent_natural_question=component['equivalent_natural_question'])

    # Add edges based on dependencies
    for component in components:
        for dependency in component['dag_dependencies']:
            G.add_edge(dependency, component['id'])

    # Check for cycles
    if not nx.is_directed_acyclic_graph(G):
        raise ValueError("The graph contains cycles and is not a valid DAG.")

    return G

def save_dag_as_pdf(dag: nx.DiGraph, save_to_path: str) -> None:
    """
    Visualizes a DAG in a bottom-up layout and saves it as a PDF.
    
    Args:
        dag (networkx.DiGraph): The DAG to visualize.
        save_to_path (str): The file path to save the PDF.
    """
    if not nx.is_directed_acyclic_graph(dag):
        raise ValueError("The provided graph is not a DAG.")

    pos = nx.nx_agraph.graphviz_layout(dag, prog='dot', args='-Grankdir=BT')

    plt.figure(figsize=(6, 8))
    nx.draw(dag, pos, with_labels=True, node_size=3000, node_color='lightblue',
            arrows=True, arrowsize=20, font_size=10, font_weight='bold',
            edge_color='gray', node_shape='o')

    plt.savefig(save_to_path, format='pdf', bbox_inches='tight')
    plt.close()

def process_llm_query(query_packet: Dict, engine: any, prompt_template: str) -> Tuple[str, str]:
    """
    Process a single query through the LLM.
    
    Args:
        query_packet: Dictionary containing query information
        engine: The LLM engine
        prompt_template: Template for the prompt
        
    Returns:
        Tuple of (query_id, llm_response)
    """
    query_id = query_packet["instance_id"]
    question = query_packet["instruction"]
    sql_query = query_packet["query"]
    
    prompt = prompt_template.format(main_question=question, sql_query=sql_query)
    response = invoke_engine(engine, prompt)
    
    return query_id, response

def decompose_queries(
    queries: List[Dict],
    model_name: str,
    output_dir: str,
    save_pdfs: bool = True,
    prompt_template_path: str = "decomposition_prompt.txt"
) -> None:
    """
    Main function to decompose SQL queries using an LLM and create DAGs.
    
    Args:
        queries: List of query dictionaries
        model_name: Name of the LLM model to use
        output_dir: Directory to save outputs
        save_pdfs: Whether to save PDF visualizations
        prompt_template_path: Path to the prompt template file
    """
    # Create output directory
    os.makedirs(output_dir, exist_ok=True)
    
    # Initialize engine and load prompt
    engine = get_engine(model_name)
    with open(prompt_template_path, 'r') as f:
        prompt_template = f.read()
    
    # Filter queries with non-empty SQL
    queries_with_sql = [q for q in queries if q.get("query", "").strip()]
    
    # Process queries through LLM in parallel
    llm_results = {}
    with ThreadPoolExecutor(max_workers=10) as executor:
        future_to_query = {
            executor.submit(process_llm_query, query, engine, prompt_template): query
            for query in queries_with_sql
        }
        
        for future in tqdm(as_completed(future_to_query), total=len(queries_with_sql)):
            try:
                query_id, response = future.result()
                llm_results[query_id] = response
            except Exception as e:
                print(f"Error processing query: {e}")
    
    # Process results sequentially
    for query_id, response in tqdm(llm_results.items(), desc="Creating DAGs"):
        try:
            # Save input/output log
            log_path = os.path.join(output_dir, f"log_{query_id}.txt")
            with open(log_path, "w") as f:
                f.write(f"Query ID: {query_id}\n\n##### Response #####\n\n{response}\n")
            
            # Parse and create DAG
            components = parse_llm_output(response)
            dag = create_dag(components)
            
            # Save DAG as JSON
            dag_json_path = os.path.join(output_dir, f"dag_{query_id}.json")
            with open(dag_json_path, "w") as f:
                json.dump(components, f, indent=4)
            
            # Save DAG visualization if requested
            if save_pdfs:
                dag_pdf_path = os.path.join(output_dir, f"dag_visual_{query_id}.pdf")
                save_dag_as_pdf(dag, dag_pdf_path)
                
        except Exception as e:
            print(f"Error processing results for query {query_id}: {e}")

if __name__ == "__main__":
    # Example usage
    queries_path = "path/to/queries.json"
    with open(queries_path, 'r') as f:
        queries = json.load(f)
    
    output_dir = f"logs/decomposition_{datetime.now().strftime('%Y-%m-%d-%H-%M-%S')}"
    decompose_queries(queries, "gemini-1.5-pro-002", output_dir, save_pdfs=True)
