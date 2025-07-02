from openai import OpenAI
from openai import RateLimitError, OpenAIError




def openai_api(userPrompt, systemPrompt, api_key, modelName):
    # my_key = ""
    client = OpenAI(api_key=api_key)

    """
    调用 OpenAI API 生成文本
    :param userPrompt: 用户输入的提示
    :param systemPrompt: 系统提示
    :return: 返回生成的文本内容
    """
    if not userPrompt or not systemPrompt:
        raise ValueError("userPrompt 和 systemPrompt 不能为空")

    try:
        response = client.chat.completions.create(
            model=modelName,  # 指定使用的模型
            messages=[
                {"role": "system", "content": systemPrompt},
                {"role": "user", "content": userPrompt}
            ],
            temperature=0.7, # 温度参数，控制输出的随机性，0-2之间，越高越随机
            max_tokens=500   # 指定生成的最大 token 数量
        )
        content = response.choices[0].message.content
        print(content)
        return content
    except RateLimitError:
        print("调用频率或额度已超出，请检查API Key的使用情况。")
    except OpenAIError as e:
        print(f"调用失败：{e}")


