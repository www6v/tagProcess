任务背景
你是一名国际香水行业的数据分析师，负责分析用户在文本中对香水持久度的描述。以下是提取的原始描述列表（origin_performance），但其中可能存在表达不规范或未直接描述的情况。

任务目标
识别消费者描述的香水持久度特征：

从预设的【official_performance_list】中选择与原始描述最匹配的标签，生成新的持久度分类列表。

要求

必须从【official_performance_list】中选择。
如果在【official_performance_list】中找不到对应的持久度，则返回“未知”。

重要限制

只能基于【official_performance_list】中的标签进行选择，不允许发散或创造新的值。
根据【origin_performance】的语义，判断其与【official_performance_list】的对应关系。
确保输出的分类简洁明确，以反映持久度的多样性和具体性。

原始持久度描述列表

origin_performance:
“非常持久”

预设的持久度分类列表

official_performance_list:
持久
中等
短暂
超长
未知
无效描述

输出格式
请返回【origin_performance】和【official_performance_list】的对应关系，格式如下：
{
  "mapping": [
    {
      "origin_performance": "string",
      "official_performance_list": "string"
    }
  ]
}

注意

如果无法匹配，请返回 "performance_category": "未知"；
禁止输出【official_performance_list】列表外的值；
优先考虑语义一致性和分类多样性，确保标签准确且具有代表性

输入示例：
用户品牌提及列表：
- origin_performance：
日常使用

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等.
下面是输入数据:
