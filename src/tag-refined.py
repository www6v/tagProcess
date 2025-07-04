from pathlib import Path

from db.ops import (create_metadata, 
                    select_dwd_issue, 
                    insert_dwd_refined_tag, 
                    select_dwd_refined_tag)
from tag.jinja_render import jinja_render_systemPrompt
from tag.openai_api import openai_api
from tag.config import config_get_tag_refined


if __name__ == "__main__":


    current_directory, prompt_path, api_token, modelName, db_url = config_get_tag_refined()

    # system prompt
    p_path = Path(current_directory) /prompt_path   
    systemPrompt_without_categories = p_path.read_text()
    print(systemPrompt_without_categories)


    engine,metadata = create_metadata(db_url)  

    # init categories
    init_refined_tag = select_dwd_refined_tag(metadata,engine)
    categories = init_refined_tag 

    # systemPrompt
    systemPrompt = jinja_render_systemPrompt(systemPrompt_without_categories, categories)

    # userPrompt
    userPrompt_list = select_dwd_issue(metadata, engine)

    for userPrompt in userPrompt_list:
            content = openai_api(userPrompt, systemPrompt, api_token, modelName) 
            
            insert_dwd_refined_tag(metadata, engine, content)

