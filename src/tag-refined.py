from db import *
from tag import *

import os
import yaml
from pathlib import Path

from db.ops import create_metadata
from db.ops import refined
from tag.jinja_render import jinja_render_systemPrompt
# from db_init import  create_dwd_issue_tables

def config_get():
    current_directory = os.getcwd()

    # yaml
    file_path = Path(current_directory) /'config/tag-create-refined.yaml'
    config_str = file_path.read_text()


    print(config_str)

    config = yaml.load(config_str, Loader=yaml.FullLoader)
    # db
    # host = config["dsn"]["host"]
    # username = config["dsn"]["username"]
    # password = config["dsn"]["password"]
    # database = config["dsn"]["database"]  
    # prompt
    prompt_path = config["prompt_path"] 
    # api_token
    api_token = config["api_token"]
    # modelName
    modelName = config["model"]
    # db_url 
    db_url = config["db_url"]

    return current_directory,prompt_path,api_token,modelName, db_url


if __name__ == "__main__":


    current_directory, prompt_path, api_token, modelName, db_url = config_get()

    # system prompt
    p_path = Path(current_directory) /prompt_path   
    systemPrompt_without_categories = p_path.read_text()
    print(systemPrompt_without_categories)

    categories = "#my categories#" # get from db

    systemPrompt = jinja_render_systemPrompt(systemPrompt_without_categories, categories)
    engine,metadata = create_metadata(db_url)  
    

    
    refined(metadata, engine, systemPrompt, api_token, modelName)

