任务背景：

你是一位国际香精原材料供应商的数据分析师，以下是用户提及护肤品品牌时提到的品牌名列表（origin_brand_chi_origin_brand_eng），但该列表中的品牌名存在不规范的命名情况，属于非官方的中文直译或者音译。

任务目标：
    1. 对用户提及品牌名列表进行识别，从【official_brand_chi_official_brand_eng】中选择正确规范的品牌名，生成新的品牌名列表，要求：
    • 必须从【official_brand_chi_official_brand_eng】中选择
    • 如果在【official_brand_chi_official_brand_eng】中找不到对应的品牌，则返回”未知”
    2. 重要限制：
    • 必须基于【official_brand_chi_official_brand_eng】中存在的品牌名进行选择，不允许发散产生新的值
    • 综合考虑【origin_brand_chi_origin_brand_eng】的描述，包括中文直译、音译或英文品牌名，判断与【official_brand_chi_official_brand_eng】的对应关系
    • 如果在当前列表中找不到对应品牌名，请考虑音译情况谨慎判断

官方品牌名列表：
- official_brand_chi_official_brand_eng
玉兰油
珀莱雅
雅诗兰黛
兰蔻
修丽可
自然堂
薇诺娜
娇韵诗
资生堂
一叶子
雅顿
城野医生
娇兰
圣罗兰
科颜氏
羽素
上水和肌
修正
欧莱雅
达尔肤
百植萃
毕生之研
凡士林
理肤泉
溪木源
赫莲娜
倩碧
SK-II
兰亭
芙清
Naco
羽西
馥蕾诗
丸美
韩束
欧诗漫
谷雨
朴理
Takami
悦诗风吟
欧珀莱
绿色农场
肌肤未来
妮维雅
菜鸟和配方师
稚优泉
The Ordinary
春日来信
百雀羚
美人符
ONCUR
Haa
肌活
诠润
相宜本草
蓓安亲研
芙蓉肌
宝拉珍选
天使之颜
ddg
Laboratorios Vinas
露得清
惜玥
李医生
肌肤之钥
儒意
创尔美
雅因子
PMPM
林清轩
朵梵
旁氏
皮宝
海蓝之谜
高姿
美帕
药都仁和
润百颜
优色林
雅漾
VHA
乐敦
肌漾
慕拉得
梦妆
颐莲
敷尔佳
泊本
瑷尔博士
薇姿
HBN
Deva
欧舒丹
欧敏肤
优斐斯
致己新颜
透真
玉泽
植物医生
得嫚媞
优时颜
凯诗薇
神秘博士
Missface
雪花秀
阿芙
野兽代码
树予
韩方五谷
若美欣
大宝
芷轩堂
善草纪
靓黛里
牛尔
碧欧泉
布兰朵
欧邦琪
迷奇
迪凯瑞
研译
枫缇
阿古丽娅
爱兰歌娜
肤漾
兰芝
MIXX
逐本
全澳
玛蒂德肤
大水滴
植美村
米加
博乐达
天露芬
后
希妍萃
丁家宜
因嫩生
艾诺碧
HKH
春娟
一期一会
欧缇丽
黛珂
大曾
碧莲达
季岚朵
韩后
芙清密钥
佰花方
米蓓尔
贝欧梦特
植然方适
孔凤春
里季
莱依诗
Ning
水密码
舜姿堂
田中升
春纪
艾酸氏
悦木之源
无语
初霓
怡丽丝尔
馥珮
MALIN+GOETZ
佰草集
美康粉黛
玛丽欧倍思酷
科瑞肤
兰
HFP
赫拉
维特丝
吾样
光希
D&18
蝶莲娜
禾宝
EHC
Noreva
宿系之源
凡可
凌博士
透蜜
德玛润
黛莱皙
可贝尔
澳容
泊美
苏菲娜
科兰黎
珂诺诗
金丝玉帛
片仔癀
渡美
东方婵妆
海璞诺
植露萃岸
醉象
京润珍珠
小迷糊
梵贞
沫润
圣歌兰
三月理
自然之名
必扬
Evm
9wishes
悦芙媞
Mettler
鲜即
瑷科缦
俊平
怡思丁
安素可
菲洛嘉
Medature
萃乐活
珀芙研
拾颜
果本
如薇
硬核男士
庆翠堂
依蔻庭
迪奥
境生之源
坤岚
爱碧生
花皙蔻
AOEO
蒂佳婷
WIS
贝伊丝
珞蓓诗
缤肌
雪玲妃
绽媄娅
汝新美肌
素野
芝碧
花肌粹
雏菊的天空
彤人秘
法兰琳卡
春夏
希芸
肤纯
马应龙
Haku
蜂花
瓷肌
NKB ZERO
玛丽黛佳
纽西之谜
瑞莱欧
芳丹薄罗
菂桠
VC
JOVISSE
宝缇卡
茱莉蔻
郑明明
Cellex-C
译龄
安妍科
香奈儿
伊贝诗
珂润
彤生泉
德宜芙
真颜分子
膜法世家
水之印
麦吉丽
早寻
澳诗茉
安美
爱和纯
果壳
德德维芙
兰乔氏
美肤宝
934
芯丝翠
Choose
肤见
安多可
皙岛
标婷
伊索
温碧泉
丝塔芙
色娜娜
伊诗贝格
勃朗圣泉
俪纳斯
Sesderma
天地慈
瑞沛
蝶翠诗
三生花
甄然
泽曼诗
阿玛尼
HNSW
多特博士
曼秀雷敦
爱神菲
爱珂黛美
希恩派
欧树
宝龄丽碧雅
Theralady
格兰玛弗兰
科颜萃
泊紫汀兰
御泥坊
墨荟
安安金纯
赫丽尔斯
成分星球
赫妍
雪缇坊
专妍
悦慕心情
柏氏
芙芙
安沐珂
芮生
黛优佳
蔚伊思
奈皙
阿奴
酷配酷研
夕拉
C咖
创福康
蝶芙兰
白云山
雾屿森林
慕特博士
海洋主义
阿彼芙
优资莱
迪迈诗
悦朵丝
美美的天空
海的美宝
洛诗秀
葆丽匙
吾相
可复美
尚本肌源
苏秘37°
茵芙莎
优理氏
Missvnine
瑞波琴
欧伶莱
雪肌精
昭贵
Cocochi
梦莉娇
达安美肌
柔恩莱
丽蕾克
温博士
适乐肤
凯伊秀
Sumdoy
克米拉
妮蓓丹
Isana
TJE
秘色草
花酿
XOVE
御银座
玥之秘
肌先知
稀物集
欧露莲
葆玛之谜
佰草百丽
强生
采词
Zelens
然作
迪仕艾普
魔盒
Lululun
格丽松
厘雅
松达
瑞铂希
佑天兰
欣兰
Augeido
阿道夫
小理博士
进化论
珂丝艾丝
秋水长天
芳珂
欧蕙
城市花匠
芷豆
蓝尼芳可
Tuco
松山油脂
Portbuddy
Skisgem
美素
ARR
Unio
安娜贝拉
碧迪思
帕澳
莎娜
溯华
拾颜轨迹
冰菊
春雨
花水匠
TVLV
WSMM
芙丽芳丝
素萃
无名极物
欧贝斯
飞天牡丹
Pixi
嘉兰杜汀
瑷露德玛
BH
滋色
爱怡美
海洋诗韵
罗美诗
伊思
贵州百灵
赫艾迩
佰珍堂
法莫娜
Soonsoonplus
丹姿
千艺
娜丽丝
克丽缇娜
瑾泉
戴可思
贝玲妃
佰草世家
安茹
自然兰
花印
兰瑟
齐叶雅
ONTOP
爱目
贝诗佳
凡茜
欧束菲
英树
清妍
韩伊
乐理
泊蝶
青雨纪
初夏堂
博生能
海龟爸爸
澳兰黛
美斯蒂克
Boscia
美即
芙莉美娜
夸迪
锐变
Iry
MVE
丽颜世家
益若翼
TATCHA
欧泉琳
自然乐园
百奈子
柯泰儿
寻荟记
仙蒂奈儿
韩律
杰威尔
莱珀妮
拉薇
Boam
如意源
名膜壹号
泊肌原
优姿婷
森田
万物秀
安婕妤
琪雅
月明微露
嫒色
AromeManpo
美法扎
Honest
卡丝
妈妈宝贝
汇美舍
优露美
思亲肤
Creerbeaute
古缇娜
至本
配方至上
璃悦
南袖
自然旋律
奥兰芝
琪瑟
GIK
卡兰度
芝兰密语
Ahava
美丽蓓菲
艾西儿医生
欧臻廷
诗宁
体顺
协和
谜草集
嘉娜宝
Wlab
珀希妍
漏泽春
原辰
Sepai
黛世希
米澳拉
蜜丝婷
美肌颜
双妹
Nuilaa
黛格娜
VT
爱诗魅
斐思妮
卓玛护士
豆妃
诗婷露雅
蜜浓
瑷丝特兰
梵可清
比度克
梵蜜琳
珊珂
诗黛尔
梵洁诗
依美晴
得鲜
维特
韩熙贞
沫芮
云惜
纨素之肤
施颜适
南京同仁堂
伊诗兰顿
汉芳
谢馥春
Lza
皇后的秘密
七绿
Sosolee
美丽赞
伊蒂凡
美迪惠尔
盖百霖
潘达
新面孔
英氏
屈臣氏
迷莲卡薇
完子心选
咪咕哈啦
采诗
花令
澳尔滨
伊肤泉
泽润芳
蒂诗颜
德美乐
郁美净
纪梵希
养生堂
土家硒泥坊
朗斯
嘉媚乐
依沙氏
爱多康
希思黎
安媞珀
MIAO YAN FAMILY
JAMAY
奥蜜思
圣雪兰
Yerentang
皙俪思
翡拉帕丽
舒友阁
玫瑰颂
玛茜
纳芳香
莱贝
ZFC
安格琪
绽妍
芪白草
RSAS
伊蒂之屋
惑丽客
HYSHOT
乐百分
雅丽洁
张大奕
薇风
北极之源
美黎汎
启然
蔚蓝之美
养乐多
真丽斯
兰可欣
军博仕
帕玛氏
思婉妮可可
欧花集
蜜梨
苾莱宝
黛尔珀
薇诗澜
Lilia
宝丽
爱茉诗
石泽研究所
AB.LAB
利维肤
春阳博士
碧研菲
芭比波朗
妆蕾
肌肤哲理
泊舒
极美
娇润泉
雅琪诺
卓沿
蒂迩肌
韩瑟
美颜坊
Zi Royal
荀草密语
水木花草
草木之心
薇氏赫尔
京东京造
千纤草
艾玛丝
长生鸟
万般微颜
艾珂薇
爱熙
肌肤之食
隆力奇
瑞妍
可丽金
SCUPIN
卡贝露
凛希
肌律
星期四农庄
依科美
活泉雅
笛乐妃
科洱美
博优研
女巫季节
霏丝佳
Andwarm
雅芳
慕斯女孩
庭润
云南白药
我的美丽日记
姬芮
婵茜
梵西
魔女工厂
高丝
秀肤生
海洋至尊
丽欧蓓莉
婷美
斯维诗
简单叶子
德美丝
法沫溪
Sakose
诺卜
安唯伊
悦碧施
蓝秀
施奈芙
斯黛娜
秘决
Skin79
亲草
完美日记
Infinitealoe
高丽雅娜
Agesa
希川科颜
歌瑞法
极地之悦
宠爱之名
韩缪
艾惟诺
肌司研
安娜柏林
柏卡姿
皙玥
丽普司肽
小沁
左艺
袋鼠妈妈
精心
华瑞凯琳
宫中秘策
乐丝
夏洛特
霍普实验室
欧丽源
Mikiplum
丝芙兰
Lzq
韩水仙
Ren
Homa
Oshadhi
娥佩兰
冰溪
亚缇克兰
Dreamtimes
比芭美
欧橘
美蒂菲
芊茗草
尔木萄
丝纯
氧肤时光
好肌茵
法儿曼
伊芳妮
橘后
植观
时光肌
玖美堂
H18
贝德玛
涂酷
吾诺
奥伦纳素
韩雅
原生密码
John Jeff
比亚芬
史努比
苏小安妮
津尔氏
卡莱美
皙阁
德妃
Omorovicza
法素茜
海蓝朵
绿毛怪怪
言之有物
安肌心语
柏瑞特
Cats Lin
九叶草
久冈制药
Ceruru.b
无印良品
美伊娜多
艾诗缇
健美创研
玫莉蔻
Dsd
肌琳莎
AIBI
老中医
美体小铺
艾康博
师任堂
奥兰诺
兰嘉丝汀
珂谧
京卫本草
美加净
诗蒂兰
绝色
欧佩
艾天然
朵拉朵尚
赫诗琴
观梨
可莱尼
庭秘密
安弥儿
UZU pro
StriVectin
德玛森氏
妍诗美
靓邦素
黛安蒂
韩纪
捷俊
Mtmetatron
达肤妍
笛爱儿
天使羽翼
一清堂
品绣玫瑰
博姿
简魅
裴礼康
初蔓
欧菲姿
薇俪兰
诗馨语
爱敬
施巴
舒研玑
半亩花田
墨雅
满婷
珂洛帝斯
香缇卡
里海之谜
柏翠丝
舒仟
奕沃
诗肤理
贝亲
季德胜
第十四章
研肤所
格莱魅
毛戈平
宫芙
优上
茉贝丽思
奥洛菲
帕妃雯
缪斯水仙
娜斯
肌研
英诺
红色小象
宝弘
馥家
HABA
岚舒
科丽妍
莉芙泉
泉兮
澳芝曼
东边野兽
佰魅伊人
肌美精
润本
瑞斐时
一理润
递欧
伊帕尔汗
蒂珀碧
100%Pure
玳珈
季肤爽
三草两木
赫斯丽
北京同仁堂
悠宜
资莱皙
佰草童话
三橡树
法缇奥
胡庆余堂
碧素堂
伊露莹
媞乐媞乐
依泉
心清堂
橘朵
菲诗小铺
宝罗丝丹
芳香天使
亮达
瑞斯美
COCO AMELIA
急护美人
祖玛珑
意高
香娜露儿
自颜源露
丽得姿
婷美小屋
丽芝雅
纽乐葆
自然攻略
CPB
善自然
AHC
儿初宝
添妃
伊菲丹
OHBT
DOYES
NARS
RNW
贝德美
伊施蔓
韩舜妆
一页
Evereden
三式
加州宝宝
启初
臻羞
赫恩
Bonpoint
红木兰
oiu
法尔曼
青蛙王子
永芳
茶自然
嗳乐蓓贝
男主角
花寂
APKH
保贝一千
澳莱莉
索耶
植皙妮
yaby
冬禾
雅姿
安修泽
碧芭宝贝
黎汀集
御白妍
木屿诗
唐诗
梵洛纹
欧瑞莲
薇尔佳
芙源
ROTISS
TWG
基理
丁芙妮
AHN
evelom
ipsa
悦薇
莱伯妮
卡姿兰
白雅浏
莱蔻
丸碧
Dr.Jart+
Lush
植村秀
稳健医疗
高夫
贝熙迦儿

输出格式：

请返回【origin_brand_chi_origin_brand_eng】和【official_brand_chi_official_brand_eng】的对应关系，格式如下：
{
  "mappings": [
    {
      "origin_brand_chi_origin_brand_eng": "string",
      "official_brand_chi_official_brand_eng": "string"
    }
  ]
}

注意：
  1. 如果无法匹配，请返回 "official_brand_chi_official_brand_eng": "未知"；
  2. 禁止输出【official_brand_chi_official_brand_eng】列表外的值；
  3. 优先考虑中英文对应的音译、直译匹配。

输入示例：
用户品牌提及列表：
- [origin_brand_chi]
香奈儿


请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等.
下面是输入数据:
