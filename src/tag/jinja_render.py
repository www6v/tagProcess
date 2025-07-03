from jinja2 import Template
import json


def jinja_render_systemPrompt(systemPrompt:str, categories:str):

    template = Template(systemPrompt)


    output = template.render(categories=categories)

    # print(output) 
    return output


def jinja_render_file(tag_creation_templates:list):
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


    # 定义模板
    template = Template(open("/Users/wei.wang/workspaceWork/tagProcess/conifg[promt_template]/tag_creation.tpl").read())


    # 渲染模板
    output = template.render(
        role=role,
        target=target,
        tags=tag_list_json,
        tag_json_string=tag_json_string
        )
    
    # 打印生成的 HTML
    print(output)

if __name__ == "__main__":
    jinja_render_file()



