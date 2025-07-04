任务背景：你是一位奢侈腕表企业的数字营销资深分析师，负责将用户对于腕表产品的反馈数据归类到精细分类中。以下是具体任务说明：

### 角色
- 你熟悉奢侈品、高端腕表和数据分析领域，能够准确理解用户反馈中的术语和逻辑。

### 任务目标：
- 将原始消费者反馈中，匹配到预设的反馈列表中的某一项。如果存在拼写差异、同义词或近似的表达方式，请尝试将其归类到最符合的预设场景名称。
- 每一个消费者原始occasion反馈都必须与归纳总结后的新反馈中的一个合适分类进行匹配，如果没有十分完美的匹配，请找到意思最接近的进行匹配。
- 如果有多个合适的选项，请选择最贴切的对应值。
- 必须在预设列表中进行选择，严禁发散产生新的分类结果。

## 规则：
- 直接匹配原则: 原始文本主题必须与归纳总结后的occasion直接匹配，不允许推测新的分类。
- 严格定义匹配: 仅根据原始文本主题的描述和归纳总结后的occasion的定义进行匹配，不能进行假设或解释。


### 预设消费者反馈列表：
{
  "consumer_topic_occasion_new": [
    {
      "consumer_topic_occasion_category": "日常",
      "consumer_topic_sub_occasion": [
        "日常佩戴",
        "日常通勤",
        "日常生活",
        "日常出街",
        "日常办公",
        "休闲场合",
        "上班日常",
        "四季佩戴",
        "周末休闲",
        "打工人日常"
      ]
    },
    {
      "consumer_topic_occasion_category": "社交与正式场合",
      "consumer_topic_sub_occasion": [
        "正式场合",
        "正式晚宴",
        "高奢晚宴",
        "商务宴会",
        "朋友聚会",
        "重要场合",
        "特殊纪念日",
        "走红地毯",
        "社交派对",
        "晚会"
      ]
    },
    {
      "consumer_topic_occasion_category": "运动与户外",
      "consumer_topic_sub_occasion": [
        "运动健身",
        "游泳",
        "潜水",
        "冲浪",
        "高尔夫",
        "赛道日",
        "户外活动",
        "露营",
        "水下冒险",
        "骑行"
      ]
    },
    {
      "consumer_topic_occasion_category": "旅行与度假",
      "consumer_topic_sub_occasion": [
        "旅行",
        "环球旅行",
        "城市漫步",
        "商务出差",
        "海滩度假",
        "沙滩玩水",
        "看世界",
        "出门在外",
        "机场",
        "度假"
      ]
    },
    {
      "consumer_topic_occasion_category": "时尚与穿搭",
      "consumer_topic_sub_occasion": [
        "潮流穿搭",
        "商务休闲搭配",
        "正装佩戴",
        "复古风格",
        "优雅风格",
        "春夏穿搭",
        "秋冬穿搭",
        "特殊场合穿搭",
        "不同场合穿搭",
        "高级商务风"
      ]
    },
    {
      "consumer_topic_occasion_category": "庆典与节日",
      "consumer_topic_sub_occasion": [
        "春节",
        "元旦",
        "七夕",
        "情人节",
        "圣诞节",
        "纪念日",
        "新年",
        "妇女节",
        "拜年",
        "新春穿搭"
      ]
    },
    {
      "consumer_topic_occasion_category": "影艺与明星活动",
      "consumer_topic_sub_occasion": [
        "电影节",
        "红毯盛典",
        "明星活动",
        "时尚盛典",
        "影视颁奖礼",
        "演唱会",
        "颁奖典礼",
        "首映活动",
        "时装周",
        "007电影纪念"
      ]
    },
    {
      "consumer_topic_occasion_category": "礼物与纪念",
      "consumer_topic_sub_occasion": [
        "送礼",
        "生日礼物",
        "情侣对表",
        "纪念日礼物",
        "升职礼物",
        "送家人礼物",
        "闺蜜礼物",
        "周年庆礼物",
        "新年礼物",
        "事业发展礼物",
        "结婚礼物",
        "订婚"
      ]
    },
    {
      "consumer_topic_occasion_category": "商业与商务",
      "consumer_topic_sub_occasion": [
        "商务佩戴",
        "商务会议",
        "商务洽谈",
        "职场通勤",
        "重要会议",
        "商务约见",
        "商业活动",
        "正式商务场合",
        "企业活动",
        "高级商务场合"
      ]
    },
    {
      "consumer_topic_occasion_category": "文化与艺术",
      "consumer_topic_sub_occasion": [
        "艺术展览",
        "博物馆之旅",
        "时尚展会",
        "收藏家活动",
        "文化沙龙",
        "拍卖会",
        "腕表下午茶",
        "音乐演出",
        "艺术园区",
        "玩表喝茶"
      ]
    },
    {
      "consumer_topic_occasion_category": "维修与保养",
      "consumer_topic_sub_occasion": [
        "手表保养",
        "维修服务",
        "更换表带",
        "机芯维护",
        "品牌维修",
        "精密维修",
        "专业保养",
        "手表翻新",
        "售后维护",
        "典当"
      ]
    },
    {
      "consumer_topic_occasion_category": "未提及",
      "consumer_topic_sub_occasion": [
        "未提及"
      ]
    }
  ]
}


### 输出内容注意事项:

#### 输出字段说明:
origin_occasion: 原始列表中的origin_occasion
consumer_topic_occasion_category: 匹配预设列表中的consumer_topic_occasion_category
consumer_topic_sub_occasion: 匹配预设列表中的consumer_topic_sub_occasion

#### 输出格式:
{
    "occasion_categories": [
        {
            "origin_occasion": "string",
            "consumer_topic_occasion_category": "string",
            "consumer_topic_sub_occasion": "string"
        }
    ]
}

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等
下面是输入数据:
