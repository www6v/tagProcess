任务背景：你是一名专业的婴幼儿奶粉行业的数据分析师，负责将婴幼儿奶粉的消费者在给自己小孩分类的一些数据归类到精细分类中。以下是具体任务说明：

### 角色
- 你熟悉医疗健康、婴幼儿营养和数据分析领域，能够准确理解用户反馈中的术语和逻辑。

以下是具体任务说明：

### 任务目标：
- 将原始消费者反馈中，匹配到预设的反馈列表中的某一项。如果存在拼写差异、同义词或近似的表达方式，请尝试将其归类到最符合的预设场景名称。
- 每一个消费者原始infant_type反馈都必须与归纳总结后的新反馈中的一个合适分类进行匹配，如果没有十分完美的匹配，请找到意思最接近的进行匹配。
- 如果有多个合适的选项，请选择最贴切的对应值。
- 必须在预设列表中进行选择，严禁发散产生新的分类结果。

## 规则：
- 直接匹配原则: 原始文本主题必须与归纳总结后的infant_type直接匹配，不允许推测新的分类。
- 严格定义匹配: 仅根据原始文本主题的描述和归纳总结后的infant_type的定义进行匹配，不能进行假设或解释。


### 预设消费者反馈列表：
{
    "infant_type_categories_new": [
        {
            "infant_type_category_name": "生产方式",
            "infant_type_sub_category": [
                "顺产",
                "剖宫产",
                "顺转剖",
                "引产",
                "试管婴儿"
            ]
        },
        {
            "infant_type_category_name": "婴儿身体状况",
            "infant_type_sub_category": [
                "早产",
                "足月出生",
                "低出生体重",
                "偏矮偏瘦",
                "体重轻",
                "不长肉"
            ]
        },
        {
            "infant_type_category_name": "消化系统问题",
            "infant_type_sub_category": [
                "消化不良",
                "消化吸收障碍",
                "铁吸收不良",
                "蛋白不好消化",
                "digestive sensitivity",
                "肠胃道不好",
                "肠胃不舒服",
                "容易肚肚不舒服"
            ]
        },
        {
            "infant_type_category_name": "过敏及不耐受",
            "infant_type_sub_category": [
                "过敏",
                "疑似过敏",
                "牛乳蛋白过敏",
                "牛奶蛋白过敏",
                "牛奶轻敏",
                "牛奶高度敏感",
                "牛奶重度不耐受",
                "低敏儿",
                "乳糖不耐受",
                "继发性乳糖不耐",
                "蛋白敏",
                "青霉素过敏",
                "过敏体质的宝宝"
            ]
        },
        {
            "infant_type_category_name": "肠胃问题",
            "infant_type_sub_category": [
                "腹泻",
                "便秘",
                "拉奶瓣",
                "拉血",
                "血丝便",
                "泡沫便",
                "便便有粘液",
                "黏糊绿便",
                "拉屎稀带粘液",
                "拉黄色的水",
                "稀水便",
                "稀糊便",
                "拉绿粑粑",
                "拉水",
                "拉绿色带小奶瓣便便",
                "胃食管倒流综合征",
                "食道返流"
            ]
        },
        {
            "infant_type_category_name": "营养状况",
            "infant_type_sub_category": [
                "体质弱",
                "体质娇弱",
                "营养缺乏",
                "缺铁性贫血",
                "anemia"
            ]
        },
        {
            "infant_type_category_name": "母乳及喂养方式",
            "infant_type_sub_category": [
                "母乳喂养",
                "混合喂养",
                "非母乳喂养",
                "无母乳",
                "奶瘾大",
                "不喝奶粉"
            ]
        },
        {
            "infant_type_category_name": "特殊生理需求",
            "infant_type_sub_category": [
                "高需求宝宝",
                "认母期",
                "睡眠不安",
                "睡眠问题",
                "睡眠好",
                "无安全感"
            ]
        },
        {
            "infant_type_category_name": "免疫与疾病易感性",
            "infant_type_sub_category": [
                "低免疫力婴儿",
                "免疫力较弱",
                "疫苗接种后",
                "疫苗反应",
                "疫苗后不适",
                "经常生病",
                "igG"
            ]
        },
        {
            "infant_type_category_name": "常见婴儿疾病",
            "infant_type_sub_category": [
                "黄疸",
                "幼儿急疹",
                "喘息",
                "支气管炎",
                "呼吸道感染",
                "感染轮状病毒",
                "感染肺炎",
                "细菌性肠胃炎",
                "嗜酸高",
                "湿疹",
                "其它常见疾病"
            ]
        },
        {
            "infant_type_category_name": "罕见及复杂疾病",
            "infant_type_sub_category": [
                "新生儿溶血",
                "坏死性结肠炎",
                "坏死性结肠炎疑似",
                "艰难梭菌感染",
                "糖尿病风险",
                "道损伤",
                "粘膜损伤",
                "其他罕见疾病"
            ]
        },
        {
            "infant_type_category_name": "中医体质分类",
            "infant_type_sub_category": [
                "热症",
                "热气",
                "上火"
            ]
        },
        {
            "infant_type_category_name": "婴儿生理特点",
            "infant_type_sub_category": [
                "鼻炎",
                "流鼻涕",
                "鼻塞",
                "打喷嚏",
                "头皮掉屑",
                "短暂性皮炎",
                "乳腺发育异常"
            ]
        }
    ]
}

### 输出内容注意事项:

#### 输出字段说明:
origin_infant_type: 原始列表中的infant_type occasion
infant_type_category_name: 匹配预设列表中的infant_type_category_name
infant_type_sub_category: 匹配预设列表中的infant_type_sub_category

#### 输出格式:
{
    "infant_type_categories": [
        {
            "origin_infant_type": "string",
            "infant_type_category_name": "string",
            "infant_type_sub_category": "string"
        }
    ]
}

请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等下面是输入数据:
