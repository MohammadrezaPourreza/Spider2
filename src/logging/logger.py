import logging
import pathlib
from datetime import datetime
import os
from typing import List
from dotenv import load_dotenv
import threading
import json

load_dotenv(override=True)
LOGS_DIR = os.getenv("LOGS_DIR")

os.makedirs(LOGS_DIR, exist_ok=True)

LOG_LEVELS = {
    "info": {
        "log_level": logging.INFO,
        "color": "\033[37m"  # White
    },
    "warning": {
        "log_level": logging.WARNING,
        "color": "\033[95m"  # Pink
    },
    "error": {
        "log_level": logging.ERROR,
        "color": "\033[91m"  # Red
    }
}

class SessionLogger:
    _file_locks = {}
    _locks_lock = threading.Lock()
    
    @classmethod
    def log_to_file(cls, file_name: str, message: str, log_level: str = "info") -> None:
        """
        Logs a message to a specific file within the session's execution_logs directory.
        
        Args:
            file_name: Name of the log file (without .log extension)
            message: Message to log
        """
        # Get the current instance's user_id and session_id from thread local storage
        current_logger = cls.get_current_logger()
        if not current_logger:
            raise RuntimeError("No logger has been initialized. Call setup_logger first.")
            
        # Create logger for this specific file
        logger_name = f"{current_logger.run_id}_{file_name}"
        file_logger = logging.getLogger(logger_name)
        
        # Define log file path without question_id
        log_file = current_logger.log_dir/ "execution_logs" / f"{file_name}.log"

        # create the log file if it doesn't exist
        log_file.parent.mkdir(parents=True, exist_ok=True)

        if not file_logger.handlers:
            file_logger.setLevel(current_logger.log_level)
            
            # Setup file handler
            file_handler = logging.FileHandler(log_file)
            formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
            file_handler.setFormatter(formatter)
            file_logger.addHandler(file_handler)
            
            # Add console handler if this file should output to console
            if current_logger.console_output_files and (file_name in current_logger.console_output_files):
                print(f"Adding console handler for {file_name}")
                console_handler = logging.StreamHandler()
                console_handler.setFormatter(formatter)
                file_logger.addHandler(console_handler)
        
        # Get or create lock for this file
        with cls._locks_lock:
            file_lock = cls._file_locks.get(log_file)
            if file_lock is None:
                file_lock = threading.Lock()
                cls._file_locks[log_file] = file_lock
        
        # Use the lock when writing to file
        with file_lock:
            file_logger.log(LOG_LEVELS[log_level]["log_level"], message)
            
            # Only print colored message if console output is enabled for this file
            if current_logger.console_output_files and file_name in current_logger.console_output_files:
                color = LOG_LEVELS[log_level]["color"]
                reset = "\033[0m"
                # print(f"{color}{message}{reset}")

    @classmethod
    def log_to_json(cls, file_name: str, data: dict) -> None:
        """
        Logs data to a JSON file within the session's execution_logs directory.
        
        Args:
            file_name: Name of the log file (without .json extension)
            data: Dictionary to log
        """
        current_logger = cls.get_current_logger()
        if not current_logger:
            raise RuntimeError("No logger has been initialized. Call setup_logger first.")
            
        json_file = current_logger.log_dir / f"{file_name}.json"
        
        # Get or create lock for this file
        with cls._locks_lock:
            file_lock = cls._file_locks.get(json_file)
            if file_lock is None:
                file_lock = threading.Lock()
                cls._file_locks[json_file] = file_lock
        
        # Use the lock when writing to file
        with file_lock:
            with open(json_file, 'w') as f:
                json.dump(data, f, indent=2)
    
    @classmethod
    def update_json(cls, file_name: str, update_func) -> None:
        """
        Updates an existing JSON file using the provided update function.
        
        Args:
            file_name: Name of the log file (without .json extension)
            update_func: Function that takes existing data and returns updated data
        """
        current_logger = cls.get_current_logger()
        if not current_logger:
            raise RuntimeError("No logger has been initialized. Call setup_logger first.")
            
        json_file = current_logger.log_dir / f"{file_name}.json"
        
        # Get or create lock for this file
        with cls._locks_lock:
            file_lock = cls._file_locks.get(json_file)
            if file_lock is None:
                file_lock = threading.Lock()
                cls._file_locks[json_file] = file_lock
        
        # Use the lock when writing to file
        with file_lock:
            try:
                with open(json_file, 'r') as f:
                    data = json.load(f)
            except (FileNotFoundError, json.JSONDecodeError):
                data = {}
                
            updated_data = update_func(data)
            
            with open(json_file, 'w') as f:
                json.dump(updated_data, f, indent=2)

    _current_logger = None

    @classmethod
    def get_current_logger(cls):
        return cls._current_logger

    def __init__(self, run_id: str, log_dir: pathlib.Path, log_level=logging.INFO, console_output_files: List[str] = None):
        self.run_id = run_id
        self.log_level = log_level
        self.console_output_files = console_output_files if console_output_files else []
        self.log_dir = log_dir
        
        # Store this instance as the current logger
        SessionLogger._current_logger = self
        
        # Setup base logger
        self.logger = logging.getLogger(f"session_{run_id}")
        
        if not self.logger.handlers:
            self.logger.setLevel(log_level)
            self.log_dir.mkdir(parents=True, exist_ok=True)
            
            if self.console_output_files:
                console_handler = logging.StreamHandler()
                formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
                console_handler.setFormatter(formatter)
                self.logger.addHandler(console_handler)
    
def setup_logger(run_id: str, log_level=logging.INFO, console_output_files: List[str] = None) -> SessionLogger:
    # Determine log directory here
    log_dir = pathlib.Path(LOGS_DIR) / run_id
    return SessionLogger(run_id, log_dir, log_level, console_output_files) 