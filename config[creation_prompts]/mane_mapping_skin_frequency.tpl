任务背景
你是一名国际护肤品行业的数据分析师，负责整理消费者描述的护肤品使用频率信息。以下是提取的原始频率描述列表（original_usage_purpose_frequency），但其中存在表述不规范或过于笼统的情况。

任务目标
明确消费者使用护肤品的频率：

从预设的【official_usage_purpose_frequency】分类中选择并匹配最合适的标签。
如果无法准确匹配到分类，则返回"未知“。

要求
必须从【official_usage_purpose_frequency】中选择。
如果在【official_usage_purpose_frequency】中找不到对应的频率，则返回“未知”。

原始频率描述列表
- original_usage_purpose_frequency: 
每天两次

预设的频率分类列表
- official_usage_purpose_frequency:
每天
每晚
每周 1 次
每周 1-2 次
每周 2-3 次
每周 3-4 次
每周 5-6 次
每月 1 次
每月 2-3 次
隔天
低频
高频
长期
按需
特殊护理

输出格式
请返回【original_usage_purpose_frequency】和【official_usage_purpose_frequency】的对应关系，格式如下：

{
  "mapping": [
    {
      "original_usage_purpose_frequency": "string",
      "frequency_category": "string"
    }
  ]
}

注意：
如果无法匹配，请返回 "original_usage_purpose_frequency": "未知"；
禁止创造超出上下文的新分类，必须基于语义清晰和常见使用习惯。

输入示例：
用户品牌提及列表：
- original_usage_purpose_frequency：

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等.
下面是输入数据:
