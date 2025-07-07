from pathlib import Path

from db.ops import (create_metadata, 
                    select_dwd_issue, 
                    insert_dwd_refined_tag, 
                    select_dwd_refined_tag,
                    select_tag_refined_template)
from tag.jinja_render import jinja_render_systemPrompt_for_refined
from tag.openai_api import openai_api
from tag.config import config_get_tag_refined, config_global


if __name__ == "__main__":
    db_url = config_global()    

    engine,metadata = create_metadata(db_url)  

    # init categories
    init_refined_tag = select_dwd_refined_tag(metadata,engine)
    categories = init_refined_tag 

    # tag template-systemPrompt
    tag_refined_templates = select_tag_refined_template(metadata, engine)  
    systemPrompt = jinja_render_systemPrompt_for_refined(tag_refined_templates, categories)

    # userPrompt
    userPrompt_list = select_dwd_issue(metadata, engine)

    for userPromptOne in userPrompt_list:
            userPrompt = userPromptOne['content']
            content = openai_api(userPrompt, systemPrompt) 
            
            insert_dwd_refined_tag(metadata, engine, content)

