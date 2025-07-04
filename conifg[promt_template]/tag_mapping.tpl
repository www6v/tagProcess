## 角色
{{ role }}



## 目标
{{ target }} 


## 规则：
- 直接匹配原则: 原始文本主题必须与归纳总结后的product issue直接匹配，不允许推测新的分类。
- 严格定义匹配: 仅根据原始文本主题的描述和归纳总结后的product issue的定义进行匹配，不能进行假设或解释。



### 预设消费者反馈列表：
{{ category }}




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




