任务背景
你是一名国际护肤品行业的数据分析师，负责分析消费者描述的护肤品使用场合和情境需求。以下是提取的原始使用场合描述列表（original_usage_purpose_context），其中存在表达不规范或过于笼统的情况。

任务目标
识别消费者描述的护肤品使用场合和情境需求：

从预设的【official_context_list】中选择与原始描述最匹配的标签，生成新的场合分类列表。

要求
必须从【official_context_list】中选择。
如果在【official_context_list】中找不到对应的使用场合，则返回“未知”。

重要限制
只能基于【official_context_list】中的标签进行选择，不允许发散或创造新的值。
根据【original_usage_purpose_context】的语义，判断其与【official_context_list】的对应关系。
确保输出的分类简洁、明确且贴近实际场合需求。

原始使用场合描述列表：
- original_usage_purpose_context:
早晨清爽


预设的场合分类列表：
- official_context_list:
日常护理
夜间护理
早晨清爽
日间护理
换季护理
沐浴后
男士护理
户外使用
紧急护理
定期护理
妆前护理
随时护理
特殊时期
旅行护理
婴儿护理
清洁
局部护理
干燥季节
医美后护理
特殊场合
睡前护理
熬夜护理
快速上妆
祛痘护理
婚礼护理
约会护理
夏季高温护理
春夏护理

输出格式：
请返回【original_usage_purpose_context】和【official_context_list】的对应关系，格式如下
{
  "mapping": [
    {
      "original_usage_purpose_context": "string",
      "context_category": "string"
    }
  ]
}

注意
如果无法匹配，请返回 "context_category": "未知"。
禁止输出【official_context_list】列表外的值。
优先考虑语义一致性和分类多样性，确保标签准确且具有代表性。

输入示例：
用户品牌提及列表：
- original_usage_purpose_context：

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等.
下面是输入数据:
