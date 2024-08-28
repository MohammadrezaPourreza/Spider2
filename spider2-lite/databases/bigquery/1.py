import os
import shutil

current_directory = os.getcwd()
folders = [folder for folder in os.listdir(current_directory) if os.path.isdir(os.path.join(current_directory, folder))]

for folder in folders:
    parent_folder_path = os.path.join(current_directory, folder)
    
    subfolders = [subfolder for subfolder in os.listdir(parent_folder_path) if os.path.isdir(os.path.join(parent_folder_path, subfolder))]
    
    for subfolder in subfolders:
        subfolder_path = os.path.join(parent_folder_path, subfolder)
        
        new_folder_name = f"{folder}.{subfolder}"
        new_folder_path = os.path.join(current_directory, new_folder_name)
        
        shutil.move(subfolder_path, new_folder_path)
    
    shutil.rmtree(parent_folder_path)
