任务背景：你是一名苹果公司Mac产品的调研员，以下是用户对于笔记本电脑产品讨论的属性列表和现有的关键词列表。

    任务目标：
    1. 对以下属性列表进行归纳，生成新的关键词列表，要求：
        - 归纳后的关键词应涵盖所有属性，并具有概括性。
        - 如果现有关键词列表中有不适合的项，可以删减或修改。
        - 如果发现新的重要类别，需新增适当的一级或二级类目。
        - 优化后的分类不重叠且简洁明了，避免冗余。

    2. 新的关键词列表应在语义上全面且独立。

    3. 重要限制：
        - 新的一级属性（Level1_attributes_new）数量请勿超出30个。
        - 每个一级属性下的二级属性（Level2_attributes_new）请勿超出10个。

    
严格要求：
    -属性列表是基于历史关键词形成的一个列表，需要同时结合属性列表以及当前关键词，综合判断新的关键词列表的输出。
    -当当前关键词中出现全新类目时，首先检查该类目是否属于和可合并进已有属性列表的一级或二级属性列表。
    -若类目属于已存在与属性列表的一级属性，但没有在二级属性中，则将其加入适当的二级属性列表。
    -若类目为全新属性（即未在现有一级属性列表中出现），则添加为一级属性，并相应地为其定义适合的二级属性。
    -一致性校验：在生成结果前，校验输出的标签是否符合规则，避免一级和二级属性跨类目或冗余的情况。
    -标签唯一性：标签只能归属于一个一级类目，同一个标签不要跨一级属性和二级属性重复出现。
    -删除冗余属性：移除那些可以被其他属性涵盖的二级属性。
    -重新分类：如果某些二级属性更适合放在其他一级属性下，请进行调整。
    - 避免模糊分类：删除所有模糊或不明确的二级属性，如“未知”、“其他”等。
    - 合并策略：对于相似的一级以及二级属性，可以通过合并来减少数量。例如二级属性中，“屏幕亮度”和“亮度控制”可以合并为“屏幕亮度”。
    - 在必要情况下删除低频属性：删除使用频率较低或重要性较低的一级或二级属性，以确保一级属性不超过30个，每个一级属性下的二级属性不超过10个。


   
 输入数据：
    - 属性列表：
        Level1_attributes_new_Level2_attributes_new
{
  "Level1_attributes_new": [
    {
      "category": "硬件性能",
      "Level2_attributes_new": [
        "处理器性能",
        "显卡性能",
        "内存规格",
        "存储容量",
        "散热性能",
        "硬件稳定性",
        "屏幕质量",
        "声卡配置",
        "网卡性能",
        "GPU性能"
      ]
    },
    {
      "category": "产品质量",
      "Level2_attributes_new": [
        "耐用性",
        "外壳质量",
        "摄像头故障",
        "屏幕问题",
        "硬件故障",
        "产品稳定性",
        "外观设计",
        "硬件可靠性",
        "接口问题",
        "屏幕耐久度"
      ]
    },
    {
      "category": "使用体验",
      "Level2_attributes_new": [
        "系统流畅性",
        "续航能力",
        "操作复杂度",
        "键盘功能",
        "屏幕亮度",
        "便携性",
        "网络连接",
        "生态体验",
        "多任务处理",
        "散热噪音"
      ]
    },
    {
      "category": "软件兼容性",
      "Level2_attributes_new": [
        "专业软件支持",
        "应用兼容性",
        "系统工具支持",
        "教育软件支持",
        "虚拟机安装",
        "第三方工具支持",
        "游戏兼容性",
        "CAD软件支持",
        "音乐制作兼容",
        "办公应用兼容"
      ]
    },
    {
      "category": "操作系统",
      "Level2_attributes_new": [
        "系统稳定性",
        "MacOS习惯",
        "Windows兼容性",
        "系统更新问题",
        "启动管理器问题",
        "快捷键操作",
        "文件管理体验",
        "登录问题",
        "系统安全与稳定",
        "图标异常"
      ]
    },
    {
      "category": "购买决策",
      "Level2_attributes_new": [
        "性价比考量",
        "价格评估",
        "配置与性能",
        "产品评价",
        "适用场景评估",
        "新旧产品比较",
        "品牌信任",
        "促销活动",
        "延保服务",
        "适用性探讨"
      ]
    },
    {
      "category": "售后服务",
      "Level2_attributes_new": [
        "维修体验",
        "保修政策",
        "售后响应效率",
        "AppleCare+服务",
        "故障诊断",
        "维修成本",
        "客服沟通",
        "备用机服务",
        "维权过程",
        "全程支持"
      ]
    },
    {
      "category": "配件与拓展",
      "Level2_attributes_new": [
        "屏幕膜选择",
        "保护壳与内胆包",
        "拓展坞需求",
        "充电器兼容性",
        "背包兼容性",
        "外接键盘兼容性",
        "配件搭配",
        "耳机需求",
        "扩展配件",
        "备用配件"
      ]
    },
    {
      "category": "娱乐体验",
      "Level2_attributes_new": [
        "追剧体验",
        "视频播放效果",
        "游戏性能",
        "渲染效果",
        "影音体验",
        "云电脑游戏",
        "显示效果",
        "色彩准确性",
        "屏幕尺寸",
        "震动反馈"
      ]
    },
    {
      "category": "学术与工作",
      "Level2_attributes_new": [
        "论文写作",
        "办公效率",
        "生产力提升",
        "远程协作",
        "跨设备协同",
        "教育用途",
        "软件推荐",
        "AI训练支持",
        "系统优化",
        "图片处理能力"
      ]
    }
  ]
}

