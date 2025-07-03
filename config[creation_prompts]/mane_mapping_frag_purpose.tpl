任务背景
你是一名国际香水行业的数据分析师，负责分析消费者使用香水时的主要目的。以下是提取的原始使用目的描述列表（origin_usage_purpose），但其中存在表达不规范或过于笼统的情况。

任务目标
识别消费者使用香水的主要目的：

从预设的【official_usage_purpose】中选择与原始使用目的描述最匹配的标签，生成新的使用目的分类列表。
要求：
必须从【official_usage_purpose】中选择。
如果在【official_usage_purpose】中找不到对应的使用目的，则返回“未知”。
重要限制：

只能基于【official_usage_purpose】中的标签进行选择，不允许发散或创造新的值。
根据【origin_usage_purpose】的描述，综合考虑情感需求、功能需求和场景需求，判断其与【official_usage_purpose】的对应关系。
确保输出的分类简洁、明确且多样化，以反映不同消费者群体的需求。

原始的用户使用目的列表：
- original_usage_purpose:
夏季必备


预设的使用目的列表：
- official_usage_purpose:
日常使用
约会使用
特殊场合
礼物赠送
社交与互动
职场使用
情绪调节
吸引他人
形象与自我表达
季节性使用
运动与健身
居家使用
收藏与个人欣赏
试用探索
氛围营造
旅行使用
仪式与纪念
休闲与放松
社交聚会
艺术与创作
个人成长与形象


输出格式
请返回【origin_usage_purpose】和【official_usage_purpose】的对应关系，格式如下：

{
  "mapping": [
    {
      "origin_usage_purpose": "string",
      "official_usage_purpose": "string"
    }
  ]
}

注意：

如果无法匹配，请返回 "official_usage_purpose": "未知"；
禁止输出【official_usage_purpose】列表外的值；
优先考虑语义一致性和分类多样性，确保标签准确且具有代表性

输入示例：
用户品牌提及列表：
- original_usage_purpose：
日常使用

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等.
下面是输入数据:
