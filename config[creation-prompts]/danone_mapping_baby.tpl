任务背景：你是一名专业的婴幼儿奶粉行业的数据分析师，负责将婴幼儿奶粉的消费者对于婴幼儿相关的的一些issue问题反馈数据归类到精细分类中。以下是具体任务说明：

### 角色
- 你熟悉医疗健康、婴幼儿营养和数据分析领域，能够准确理解用户反馈中的术语和逻辑。

以下是具体任务说明：

### 任务目标：
- 将原始消费者反馈中，匹配到预设的反馈列表中的某一项。如果存在拼写差异、同义词或近似的表达方式，请尝试将其归类到最符合的预设场景名称。
- 每一个消费者原始baby issue反馈都必须与归纳总结后的新反馈中的一个合适分类进行匹配，如果没有十分完美的匹配，请找到意思最接近的进行匹配。
- 如果有多个合适的选项，请选择最贴切的对应值。
- 必须在预设列表中进行选择，严禁发散产生新的分类结果。

## 规则：
- 直接匹配原则: 原始文本主题必须与归纳总结后的baby issue直接匹配，不允许推测新的分类。
- 严格定义匹配: 仅根据原始文本主题的描述和归纳总结后的baby issue的定义进行匹配，不能进行假设或解释。


### 预设消费者反馈列表：
{
    "baby_issue_categories_new": [
        {
            "baby_issue_category_name": "消化系统问题",
            "baby_issue_sub_category": [
                "消化不良",
                "脾胃负担",
                "肠胃不适",
                "肠胃发育慢",
                "腹胀",
                "渗透压高引起不适",
                "肠道菌群混乱",
                "益生菌流失",
                "容易吐"
            ]
        },
        {
            "baby_issue_category_name": "排便异常",
            "baby_issue_sub_category": [
                "大便形状异常",
                "便便变色",
                "拉肚子",
                "大便次数异常",
                "大便奶瓣",
                "黏液便",
                "便秘",
                "拉血丝便",
                "排胎便",
                "持续性稀便"
            ]
        },
        {
            "baby_issue_category_name": "生长发育",
            "baby_issue_sub_category": [
                "成长速度异常",
                "体重增长缓慢",
                "个头不高",
                "囟门未闭合",
                "走路发育迟缓",
                "生长停滞",
                "长个不增重"
            ]
        },
        {
            "baby_issue_category_name": "喂养问题",
            "baby_issue_sub_category": [
                "奶量摄入异常",
                "吃奶时间异常",
                "吸吮能力弱",
                "喂养频率不规则",
                "吃得过快",
                "不认奶瓶",
                "喂养量过多担忧",
                "换奶粉不适应",
                "拒绝冻奶"
            ]
        },
        {
            "baby_issue_category_name": "过敏与不耐受",
            "baby_issue_sub_category": [
                "乳糖不耐受",
                "食物过敏",
                "血糖不耐受",
                "免疫耐受异常"
            ]
        },
        {
            "baby_issue_category_name": "呼吸系统问题",
            "baby_issue_sub_category": [
                "喉软管发育异常",
                "嗓子问题",
                "呼吸道不适",
                "反复流鼻涕",
                "哮喘",
                "肺炎"
            ]
        },
        {
            "baby_issue_category_name": "感染与免疫",
            "baby_issue_sub_category": [
                "免疫力弱",
                "抵抗力异常",
                "白细胞异常",
                "接种疫苗"
            ]
        },
        {
            "baby_issue_category_name": "皮肤问题",
            "baby_issue_sub_category": [
                "敏感皮肤",
                "尿布红疹",
                "嘴唇起皮",
                "短暂性皮炎",
                "屁股红到破皮"
            ]
        },
        {
            "baby_issue_category_name": "睡眠问题",
            "baby_issue_sub_category": [
                "入睡困难",
                "夜间频繁醒来",
                "奶睡习惯"
            ]
        },
        {
            "baby_issue_category_name": "营养素缺乏",
            "baby_issue_sub_category": [
                "钙含量不足",
                "维生素异常",
                "血糖异常",
                "体重正常偏瘦"
            ]
        },
        {
            "baby_issue_category_name": "口腔与牙齿问题",
            "baby_issue_sub_category": [
                "咬奶头",
                "其它口腔与牙齿问题"
            ]
        },
        {
            "baby_issue_category_name": "适应性问题",
            "baby_issue_sub_category": [
                "换奶适应性差",
                "不适应喂养方式"
            ]
        },
        {
            "baby_issue_category_name": "体格特征",
            "baby_issue_sub_category": [
                "体型偏瘦",
                "宝宝个头小"
            ]
        },
        {
            "baby_issue_category_name": "神经与心智发育",
            "baby_issue_sub_category": [
                "智力发育问题",
                "社交行为发展",
                "情绪波动大"
            ]
        },
        {
            "baby_issue_category_name": "其他健康问题",
            "baby_issue_sub_category": [
                "尿液颜色异常",
                "寒冷影响",
                "挂壁情况",
                "结块挂壁",
                "手部损伤",
                "割伤"
            ]
        }
    ]
}

### 输出内容注意事项:

#### 输出字段说明:
origin_baby_issue: 原始列表中的origin_baby_issue
baby_issue_category_name: 匹配预设列表中的baby_issue_category_name
baby_issue_sub_category: 匹配预设列表中的baby_issue_sub_category

#### 输出格式:
{
    "baby_issue_categories": [
        {
            "origin_baby_issue": "string",
            "baby_issue_category_name": "string",
            "baby_issue_sub_category": "string"
        }
    ]
}

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等
下面是输入数据:
