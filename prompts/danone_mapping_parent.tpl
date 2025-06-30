任务背景：你是一名专业的婴幼儿奶粉行业的数据分析师，负责将婴幼儿奶粉的消费者对于自身的一些parent issue问题反馈数据归类到精细分类中。以下是具体任务说明：

### 角色
- 你熟悉医疗健康、婴幼儿营养和数据分析领域，能够准确理解用户反馈中的术语和逻辑。

以下是具体任务说明：

### 任务目标：
- 将原始消费者反馈中，匹配到预设的反馈列表中的某一项。如果存在拼写差异、同义词或近似的表达方式，请尝试将其归类到最符合的预设场景名称。
- 每一个消费者原始parent issue反馈都必须与归纳总结后的新反馈中的一个合适分类进行匹配，如果没有十分完美的匹配，请找到意思最接近的进行匹配。
- 如果有多个合适的选项，请选择最贴切的对应值。
- 必须在预设列表中进行选择，严禁发散产生新的分类结果。

## 规则：
- 直接匹配原则: 原始文本主题必须与归纳总结后的parent issue直接匹配，不允许推测新的分类。
- 严格定义匹配: 仅根据原始文本主题的描述和归纳总结后的parent issue的定义进行匹配，不能进行假设或解释。


### 预设消费者反馈列表：
{
    "parent_issue_categories_new": [
        {
            "parent_issue_category_name": "心理健康与情绪管理",
            "parent_issue_sub_category": [
                "心理考验",
                "心理落差",
                "心理状态",
                "精神内核和自我认知",
                "内心愧疚感",
                "急躁",
                "心态不稳",
                "家长焦虑",
                "家人焦虑",
                "长期困扰"
            ]
        },
        {
            "parent_issue_category_name": "喂养方式与管理",
            "parent_issue_sub_category": [
                "喂养意愿",
                "选奶困惑",
                "喂养成本估算",
                "冲泡温度",
                "泡奶、保温杯不便携",
                "段数选择困惑",
                "喝奶方式不当",
                "宝宝自身不爱喝奶粉",
                "母乳替代选择",
                "奶粉转换"
            ]
        },
        {
            "parent_issue_category_name": "营养与消化健康",
            "parent_issue_sub_category": [
                "宝宝吸收",
                "宝宝饮食变化",
                "奶量上不去",
                "奶水量",
                "宝宝喝水少",
                "口感适应性",
                "味道太腥",
                "味道不好接受",
                "新鲜度",
                "浪费心理"
            ]
        },
        {
            "parent_issue_category_name": "宝宝成长与健康",
            "parent_issue_sub_category": [
                "遗传",
                "体检结果解读",
                "医生诊断差异",
                "健康问题",
                "其它宝宝成长问题"
            ]
        },
        {
            "parent_issue_category_name": "安全与环境因素",
            "parent_issue_sub_category": [
                "带娃回家风险",
                "超载担忧",
                "安全座椅安装复杂性",
                "停车困难"
            ]
        },
        {
            "parent_issue_category_name": "家庭关系与育儿支持",
            "parent_issue_sub_category": [
                "家庭分工问题",
                "代际沟通",
                "代际差异",
                "控制欲",
                "依赖他人",
                "与月嫂的关系",
                "不舍得断奶"
            ]
        },
        {
            "parent_issue_category_name": "商品与供应链问题",
            "parent_issue_sub_category": [
                "品控问题",
                "产品细节了解",
                "品牌信任危机",
                "品牌依赖",
                "欺诈担忧",
                "母婴店无货",
                "购买渠道获取",
                "购物决策困难",
                "购买意向"
            ]
        },
        {
            "parent_issue_category_name": "医疗资源与健康管理",
            "parent_issue_sub_category": [
                "医生信任度",
                "医生可靠性",
                "医生态度差",
                "医疗服务质量",
                "体检结果解读",
                "选择医院的困扰",
                "观察等待",
                "用药膏效果不佳"
            ]
        },
        {
            "parent_issue_category_name": "宝宝行为与睡眠",
            "parent_issue_sub_category": [
                "夜醒",
                "整夜不睡",
                "认母期",
                "观察宝宝行为"
            ]
        },
        {
            "parent_issue_category_name": "经济负担与消费决策",
            "parent_issue_sub_category": [
                "价格便宜",
                "喂养成本估算",
                "消费需求",
                "推销担忧",
                "雇佣成本",
                "生活负担"
            ]
        },
        {
            "parent_issue_category_name": "职业与工作平衡",
            "parent_issue_sub_category": [
                "育儿嫂水平",
                "育儿嫂需求",
                "阿姨质量",
                "阿姨能力不行"
            ]
        },
        {
            "parent_issue_category_name": "母乳喂养与产后恢复",
            "parent_issue_sub_category": [
                "吸奶器使用",
                "母乳意愿",
                "哺乳疲劳",
                "通乳痛苦",
                "乳头皱裂疼痛",
                "胸部胀痛",
                "挤奶痛苦",
                "排奶问题",
                "断奶困惑",
                "断奶闹心",
                "产后恢复",
                "身材恢复"
            ]
        },
        {
            "parent_issue_category_name": "物流与服务体验",
            "parent_issue_sub_category": [
                "服务质量不满",
                "服务认知差异",
                "选择合适购买渠道",
                "运费成本高",
                "退换货难易度"
            ]
        }
    ]
}

### 输出内容注意事项:

#### 输出字段说明:
origin_parent_issue: 原始列表中的parent issue
parent_issue_category_name: 匹配预设列表中的parent_issue_category_name
parent_issue_sub_category: 匹配预设列表中的parent_issue_sub_category

#### 输出格式:
{
    "parent_issue_categories": [
        {
            "origin_parent_issue": "string",
            "parent_issue_category_name": "string",
            "parent_issue_sub_category": "string"
        }
    ]
}

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等
下面是输入数据:
