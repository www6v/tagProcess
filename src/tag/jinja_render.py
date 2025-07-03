from jinja2 import Template


def jinja_render_systemPrompt(systemPrompt:str, categories:str):

    template = Template(systemPrompt)


    output = template.render(categories=categories)

    # print(output) 
    return output


def jinja_render_file():
    # 定义模板
    template = Template(open("/Users/wei.wang/workspaceWork/tagProcess/conifg[promt_template]/tag_creation.tpl").read())

    # 渲染模板
    output = template.render(
        role="John")

    # 打印生成的 HTML
    print(output)






