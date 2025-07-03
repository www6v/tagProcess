任务背景：你是一名专业的婴幼儿奶粉行业的数据分析师，负责将婴幼儿奶粉的消费者在讨论到婴幼儿奶粉产品的一些occasion数据归类到精细分类中。以下是具体任务说明：

### 角色
- 你熟悉医疗健康、婴幼儿营养和数据分析领域，能够准确理解用户反馈中的术语和逻辑。

以下是具体任务说明：

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
  "occasion_categories_new": [
    {
      "occasion_category_name": "时间相关喂养",
      "occasion_sub_category": [
        "起床冲奶",
        "白天喂奶",
        "晚餐后喂奶",
        "晚上睡前喂奶",
        "夜奶喂养"
      ]
    },
    {
      "occasion_category_name": "空间相关场景",
      "occasion_sub_category": [
        "家中喂奶",
        "幼儿园喂奶",
        "医院内喂养",
        "商场购物时喂奶",
        "月子中心喂养",
        "医院产房",
        "工作场所喂奶"
      ]
    },
    {
      "occasion_category_name": "喂养方式",
      "occasion_sub_category": [
        "奶瓶喂养",
        "量杯喂养",
        "勺喂",
        "滴管喂奶",
        "母乳结合奶粉喂养",
        "温水喂奶",
        "少量多次喂奶",
        "混喂",
        "坐着喂奶",
        "拍嗝时喂奶"
      ]
    },
    {
      "occasion_category_name": "消费行为",
      "occasion_sub_category": [
        "奶粉紧急补充",
        "囤货过年",
        "旅行应急奶粉",
        "抢购奶粉",
        "深夜抢奶粉",
        "直邮",
        "购买及收货"
      ]
    },
    {
      "occasion_category_name": "特殊情况喂养",
      "occasion_sub_category": [
        "断奶期喂养",
        "湿疹期间喂奶",
        "便秘期间喂奶",
        "感冒期间喂奶",
        "肠胃不适喂养",
        "智齿发炎喂奶",
        "母乳不足奶粉喂养",
        "离乳期喂养",
        "疫苗后护理",
        "喂药",
        "母乳转奶粉或奶粉品牌转换"
      ]
    },
    {
      "occasion_category_name": "记录与分享",
      "occasion_sub_category": [
        "日常育儿记录",
        "观察宝宝饮食情况",
        "喂养后清理",
        "加奶量"
      ]
    },
    {
      "occasion_category_name": "社交相关场景",
      "occasion_sub_category": [
        "带宝宝外出约饭",
        "朋友聚会喂奶",
        "家庭互动喂养",
        "临时带娃喂奶",
        "外出带娃吃饭"
      ]
    },
    {
      "occasion_category_name": "家庭休闲活动",
      "occasion_sub_category": [
        "洗澡后喂奶",
        "户外放松后喂奶",
        "出门游乐场喂奶",
        "晚上带宝宝外出",
        "睡前按摩",
        "宝宝大哭"
      ]
    },
    {
      "occasion_category_name": "医疗相关场景",
      "occasion_sub_category": [
        "产后恢复喂养",
        "住院期间喂养",
        "术后恢复喂奶",
        "医生建议喂养",
        "候诊时冲奶粉",
        "产后康复",
        "待产中",
        "儿保",
        "打疫苗时"
      ]
    },
    {
      "occasion_category_name": "孕期及新生儿阶段",
      "occasion_sub_category": [
        "新生儿初乳喂养",
        "出生后第一天喂奶",
        "月子期喂奶",
        "剖腹产后喂奶",
        "产后开奶",
        "刚出生"
      ]
    },
    {
      "occasion_category_name": "旅行与外出",
      "occasion_sub_category": [
        "旅行时喂奶",
        "自驾出行喂奶",
        "高速喂奶",
        "冬天回老家",
        "搭飞机时喂奶",
        "车内喂奶"
      ]
    },
    {
      "occasion_category_name": "辅食喂养",
      "occasion_sub_category": [
        "辅食添加期喂养",
        "辅食结合奶粉喂养",
        "母乳过渡奶粉",
        "辅食添加初期"
      ]
    },
    {
      "occasion_category_name": "冲泡与存储",
      "occasion_sub_category": [
        "温奶器加热奶粉",
        "微波炉加热奶粉",
        "提前泡奶",
        "室温水冲奶粉",
        "冰箱储存奶粉",
        "奶瓶保温",
        "泡奶过程",
        "直接喝冰箱里拿出来的冰牛奶"
      ]
    },
    {
      "occasion_category_name": "季节性喂养",
      "occasion_sub_category": [
        "秋冬天喂奶",
        "春夏天喂奶",
        "寒冷天气冲泡奶粉",
        "低温喂奶",
        "湿度低时喂奶",
        "寒冬腊月的小北风",
        "持续恒温"
      ]
    }
  ]
}

### 输出内容注意事项:

#### 输出字段说明:
origin_occasion: 原始列表中的origin occasion
occasion_category_name: 匹配预设列表中的occasion_category_name
occasion_sub_category: 匹配预设列表中的occasion_sub_category

### 输出格式:
{
    "occasion_categories": [
        {
            "origin_occasion": "string",
            "occasion_category_name": "string",
            "occasion_sub_category": "string"
        }
    ]
}

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等
下面是输入数据:
