任务背景：你是一名专业的婴幼儿奶粉行业的数据分析师，负责将婴幼儿奶粉的消费者对于婴幼儿奶粉产品的一些product issue问题反馈数据归类到精细分类中。以下是具体任务说明：

### 角色
- 你熟悉医疗健康、婴幼儿营养和数据分析领域，能够准确理解用户反馈中的术语和逻辑。

以下是具体任务说明：

### 任务目标：
- 将原始消费者反馈中，匹配到预设的反馈列表中的某一项。如果存在拼写差异、同义词或近似的表达方式，请尝试将其归类到最符合的预设场景名称。
- 每一个消费者原始product issue反馈都必须与归纳总结后的新反馈中的一个合适分类进行匹配，如果没有十分完美的匹配，请找到意思最接近的进行匹配。
- 如果有多个合适的选项，请选择最贴切的对应值。
- 必须在预设列表中进行选择，严禁发散产生新的分类结果。

## 规则：
- 直接匹配原则: 原始文本主题必须与归纳总结后的product issue直接匹配，不允许推测新的分类。
- 严格定义匹配: 仅根据原始文本主题的描述和归纳总结后的product issue的定义进行匹配，不能进行假设或解释。


### 预设消费者反馈列表：
{
  "product_issue_categories_new": [
    {
      "product_issue_category_name": "配方组成",
      "product_issue_sub_category": [
        "蛋白质类型",
        "乳糖含量",
        "低聚糖含量",
        "棕榈油添加",
        "益生菌成分",
        "氨基酸配方",
        "HMO含量",
        "水解蛋白",
        "特殊配方成分",
        "添加剂问题",
        "配方成分争议"
      ]
    },
    {
      "product_issue_category_name": "产品质量",
      "product_issue_sub_category": [
        "食品安全风险",
        "真假问题",
        "品控问题",
        "质量一致性",
        "产品瑕疵",
        "异物风险",
        "标签及标准",
        "掺假问题",
        "皂基成分",
        "回收奶粉"
      ]
    },
    {
      "product_issue_category_name": "感官体验",
      "product_issue_sub_category": [
        "口味浓淡",
        "甜度问题",
        "腥味问题",
        "奶香不足",
        "气味异常",
        "颗粒感",
        "颜色变化",
        "奶泡问题",
        "酸味",
        "焦糖颗粒"
      ]
    },
    {
      "product_issue_category_name": "营养功能",
      "product_issue_sub_category": [
        "营养成分含量低",
        "营养吸收问题",
        "铁吸收率",
        "热量影响",
        "体重管理",
        "长期饮用风险",
        "糖分过高",
        "碘含量低",
        "乳桥蛋白含量",
        "提高免疫力"
      ]
    },
    {
      "product_issue_category_name": "喂养适应性",
      "product_issue_sub_category": [
        "消化不适",
        "便秘问题",
        "绿便现象",
        "乳糖不耐受",
        "牛奶蛋白过敏",
        "过敏反应",
        "肠胀气",
        "吸收不良",
        "奶粉上火",
        "频繁夜奶"
      ]
    },
    {
      "product_issue_category_name": "冲泡体验",
      "product_issue_sub_category": [
        "溶解度",
        "泡沫问题",
        "挂壁现象",
        "搅拌均匀度",
        "兑奶复杂",
        "水温要求",
        "需要摇晃",
        "结块问题",
        "冲泡说明不清晰",
        "高浓度泡奶问题"
      ]
    },
    {
      "product_issue_category_name": "供应链管理",
      "product_issue_sub_category": [
        "供应变动",
        "试用装短缺",
        "市场波动",
        "缺货",
        "销售渠道问题",
        "库存管理",
        "物流问题",
        "运输损坏",
        "产能不足",
        "缺货涨价"
      ]
    },
    {
      "product_issue_category_name": "价格体系",
      "product_issue_sub_category": [
        "价格高",
        "价格波动",
        "促销活动不稳定",
        "溢价问题",
        "成本负担",
        "价格与质量匹配",
        "国产奶粉价格",
        "利润低",
        "特配奶粉价格贵",
        "调价问题"
      ]
    },
    {
      "product_issue_category_name": "包装与设计",
      "product_issue_sub_category": [
        "包装密封性",
        "勺子设计问题",
        "盖子质量",
        "存储便利性",
        "奶嘴堵塞",
        "刻度线清晰度",
        "奶瓶刻度问题",
        "产品规格变更",
        "刮勺设计不佳",
        "盖子松动",
        "包装外观设计",
        "配件清洁问题"
      ]
    },
    {
      "product_issue_category_name": "渠道与销售",
      "product_issue_sub_category": [
        "销售渠道稳定性",
        "品牌信任度",
        "市场监管",
        "产品推荐准确性",
        "推销问题",
        "购买难度",
        "虚假宣传",
        "营销策略疑虑",
        "市场需求变化",
        "广告营销成本"
      ]
    },
    {
      "product_issue_category_name": "服务体验",
      "product_issue_sub_category": [
        "售后服务",
        "客服质量",
        "退换货政策",
        "积分兑换规则",
        "活动复杂度",
        "购买便利性",
        "消费者权益",
        "虚假广告",
        "承诺未兑现",
        "指导不足"
      ]
    },
    {
      "product_issue_category_name": "使用过程",
      "product_issue_sub_category": [
        "存储影响口感",
        "阶段适应性",
        "奶粉浪费",
        "保质期争议",
        "开封后存储",
        "长期存储问题",
        "水质要求",
        "存储方式不便",
        "超热水影响",
        "营养流失担忧"
      ]
    },
    {
      "product_issue_category_name": "用户反馈",
      "product_issue_sub_category": [
        "宝宝不喜欢喝",
        "食用后健康状况",
        "产品类别误解",
        "选择困惑",
        "不符合预期",
        "品牌体验",
        "用户口碑",
        "购买决策难",
        "推荐机制单一",
        "家长满意度"
      ]
    },
    {
      "product_issue_category_name": "原料与产地",
      "product_issue_sub_category": [
        "奶源不同",
        "奶源质量影响",
        "基奶类型",
        "产地差异",
        "国产与进口对比",
        "奶源纯净度",
        "原料成分疑虑",
        "奶粉来源透明度",
        "国产替代可能性",
        "奶源可追溯性"
      ]
    },
    {
      "product_issue_category_name": "存储与运输",
      "product_issue_sub_category": [
        "保质期不稳定",
        "临期产品担忧",
        "运输条件问题",
        "温湿度影响",
        "仓储条件",
        "物流损坏",
        "运输安全性",
        "开封后变质",
        "冷藏需求",
        "异地追溯限制"
      ]
    }
  ]
}


### 输出内容注意事项:

#### 输出字段说明:
origin_product_issue: 原始列表中的origin_product_issue
product_issue_category_name: 匹配预设列表中的product_issue_category_name
product_issue_sub_category: 匹配预设列表中的product_issue_sub_category

#### 输出格式:
{
    "product_issue_categories": [
        {
            "origin_product_issue": "string",
            "product_issue_category_name": "string",
            "product_issue_sub_category": "string"
        }
    ]
}

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等
下面是输入数据:
