import os
import yaml
from pathlib import Path


def config_global():
    current_directory = os.getcwd()

    # yaml
    file_path = Path(current_directory) /'config/app/global.yaml'
    config_str = file_path.read_text()


    print(config_str)

    config = yaml.load(config_str, Loader=yaml.FullLoader)

    # db_url 
    db_url = config["db_url"]

    return db_url

def config_get_tag_create():
    current_directory = os.getcwd()

    # yaml
    file_path = Path(current_directory) /'config/app/tag-create-config.yaml'
    config_str = file_path.read_text()


    print(config_str)

    config = yaml.load(config_str, Loader=yaml.FullLoader)


    # prompt
    prompt_path = config["prompt_path"] 
    # qwenToken
    qwenToken = config["api_token"]
    # modelName
    modelName = config["model"]
    # db_url 
    # db_url = config["db_url"]

    return current_directory, prompt_path, qwenToken, modelName


def config_get_tag_refined():
    current_directory = os.getcwd()

    # yaml
    file_path = Path(current_directory) /'config/app/tag-refined-config.yaml'
    config_str = file_path.read_text()


    print(config_str)

    config = yaml.load(config_str, Loader=yaml.FullLoader)

    # prompt
    prompt_path = config["prompt_path"] 
    # api_token
    api_token = config["api_token"]
    # modelName
    modelName = config["model"]
    # # db_url 
    # db_url = config["db_url"]

    return current_directory,prompt_path,api_token,modelName


def config_get_tag_mapping():
    current_directory = os.getcwd()

    # yaml
    file_path = Path(current_directory) /'config/app/tag-mapping-config.yaml'
    config_str = file_path.read_text()


    print(config_str)

    config = yaml.load(config_str, Loader=yaml.FullLoader)

    # prompt
    prompt_path = config["prompt_path"] 
    # api_token
    api_token = config["api_token"]
    # modelName
    modelName = config["model"]
    # # db_url 
    # db_url = config["db_url"]

    return current_directory,prompt_path,api_token,modelName