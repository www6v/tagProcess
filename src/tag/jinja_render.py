from jinja2 import Template
import json
# import os
from tag.config import config_get_tag_create, config_get_tag_refined, config_get_tag_mapping


def jinja_render_systemPrompt_for_refined(tag_refined_templates:list,  categories:str):
    tag_refined_template = tag_refined_templates[0]     

    role = tag_refined_template['role']

    target=tag_refined_template['target']

    # todo: category 字段暂时没用

    # template = Template(systemPrompt)

    current_directory,prompt_path,qwenToken,modelName = config_get_tag_refined()
    # 定义模板  
    template = Template(open(current_directory + '/' + prompt_path).read())    

    output = template.render(
        role=role,
        target=target,
        categories=categories)

    # print(output) 
    return output


def jinja_render_file_system_prompt_for_creation(tag_creation_templates:list)->str:
    tag_creation_template = tag_creation_templates[0] 

    role = tag_creation_template['role']

    target=tag_creation_template['target']

    tag_list_json = json.loads(tag_creation_template['tag_list'])
    # tag_list = json.loads(tag_list_json)

    # tag_list = [
    #     {'tag_name': 'post_type', 'name': '帖子类型 ', 'type':'string', 'desc': '只能返回一个值，严格限制为真实体验、知识科普、求助咨询、吐槽维权、促销信息、产品对比、开箱测评、育儿经验、政策解读等类型。'},
    #     {'tag_name': 'post_topic', 'name': '帖子主题', 'type':'string', 'desc': '只能返回一个值，非常简短的一句话总结帖子主题。'},
    #     {'tag_name': 'relevance_score', 'name': '帖子相关性打分', 'type':'string', 'desc': '只能返回一个值，给帖子相关性打分，从1-4分，"1"是非常不相关，"2"是不相关，"3"是相关，"4"是非常相关根据帖子内容与婴幼儿奶粉产品的相关性打分。'},
    # ]

    # print( json.dumps(tag_list, ensure_ascii=False, indent=2) ) 
       
    tag_json_list = [{tag['tag_name']: tag['type']} for tag in tag_list_json]
    # print(tag_json_list)
    tag_json_string = json.dumps(tag_json_list, ensure_ascii=False, indent=2)


    current_directory,prompt_path, qwenToken,modelName = config_get_tag_create()
    # 定义模板  
    template = Template(open(current_directory +  '/' + prompt_path).read())


    # 渲染模板
    output = template.render(
        role=role,
        target=target,
        tags=tag_list_json,
        tag_json_string=tag_json_string
        )
    

    print(output)

    return output



def jinja_render_systemPrompt_for_mapping(tag_mapping_templates:list,  categories:str):
    tag_mapping_template = tag_mapping_templates[0]     

    role = tag_mapping_template['role']
    target = tag_mapping_template['target']

    # todo: category 字段暂时没用

    # template = Template(systemPrompt)

    current_directory,prompt_path,qwenToken,modelName = config_get_tag_mapping()
    # 定义模板  
    template = Template(open(current_directory + '/' + prompt_path).read())    

    output = template.render(
        role=role,
        target=target,
        categories=categories)

    # print(output) 
    return output


if __name__ == "__main__":
    jinja_render_file_system_prompt_for_creation()