##输出格式：
请返回一组新的关键词列表,注意直接返回json，不需要详细解释原因，结构如下：
{
  "Level1_attributes_new": [
    {
      "category": string,
      "Level2_attributes_new": [
        string,
        string
      ] 
    }
  ]
}

##下面是输入数据：
{"original_attr": [{"level_1_attr": "安全性", "level_2_attr": "文件保险箱功能"}, {"level_1_attr": "软件兼容性", "level_2_attr": "电脑管家重装问题"}, {"level_1_attr": "使用状况", "level_2_attr": "外观状态"}, {"level_1_attr": "使用状况", "level_2_attr": "保修状态"}, {"level_1_attr": "使用场景", "level_2_attr": "办公使用"}, {"level_1_attr": "软件兼容性", "level_2_attr": "磁盘格式问题"}, {"level_1_attr": "购买体验", "level_2_attr": "欺诈行为"}, {"level_1_attr": "硬件配置", "level_2_attr": "显卡替换"}, {"level_1_attr": "软件功能", "level_2_attr": "自动保存"}, {"level_1_attr": "系统稳定性", "level_2_attr": "图标响应"}, {"level_1_attr": "产品特性", "level_2_attr": "手写笔支持"}, {"level_1_attr": "使用指南", "level_2_attr": "验机流程"}, {"level_1_attr": "功能检测", "level_2_attr": "系统设置"}, {"level_1_attr": "购买决策", "level_2_attr": "教育优惠"}, {"level_1_attr": "软件资源", "level_2_attr": "软件下载"}, {"level_1_attr": "软件资源", "level_2_attr": "软件推荐"}, {"level_1_attr": "硬件问题", "level_2_attr": "鼠标操作"}, {"level_1_attr": "显示效果", "level_2_attr": "柔光屏技术"}, {"level_1_attr": "便携性", "level_2_attr": "重量与尺寸"}, {"level_1_attr": "绘画功能", "level_2_attr": "绘画应用"}, {"level_1_attr": "产品状态", "level_2_attr": "全新未拆封"}, {"level_1_attr": "使用体验", "level_2_attr": "系统运行缓慢"}, {"level_1_attr": "产品状况", "level_2_attr": "损坏维修"}, {"level_1_attr": "软件应用", "level_2_attr": "清理工具"}, {"level_1_attr": "用户体验", "level_2_attr": "速度提升"}, {"level_1_attr": "硬件配置", "level_2_attr": "硬盘类型"}, {"level_1_attr": "硬件配置", "level_2_attr": "屏幕特性"}, {"level_1_attr": "硬件配置", "level_2_attr": "电池状态"}, {"level_1_attr": "系统兼容性", "level_2_attr": "iOS镜像功能"}, {"level_1_attr": "系统兼容性", "level_2_attr": "iOS版本升级"}, {"level_1_attr": "购买决策", "level_2_attr": "兼容性考虑"}, {"level_1_attr": "购买决策", "level_2_attr": "性能稳定性"}, {"level_1_attr": "产品购买", "level_2_attr": "平板购买"}, {"level_1_attr": "产品比较", "level_2_attr": "联想vs惠普"}, {"level_1_attr": "使用体验", "level_2_attr": "硬件故障"}, {"level_1_attr": "售后服务", "level_2_attr": "换新退货流程"}, {"level_1_attr": "使用体验", "level_2_attr": "性能下降"}, {"level_1_attr": "售后服务", "level_2_attr": "清理服务"}, {"level_1_attr": "笔记本电脑", "level_2_attr": "双系统支持"}, {"level_1_attr": "笔记本电脑", "level_2_attr": "用户群体"}, {"level_1_attr": "笔记本电脑", "level_2_attr": "外接显示器兼容性"}, {"level_1_attr": "笔记本电脑", "level_2_attr": "游戏性能"}, {"level_1_attr": "产品质量", "level_2_attr": "开箱即故障"}, {"level_1_attr": "售后服务", "level_2_attr": "退款纠纷"}, {"level_1_attr": "系统操作", "level_2_attr": "终端设置"}, {"level_1_attr": "使用体验", "level_2_attr": "设计与作图"}, {"level_1_attr": "产品状态", "level_2_attr": "二手闲置"}, {"level_1_attr": "性能稳定性", "level_2_attr": "应用程序响应"}, {"level_1_attr": "系统兼容性", "level_2_attr": "多设备联动"}, {"level_1_attr": "购买决策", "level_2_attr": "品牌比较"}, {"level_1_attr": "产品价值", "level_2_attr": "性价比"}, {"level_1_attr": "产品特性", "level_2_attr": "3K屏效果"}, {"level_1_attr": "产品特性", "level_2_attr": "空间音效"}, {"level_1_attr": "产品配件", "level_2_attr": "键盘膜使用"}, {"level_1_attr": "产品配件", "level_2_attr": "外壳保护膜使用"}, {"level_1_attr": "使用场景", "level_2_attr": "日常通勤"}, {"level_1_attr": "外观设计", "level_2_attr": "时尚美观"}, {"level_1_attr": "购买指导", "level_2_attr": "品牌选择"}, {"level_1_attr": "购买体验", "level_2_attr": "退税流程"}, {"level_1_attr": "产品选择", "level_2_attr": "性能需求"}, {"level_1_attr": "购买渠道", "level_2_attr": "售后服务"}, {"level_1_attr": "购买渠道", "level_2_attr": "价格优惠"}, {"level_1_attr": "性价比与售后服务", "level_2_attr": "高价低配"}, {"level_1_attr": "性价比与售后服务", "level_2_attr": "售后差评"}, {"level_1_attr": "产品质量与售后服务", "level_2_attr": "质量问题"}, {"level_1_attr": "产品质量与售后服务", "level_2_attr": "售后政策"}, {"level_1_attr": "售后服务", "level_2_attr": "人为损坏保修"}, {"level_1_attr": "售后服务", "level_2_attr": "工程师态度"}, {"level_1_attr": "软件兼容性", "level_2_attr": "软件下载问题"}, {"level_1_attr": "软件兼容性", "level_2_attr": "官方软件来源"}, {"level_1_attr": "产品兼容性", "level_2_attr": "生态整合"}, {"level_1_attr": "产品购买", "level_2_attr": "价格优势"}, {"level_1_attr": "考试准备", "level_2_attr": "设备兼容性"}, {"level_1_attr": "考试准备", "level_2_attr": "操作系统选择"}, {"level_1_attr": "考试准备", "level_2_attr": "摄像头位置"}, {"level_1_attr": "售后服务", "level_2_attr": "维修质量"}, {"level_1_attr": "售后服务", "level_2_attr": "沟通体验"}, {"level_1_attr": "购买决策", "level_2_attr": "价格优惠"}, {"level_1_attr": "购买决策", "level_2_attr": "补贴政策"}, {"level_1_attr": "购买决策", "level_2_attr": "性价比分析"}, {"level_1_attr": "购买决策", "level_2_attr": "促销活动"}, {"level_1_attr": "产品评估", "level_2_attr": "软件问题"}, {"level_1_attr": "使用体验", "level_2_attr": "学习用途"}, {"level_1_attr": "产品比较", "level_2_attr": "与iPad对比"}, {"level_1_attr": "故障排除", "level_2_attr": "充电问题"}, {"level_1_attr": "故障排除", "level_2_attr": "静电问题"}, {"level_1_attr": "使用体验", "level_2_attr": "操作系统适应"}, {"level_1_attr": "硬件配置", "level_2_attr": "屏幕质量"}, {"level_1_attr": "硬件配置", "level_2_attr": "网络连接"}, {"level_1_attr": "考试准备", "level_2_attr": "操作系统要求"}, {"level_1_attr": "使用体验", "level_2_attr": "发热情况"}, {"level_1_attr": "使用体验", "level_2_attr": "触屏功能"}, {"level_1_attr": "使用体验", "level_2_attr": "稳定性"}, {"level_1_attr": "购买决策", "level_2_attr": "便携性"}, {"level_1_attr": "使用体验", "level_2_attr": "材料质量"}, {"level_1_attr": "购买决策", "level_2_attr": "操作系统适应性"}, {"level_1_attr": "使用体验", "level_2_attr": "分屏功能"}, {"level_1_attr": "使用体验", "level_2_attr": "屏幕素质"}, {"level_1_attr": "租赁服务", "level_2_attr": "电脑租赁"}, {"level_1_attr": "租赁服务", "level_2_attr": "手机租赁"}, {"level_1_attr": "电脑购买", "level_2_attr": "数字媒体适用"}, {"level_1_attr": "游戏性能", "level_2_attr": "高端游戏本"}, {"level_1_attr": "使用场景", "level_2_attr": "游戏娱乐"}, {"level_1_attr": "游戏性能", "level_2_attr": "游戏本"}, {"level_1_attr": "使用场景", "level_2_attr": "商务办公"}, {"level_1_attr": "便携性", "level_2_attr": "轻薄本"}, {"level_1_attr": "使用体验", "level_2_attr": "搭配显示器"}, {"level_1_attr": "性能表现", "level_2_attr": "软件兼容性"}, {"level_1_attr": "用户体验", "level_2_attr": "稳定性"}, {"level_1_attr": "售后服务", "level_2_attr": "维修政策"}, {"level_1_attr": "产品历史", "level_2_attr": "发布事件"}, {"level_1_attr": "产品评价", "level_2_attr": "新品满意度"}, {"level_1_attr": "购买体验", "level_2_attr": "发货时效"}, {"level_1_attr": "产品评价", "level_2_attr": "等待体验"}, {"level_1_attr": "产品评价", "level_2_attr": "接口稳定性"}, {"level_1_attr": "销售信息", "level_2_attr": "产品状态"}, {"level_1_attr": "购买体验", "level_2_attr": "功能需求"}, {"level_1_attr": "维修服务", "level_2_attr": "官方售后鉴别"}, {"level_1_attr": "使用体验", "level_2_attr": "连接手机教程"}, {"level_1_attr": "购买决策", "level_2_attr": "购买渠道"}, {"level_1_attr": "硬件性能", "level_2_attr": "CPU温度"}, {"level_1_attr": "产品寿命", "level_2_attr": "使用年限"}, {"level_1_attr": "性能测试", "level_2_attr": "游戏兼容性"}, {"level_1_attr": "故障解决", "level_2_attr": "技术问题"}, {"level_1_attr": "连接性", "level_2_attr": "电脑连接"}, {"level_1_attr": "娱乐应用", "level_2_attr": "电视观看"}, {"level_1_attr": "购物体验", "level_2_attr": "价格优惠"}, {"level_1_attr": "商品状态确认", "level_2_attr": "退货商品辨别"}, {"level_1_attr": "手写笔兼容性", "level_2_attr": "手写笔支持"}, {"level_1_attr": "产品质量问题", "level_2_attr": "闪屏黑屏"}, {"level_1_attr": "售后服务", "level_2_attr": "客服响应"}, {"level_1_attr": "维修成本", "level_2_attr": "显卡维修费用"}, {"level_1_attr": "故障与维修", "level_2_attr": "进水修复"}, {"level_1_attr": "使用体验", "level_2_attr": "双屏办公"}, {"level_1_attr": "性能与配置", "level_2_attr": "i7处理器"}, {"level_1_attr": "存储容量", "level_2_attr": "1T硬盘"}, {"level_1_attr": "硬件升级", "level_2_attr": "固态硬盘兼容性"}, {"level_1_attr": "硬件故障", "level_2_attr": "蓝屏事故"}, {"level_1_attr": "设备性能", "level_2_attr": "发热问题"}, {"level_1_attr": "设备性能", "level_2_attr": "卡顿"}, {"level_1_attr": "耐用性", "level_2_attr": "摄像头易碎"}, {"level_1_attr": "技术问题", "level_2_attr": "初始化失败"}, {"level_1_attr": "操作系统", "level_2_attr": "屏幕镜像"}, {"level_1_attr": "使用体验", "level_2_attr": "系统兼容性"}, {"level_1_attr": "使用体验", "level_2_attr": "安装步骤"}, {"level_1_attr": "使用体验", "level_2_attr": "耐用性"}, {"level_1_attr": "使用体验", "level_2_attr": "数据安全性"}, {"level_1_attr": "购买体验", "level_2_attr": "折扣信息"}, {"level_1_attr": "软件更新", "level_2_attr": "操作系统"}, {"level_1_attr": "软件应用", "level_2_attr": "快捷指令"}, {"level_1_attr": "使用帮助", "level_2_attr": "软件应用"}, {"level_1_attr": "使用问题", "level_2_attr": "界面显示"}, {"level_1_attr": "购买政策", "level_2_attr": "教育优惠"}, {"level_1_attr": "使用体验", "level_2_attr": "界面布局"}, {"level_1_attr": "系统配置", "level_2_attr": "操作系统版本"}, {"level_1_attr": "产品建议", "level_2_attr": "尺寸需求"}, {"level_1_attr": "使用体验", "level_2_attr": "电池寿命"}, {"level_1_attr": "性价比", "level_2_attr": "价格优惠"}, {"level_1_attr": "购买决策", "level_2_attr": "新品试用"}, {"level_1_attr": "售后服务", "level_2_attr": "屏幕故障"}, {"level_1_attr": "售后服务", "level_2_attr": "键盘故障"}, {"level_1_attr": "选购指南", "level_2_attr": "轻薄本介绍"}, {"level_1_attr": "选购指南", "level_2_attr": "游戏本推荐"}, {"level_1_attr": "使用体验", "level_2_attr": "散热问题"}, {"level_1_attr": "使用体验", "level_2_attr": "硬件连接"}, {"level_1_attr": "销售信息", "level_2_attr": "二手交易"}, {"level_1_attr": "技术求助", "level_2_attr": "设备兼容性"}, {"level_1_attr": "技术求助", "level_2_attr": "系统性能"}, {"level_1_attr": "音质体验", "level_2_attr": "音质不错"}, {"level_1_attr": "舒适性", "level_2_attr": "舒适性好"}, {"level_1_attr": "功能特性", "level_2_attr": "主动降噪"}, {"level_1_attr": "软件兼容性", "level_2_attr": "达芬奇启动问题"}, {"level_1_attr": "软件管理", "level_2_attr": "软件卸载困难"}, {"level_1_attr": "游戏性能", "level_2_attr": "运行稳定性"}, {"level_1_attr": "产品状况", "level_2_attr": "使用时间"}, {"level_1_attr": "产品状况", "level_2_attr": "维护状态"}, {"level_1_attr": "操作系统问题", "level_2_attr": "macOS与Win11兼容性"}, {"level_1_attr": "网络连接", "level_2_attr": "校园网认证"}, {"level_1_attr": "互联兼容性", "level_2_attr": "华为电脑互联"}, {"level_1_attr": "互联兼容性", "level_2_attr": "荣耀100pro互联"}, {"level_1_attr": "使用体验", "level_2_attr": "PIN登录故障"}, {"level_1_attr": "购买体验", "level_2_attr": "折扣优惠"}, {"level_1_attr": "产品特性", "level_2_attr": "护眼屏幕"}, {"level_1_attr": "用户体验", "level_2_attr": "设计美观"}, {"level_1_attr": "用户体验", "level_2_attr": "性能局限"}, {"level_1_attr": "性能配置", "level_2_attr": "RTX4060独显"}, {"level_1_attr": "性能配置", "level_2_attr": "锐龙R78745H处理器"}, {"level_1_attr": "显示效果", "level_2_attr": "144Hz高色域屏"}, {"level_1_attr": "外观设计", "level_2_attr": "颜色选择"}, {"level_1_attr": "销售信息", "level_2_attr": "价格信息"}, {"level_1_attr": "设备兼容性", "level_2_attr": "SD卡读取"}, {"level_1_attr": "使用体验", "level_2_attr": "初次咨询"}, {"level_1_attr": "外观设计", "level_2_attr": "一见钟情的美感"}, {"level_1_attr": "性能表现", "level_2_attr": "速度与响应"}, {"level_1_attr": "使用体验", "level_2_attr": "办公效率"}, {"level_1_attr": "电池性能", "level_2_attr": "过热担忧"}, {"level_1_attr": "性价比", "level_2_attr": "价格优势"}, {"level_1_attr": "使用体验", "level_2_attr": "设计与图形"}, {"level_1_attr": "使用体验", "level_2_attr": "编程与开发"}, {"level_1_attr": "配件推荐", "level_2_attr": "外置硬盘"}]}
