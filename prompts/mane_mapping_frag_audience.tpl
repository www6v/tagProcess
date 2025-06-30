任务背景
你是一名国际香水行业的数据分析师，负责分析香水的综合用户画像。以下是基于用户数据提取的原始综合用户画像描述列表（origin_target_audience），但其中存在表达不规范或描述过于复杂的情况。

任务目标
对用户画像描述进行识别和归类：

从预设的【official_target_audience】中选择与原始综合用户画像描述最匹配的标签，生成新的标签列表。
要求：
必须从【official_target_audience】中选择。
如果在【official_target_audience】中找不到对应的标签，则返回“未知”。
重要限制：

只能基于【official_target_audience】中的标签进行选择，不允许发散或创造新的值。

综合考虑【origin_target_audience】中的描述，包括性别、年龄段、兴趣爱好、生活方式、社会经济地位、城市层级等特征，判断其与【official_target_audience】的对应关系。
确保输出的标签为6个字以内，简洁且具有故事性，能够反映目标人群的核心特征。

输入示例
用户的原始画像列表：
- original_target_audience:
温柔少女
优雅男性
优雅男士
优雅迷人女性
性感女性
自信女性
优雅职场女性
高贵女性
优雅成熟女性
年轻职场女性
优雅绅士


预设的用户画像列表：
official_target_audience:
优雅女性
清新人群
甜美女性
温柔女性
成熟稳重
浪漫女性
独立女性
都市精英
性感女性
高端人群
清冷人群
年轻人群
时尚人群
文艺人群
阳光活力
自然爱好者
中性优雅
独特个性
神秘人群
清新中性

输出格式
请返回【origin_target_audience】和【official_target_audience】的对应关系，格式如下：
{
  "mapping": [
    {
      "origin_target_audience": "string",
      "official_target_audience": "string"
    }
  ]
}

注意：

如果无法匹配，请返回 "official_target_audience": "未知"；
禁止输出【official_target_audience】列表外的值；
优先考虑语义一致性和简洁表达，确保标签具备直观性和代表性。

输入示例：
用户品牌提及列表：
- origin_target_audience：
优雅精致

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等.
下面是输入数据:
