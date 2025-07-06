import os
import yaml
from pathlib import Path

def config_get_tag_create():
    current_directory = os.getcwd()

    # yaml
    file_path = Path(current_directory) /'config/app/tag-create-config.yaml'
    config_str = file_path.read_text()


    print(config_str)

    config = yaml.load(config_str, Loader=yaml.FullLoader)


    # prompt
    # prompt_path = config["prompt_path"] 
    # qwenToken
    qwenToken = config["api_token"]
    # modelName
    modelName = config["model"]
    # db_url 
    db_url = config["db_url"]

    return current_directory, qwenToken, modelName, db_url


def config_get_tag_refined():
    current_directory = os.getcwd()

    # yaml
    file_path = Path(current_directory) /'config/app/tag-create-refined.yaml'
    config_str = file_path.read_text()


    print(config_str)

    config = yaml.load(config_str, Loader=yaml.FullLoader)

    # prompt
    prompt_path = config["prompt_path"] 
    # api_token
    api_token = config["api_token"]
    # modelName
    modelName = config["model"]
    # db_url 
    db_url = config["db_url"]

    return current_directory,prompt_path,api_token,modelName, db_url