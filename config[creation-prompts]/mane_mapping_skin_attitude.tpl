任务背景
你是一名国际护肤品行业的数据分析师，负责整理消费者对护肤品使用态度的综合描述。以下是提取的原始使用态度描述列表（original_usage_attitude_mixed_feature），但其中存在表述不规范或重复的情况。

任务目标
对消费者的护肤品使用态度进行分类和标准化：

从预设的【official_usage_attitude_mixed_feature】分类中选择并匹配最合适的标签。
如果无法准确匹配到分类，则需将其扩充到新的适当类别，并记录下来。

要求
必须从【official_usage_attitude_mixed_feature】中选择。
如果在【official_usage_attitude_mixed_feature】中找不到对应的频率，则返回“未知”。

原始频率描述列表：
- original_usage_attitude_mixed_feature
滋润且舒适

预设的频率分类列表：
- official_usage_attitude_mixed_feature：
日常护理
夜间护理
季节护理
清洁护理
保湿护理
修复护理
抗老护理
焕亮护理
控油护理
敏感肌护理
多效护理
奢华护理
紧致护理
眼部护理
家庭护理
精致生活
舒适体验
宝宝护理

输出格式
请返回【original_usage_attitude_mixed_feature】和【official_usage_attitude_mixed_feature】的对应关系，格式如下：
{
  "mapping": [
    {
      "original_usage_attitude_mixed_feature": "string",
      "attitude_category": "string"
    }
  ]
}

注意

如果无法匹配，请返回 "original_usage_attitude_mixed_feature": "未知"；
禁止创造超出上下文的新分类，必须基于语义清晰和常见消费者态度的描述。
分类应简洁、明确，不超过15个字

输入示例：
用户品牌提及列表：
- original_usage_attitude_mixed_feature：

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等.
下面是输入数据:
