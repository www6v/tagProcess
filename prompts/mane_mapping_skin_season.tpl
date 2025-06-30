任务背景
你是一名国际护肤品行业的数据分析师，负责分析护肤品的适用季节特征。以下是提取的原始季节描述列表（original_usage_purpose_season），其中存在表达不规范或过于笼统的情况。

任务目标
识别护肤品适用的季节特征：

从预设的【official_season_list】中选择与原始描述最匹配的分类标签，生成新的季节分类列表。
若在【official_season_list】中找不到对应的季节，则返回“未知”。

要求
必须从【official_season_list】中选择；
如果无法匹配，请标注为“未知”；
标签需简洁、明确（不超过5个字），能反映季节性需求。

原始季节描述列表：
- original_usage_purpose_season：

预设的季节分类列表：
-official_season_list：
春季
夏季
秋季
冬季
春夏
春秋
秋冬
春夏秋
春夏秋冬
干燥季节
换季
女性生理期
全年适用
寒冷天气
高温天气

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

注意事项
若匹配不到，请返回 "season_category": "未知"；
禁止输出预设列表以外的值；
优先考虑语义一致性和分类精确性，确保标签准确且具有代表性。

输入示例：
用户品牌提及列表：
- original_usage_purpose_season：

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等.
下面是输入数据:
