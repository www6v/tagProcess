任务背景
你是一名国际护肤行业的数据分析师，负责分析消费者的综合用户画像。以下是提取的原始用户画像描述列表（original_target_audience_mixed_feature），其中存在描述不规范或不完整的情况。

任务目标
为护肤品产品生成精准的目标用户画像：

从预设的【official_target_audience_mixed_feature】中选择与原始用户画像最匹配的标签，生成新的用户画像分类列表。
要求
分类匹配规则：

必须从【official_target_audience_mixed_feature】中选择。
如果在【official_target_audience_mixed_feature】中找不到对应的用户画像，则返回“未知”。
标签需涵盖性别、年龄、收入层级、生活方式、皮肤状态和城市等多维度信息。
限制条件：

只能基于【official_target_audience_mixed_feature】中的标签进行选择，不允许发散或创造新的值。
根据【original_target_audience_mixed_feature】的语义，判断其与【official_target_audience_mixed_feature】的对应关系。
输出标签特征：

标签需简洁（不超过6个字），具有故事性，能够反映用户群体的核心特征。
原始用户画像描述列表
original_target_audience_mixed_feature: 
抗老紧致

预设用户画像列表
official_target_audience_mixed_feature:
年轻女性
年轻男性
敏感肌
干性皮肤人群
油性皮肤人群
混合性皮肤人群
痘痘肌人群
熟龄肌人群
抗老需求
注重性价比
都市白领
高收入人群
高净值消费者
奢华护肤追求者
注重修复
注重美白
注重保湿
夜间护肤需求
孕妇与产后妈妈
婴幼儿与儿童护肤
大学生党
新手护肤用户
基础护肤需求
注重天然成分
换季敏感肌
暗沉肌肤改善
注重清爽
注重控油保湿
追求紧致肌肤
注重眼部护理
晒后修复需求
平价护肤消费者
护肤达人
都市职场人士
家庭用户
追求品质生活
护肤效果显著
清爽控油
奢华体验消费者
注重抗氧化
母婴护理
敏感肌肤修复
经济独立人士
天然护肤爱好者
舒缓护理需求
注重香味
高端护肤用户
初抗老需求
注重肤色提亮
皮肤粗糙改善

输出格式
请返回【original_target_audience_mixed_feature】和【official_target_audience_mixed_feature】的对应关系，格式如下
{
  "mapping": [
    {
      "original_target_audience_mixed_feature": "string",
      "target_audience_category": "string"
    }
  ]
}

注意：
如果无法匹配，请返回 "target_audience_category": "未知"；
禁止输出【official_target_audience_mixed_feature】列表外的值；
优先考虑语义一致性，确保分类准确且反映用户群体特征。

输入示例：
用户品牌提及列表：
- original_target_audience_mixed_feature：

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等.
下面是输入数据:
