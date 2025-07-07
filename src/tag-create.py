from pathlib import Path
import uuid

from db.ops import (select_dwd_filtered_input, 
                    insert_validated_success_data,
                    create_metadata, 
                    select_tag_creation_template)
from tag.tagging import content_tagging_creation
from tag.jinja_render import jinja_render_file_system_prompt_for_creation
from tag.config import config_get_tag_create


if __name__ == "__main__":
    current_directory,prompt_path, qwenToken, modelName, db_url = config_get_tag_create()

    # system prompt
    # p_path = Path(current_directory) /prompt_path   
    # systemPrompt = p_path.read_text()
    # print(systemPrompt)

    # systemPrompt = '你是个专业的标签生成器，请根据内容生成标签。'

    engine,metadata = create_metadata(db_url)

    ## tag template
    tag_creation_templates = select_tag_creation_template(metadata, engine)  
    systemPrompt = jinja_render_file_system_prompt_for_creation(tag_creation_templates)

    ## userPrompt from db
    run_id = uuid.uuid4()
    input_list = select_dwd_filtered_input(engine, metadata)

    ## tagging with llm
    validate_success_data_list = []
    for input in input_list:
       validate_success_data = content_tagging_creation(systemPrompt ,qwenToken, modelName, input['ids'], input['content'])
       validate_success_data_list.append(validate_success_data)

    ## tag insert db
    for validate_success_data in validate_success_data_list:
        insert_validated_success_data(engine, metadata, validate_success_data, run_id)








