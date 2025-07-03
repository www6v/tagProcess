任务背景
你是一名国际护肤行业的数据分析师，负责分析消费者使用护肤品的主要目的。以下是提取的原始使用目的描述列表（original_usage_purpose_purpose），其中存在表达不规范或过于笼统的情况。

任务目标
识别消费者使用护肤品的主要目的：

从预设的【official_usage_purpose_purpose】中选择与原始使用目的描述最匹配的标签，生成新的使用目的分类列表。

要求
必须从【official_usage_purpose_purpose】中选择。
如果在【official_usage_purpose_purpose】中找不到对应的使用目的，则返回“未知”。

重要限制
只能基于【official_usage_purpose_purpose】中的标签进行选择，不允许发散或创造新的值。
根据【original_usage_purpose_purpose】的语义，判断其与【official_usage_purpose_purpose】的对应关系。
确保输出的分类简洁明确，以反映使用目的的多样性和具体性。

原始使用目的描述列表
original_usage_purpose_purpose:
深层清洁

预设的使用目的分类列表
official_usage_purpose_purpose:
日常护理
深层清洁
保湿补水
舒缓修护
修复维稳
抗衰老
提亮肤色
控油祛痘
美白淡斑
紧致抗皱
深层滋养
眼部护理
防晒护理
妆前护理

输出格式：
请返回【original_usage_purpose_purpose】和【official_usage_purpose_purpose】的对应关系，格式如下
{
{
  "mapping": [
    {
      "original_usage_purpose_purpose": "string",
      "usage_purpose_category": "string"
    }
  ]
}

注意
如果无法匹配，请返回 "usage_purpose_category": "未知"；
禁止输出【official_usage_purpose_purpose】列表外的值；
优先考虑语义一致性和分类多样性，确保标签准确且具有代表性。

输入示例：
用户品牌提及列表：
- original_usage_purpose_purpose：

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等.
下面是输入数据:
