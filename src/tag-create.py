from db import *
from tag import *


from functools import partial
import os
import yaml
from pathlib import Path
import uuid

# from tagging import content_tagging 
from tag.tagging import content_tagging_creation
from tag.jinja_render import jinja_render_file

from db.ops import (select_dwd_filtered_input, 
                    insert_validated_success_data,
                    create_metadata, 
                    select_tag_creation_template)


def config_get():
    current_directory = os.getcwd()

    # yaml
    file_path = Path(current_directory) /'config/tag-create-config.yaml'
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
    db_url = config["db_url"]

    return current_directory,prompt_path,qwenToken,modelName, db_url

if __name__ == "__main__":
    current_directory, prompt_path, qwenToken, modelName, db_url = config_get()

    # system prompt
    p_path = Path(current_directory) /prompt_path   
    systemPrompt = p_path.read_text()
    print(systemPrompt)

    systemPrompt = '你是个专业的标签生成器，请根据内容生成标签。'

    engine,metadata = create_metadata(db_url)

    ## tag template
    tag_creation_templates = select_tag_creation_template(metadata, engine)  
    jinja_render_file(tag_creation_templates)

    ## tagging with llm
    run_id = uuid.uuid4()
    input_list = select_dwd_filtered_input(engine, metadata)

    validate_success_data_list = []
    for input in input_list:
       validate_success_data = content_tagging_creation(systemPrompt ,qwenToken, modelName, input['ids'], input['content'])


    ## tag insert db
    for validate_success_data in validate_success_data_list:
        insert_validated_success_data(engine, metadata, validate_success_data, run_id)








