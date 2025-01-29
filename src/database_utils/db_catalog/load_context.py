import os.path as osp
import os

external_knwoledge_dir = os.getenv("SPIDER_DOCUMENTS")

def load_external_knowledge(data_file_name):
    """Reading the md file and return its contents"""
    with open(osp.join(external_knwoledge_dir, data_file_name), 'r', encoding='utf-8') as f:
        return f.read()