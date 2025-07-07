from pathlib import Path

from db.ops import (create_metadata, 
                    select_dwd_issue, 
                    select_dwd_refined_tag,
                    select_tag_mapping_template,
                    insert_validated_success_data)
from tag.jinja_render import  jinja_render_systemPrompt_for_mapping
from tag.config import  config_global
from tag.tagging import content_tagging_creation

import uuid

if __name__ == "__main__":
    run_id = uuid.uuid4()

    db_url = config_global()    

    engine,metadata = create_metadata(db_url)  

    # init categories
    init_refined_tag = select_dwd_refined_tag(metadata,engine)
    categories = init_refined_tag 

    # tag template-systemPrompt
    tag_mapping_templates = select_tag_mapping_template(metadata, engine)  
    systemPrompt = jinja_render_systemPrompt_for_mapping(tag_mapping_templates, categories)

    # userPrompt
    userPrompt_list = select_dwd_issue(metadata, engine)

    ## tagging with llm
    validate_success_data_list = []
    # for input in input_list:
    for input in userPrompt_list:   
       ids = input['ids']
       userPrompt = input['content']
       validate_success_data = content_tagging_creation(systemPrompt, ids, userPrompt)
       validate_success_data_list.append(validate_success_data)


    ## tag insert db
    for validate_success_data in validate_success_data_list:
        insert_validated_success_data(engine, metadata, validate_success_data, run_id)


    # for userPrompt in userPrompt_list:
    #         content = openai_api(userPrompt, systemPrompt) 
            
    #         insert_dwd_refined_tag(metadata, engine, content)

