from jinja2 import Template
import json


def jinja_render_systemPrompt(systemPrompt:str, categories:str):

    template = Template(systemPrompt)


    output = template.render(categories=categories)

    # print(output) 
    return output


def jinja_render_file():
    role = "任务说明： 你是达能爱他美婴幼儿奶粉的资深市场数据分析师，负责通过分析社交平台上的帖子，理解用户对婴幼儿奶粉的讨论内容、使用反馈、产品评价，找出促使用户选择或放弃某个奶粉产品的动因和障碍，并输出结构化的分析结果。"

    target="## 目标： 甄别平台帖子内容，判断是否可用于分析并满足以下需求，按要求对相关文本属性进行标注。目标是通过社交平台的文本分析，制定媒体和营销策略、洞察消费者兴趣、识别市场趋势，指导产品研发与改进。",

    tag_list = [
        {'tag_name': 'post_type', 'name': '帖子类型 ', 'type':'string', 'desc': '只能返回一个值，严格限制为真实体验、知识科普、求助咨询、吐槽维权、促销信息、产品对比、开箱测评、育儿经验、政策解读等类型。'},
        {'tag_name': 'post_topic', 'name': '帖子主题', 'type':'string', 'desc': '只能返回一个值，非常简短的一句话总结帖子主题。'},
        {'tag_name': 'relevance_score', 'name': '帖子相关性打分', 'type':'string', 'desc': '只能返回一个值，给帖子相关性打分，从1-4分，"1"是非常不相关，"2"是不相关，"3"是相关，"4"是非常相关根据帖子内容与婴幼儿奶粉产品的相关性打分。'},
   ]
    
    tag_json_list = [[tag['tag_name'], tag['type']] for tag in tag_list]
    print(tag_json_list)
    tag_json_string = json.dumps(tag_json_list, ensure_ascii=False, indent=2)


    # 定义模板
    template = Template(open("/Users/wei.wang/workspaceWork/tagProcess/conifg[promt_template]/tag_creation.tpl").read())


    # 渲染模板
    output = template.render(
        role=role,
        target=target,
        tags=tag_list,
        tag_json_string=tag_json_string
        )
    
    # 打印生成的 HTML
    print(output)


if __name__ == "__main__":
    jinja_render_file()



