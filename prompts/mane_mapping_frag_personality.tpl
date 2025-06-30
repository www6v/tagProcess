任务背景
你是一名国际香水行业的数据分析师，负责分析用户文本中提到的香水受众特征。以下是用户文本中提取的原始受众描述列表（origin_personality），但其中存在表达不规范或多样化的情况。

任务目标
1. 对用户受众描述进行识别和归类：

从预设的【official_personality】中选择与原始受众描述最匹配的个性特征，生成新的个性特征列表。
要求：
必须从【official_personality】中选择。
如果在【official_personality】中找不到对应的个性特征，则返回“未知”。

2. 重要限制：

只能基于【official_personality】中的个性特征进行选择，不允许发散或创造新的值。
综合考虑【origin_personality】中的描述，包括人生阶段、生活态度、消费理念、人生观、世界观等内容，判断其与【official_personality】的对应关系。
确保输出的个性特征为6个字以内的简洁概括。

预设的受众描述列表：
- official_personality:
优雅
清新
甜美
温柔
浪漫
性感
成熟稳重
清冷
活力
自由
神秘
高级
独特
自然
文艺
温暖
低调
干净
经典
慵懒

输出格式
请返回【origin_personality】和【official_personality】的对应关系，格式如下：
{
  "mapping": [
    {
      "origin_personality": "string",
      "official_personality": "string"
    }
  ]
}

注意：
如果无法匹配，请返回 "official_personality": "未知"；
禁止输出【official_personality】列表外的值；
优先考虑语义一致性和简洁的概括表达。

输入示例：
用户品牌提及列表：
- original_personality：
寺庙（隐喻）

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等.
下面是输入数据:
