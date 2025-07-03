from jinja2 import Template


def jinja_render_systemPrompt(systemPrompt:str, categories:str):

    template = Template(systemPrompt)


    output = template.render(categories=categories)

    # print(output) 
    return output








