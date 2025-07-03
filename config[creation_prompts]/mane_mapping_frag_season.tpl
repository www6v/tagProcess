任务背景
你是一名国际香水行业的数据分析师，负责分析消费者描述的香水适用季节特征。以下是提取的原始季节描述列表（original_usage_purpose_season），其中存在表达不规范或过于笼统的情况。

任务目标
识别消费者描述的香水适用季节特征：

从预设的【official_season_list】中选择与原始描述最匹配的标签，生成新的季节分类列表。

要求
必须从【official_season_list】中选择。
如果在【official_season_list】中找不到对应的季节，则返回“未知”。

重要限制
只能基于【official_season_list】中的标签进行选择，不允许发散或创造新的值。
根据【original_usage_purpose_season】的语义，判断其与【official_season_list】的对应关系。
确保输出的分类简洁明确，以反映季节的多样性和具体性。

原始季节描述列表
- original_usage_purpose_season:
暮春

预设的季节分类列表
- official_season_list:
春季
夏季
秋季
冬季
秋冬
夏秋
节庆时刻
阴冷天气
全年适用
春秋季
春夏季
雨季与湿润天气
无特定分类


输出格式
请返回【original_usage_purpose_season】和【official_season_list】的对应关系，格式如下：
{
  "mapping": [
    {
      "original_usage_purpose_season": "string",
      "season_category": "string"
    }
  ]
}

注意：
如果无法匹配，请返回 "official_season_list": "未知"；
禁止输出【official_season_list】列表外的值；
优先考虑语义一致性和分类多样性，确保标签准确且具有代表性

输入示例：
用户品牌提及列表：
- original_usage_purpose_season：
夏

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等.
下面是输入数据:
