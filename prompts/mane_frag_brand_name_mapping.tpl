任务背景：

你是一位国际香精原材料供应商的数据分析师，以下是用户提及香水品牌时提到的品牌名列表（origin_brand_chi_origin_brand_eng），但该列表中的品牌名存在不规范的命名情况，属于非官方的中文直译或者音译。

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
芦丹氏_Serge Lutens
解放橘郡_Etat Libre d'Orange
恺芮得_Creed
凯利安_Kilian
馥马尔香水出版社_Frederic Malle
柏芮朵_Byredo
欧珑_Atelier Cologne
阿蒂仙之香_L'Artisan Parfumeur
爱慕_Amouage
帕尔玛之水_Acqua di Parma
梅森·马吉拉_Maison Margiela
思琳_Celine
佩枪朱丽叶_Juliette Has A Gun
香水实验室_Le Labo
山本耀司_Yohji Yamamoto
潘海利根_Penhaligon's
马蒂埃_Matiere Premiere
杜鲁萨迪_Trussardi
艾卡柏_Acca Kappa
华伦天奴_Valentino
拉夫劳伦_Ralph Lauren
萧邦_Chopard
杰尼亚_Ermenegildo Zegna
希思黎_Sisley
卡地亚_Cartier
蒂芙尼_Tiffany
川久保玲_Comme des Garcons
桃丝熊_Tous
古特尔_Goutal
菲拉格慕_Salvatore Ferragamo
高缇耶_Jean Paul Gaultier
约翰·瓦维托斯_John Varvatos
杰弗里·比尼_Geoffrey Beene
路易威登_Louis Vuitton
卡朗_Caron
穆格勒_Mugler
普拉达_Prada
葆蝶家_Bottega Veneta
雅诗兰黛_Estée Lauder
宾利_Bentley
万宝龙_Montblanc
纪梵希_Givenchy
保罗史密斯_Paul Smith
梵克雅宝_Van Cleef & Arpels
达西塔香氛_Parfums Dusita
缪缪_Miu Miu
阿特金森_Atkinsons
徕汀_Lydeen
动物学家_Zoologist Perfumes
沙伊蓝_Shay & Blue London
嗅觉映像室_Olfactive Studio
罗马之香_Profumum Roma
杜木之香_Fragrance du Bois
雅克·亨利_Henry Jacques
迪拜精神_The Spirit of Dubai
罗嘉德芬_Roja Dove
威劳瑞希_Lorenzo Villoresi
罗格朗_Oriza L. Legrand
面具_Masque Milano
CB我讨厌香水_CB I Hate Perfume
杰奎斯·菲斯_Jacques Fath
兰蔻_Lancome
莫杰_Marc Jacobs
橘滋_Juicy Couture
伊丽莎白雅顿_Elizabeth Arden
大卫杜夫_Davidoff
浪凡_Lanvin
罗意威_Loewe
凯文克莱_Calvin Klein
古驰_Gucci
纳西索_Narciso Rodriguez
凯卓_Kenzo
三宅一生_Issey Miyake
蔻依_Chloe
圣罗兰_YSL Yves Saint Laurent
范思哲_Versace
博柏利_Burberry
莱俪_Lalique
安娜苏_Anna Sui
阿玛尼_Giorgio Armani
迪奥_Dior
祖玛珑_Jo Malone
汤姆·福特_Tom Ford
宝格丽_Bvlgari
香奈儿_Chanel
娇兰_Guerlain
爱马仕_Hermes
蒙塔莱_Montale
米勒博涛斯_Miller et Bertaux
卡普里岛_Carthusia
香水故事_Histoires de Parfums
鲁宾_Lubin
茉若森（威尼斯精品香氛）_Monotheme
蝴蝶工匠_Papillon Artisan Perfumes
陶尔之香_Tauer Perfumes
MDCI之香_MDCI Parfums
希爵夫_Xerjoff
圣塔玛利亚诺维拉_Santa Maria Novella
非凡制造_The Different Company
莎邦_Chabaud Maison de Parfum
液态创想_Liquides Imaginaires
卡萨莫拉蒂_Casamorati Dal1888
门蒂托洛萨_Mendittorosa
玫默_Memo
米勒·海莉诗_Miller Harris
帝国之香_Parfum d'Empire
祖氏挚爱_Jo Loves
瑪麗之香_Parfums de Marly
詹姆斯·海利_James Heeley
尼柯徕（尼古莱）_Nicolai
弗拉潘_Frapin
梵诗柯香_Maison Francis Kurkdjian
纳斯马图_Nasomatto
克霖_Clean
蒂普提克_Diptyque
6IXTY 8IGHT_6IXTY 8IGHT
艾斯迷_Ace Miss
安米娜_Anmyna
奥兰诺_Oranot
巴格黎_Paorri
巴莉奥_Barrio
柏迪芬_Patifon
贝莫婷_Bemoton
玻儿_Populart
茶香师_Cha Sense
初蔓_Chuman
春风十里_Ten Miles of Spring Breeze
大内密探_Majesty's Secret
丹蔓妮_Danmani
迪蜜特_Demeter
递欧_Deold
RE调香室_RE Classified
多彩丽人_colorful beauties
法颂_Fenshine
芬尚_Torsmell
高夫_GF
古蔻_Gucor
古势_Gsoul
冠群芳_Crown Qunfang
黑爪_Black Paw
后_Whoo
花知晓_Flower Knows
汇香坊_Scent House
简魅_Jianmei
健美创研_M'aycreate
橘朵_Judy Doll
克里斯提·鲁布托_Christian Louboutin
兰可欣_Lcosin
蓝秀_Lanxiu
勒颂蒂诺_L’essence Des Notes
零壹零陆_Zero one zero six
鎏婳书_Liuhuashu
美奥迪菲_Myosotis
美康粉黛_Meiking
美茜儿_Maycheer
魅力资_Meilizi
名创优品_Miniso
名蓝_Minglan
摩登巴赫_Modern Bath Art
女王驾道_Queen's style
欧丽源_Oilyoung
派雪_Pa Pase
潘达_Panda
泊诗蔻_ROYAL APOTHIC
泊紫汀兰_Bozitingdan
七绿_Seven Green
全澳_Quanao
儒意_Ruyi
锐变_Ruibian
三兔_Santu
三熹玉_Sanxiyu
姗那贝拉_scenabella
神英_Shenying
舒友阁_Shvyog
述之有味_Fragrance for space
水木花草_Shuimuhuacao
特希露_Texilu
无用享乐_Wuyongxiangle
希汀_Yvetti
心愿先生_Mr.wish
雪尔妮兰_Sellion
寻香之旅_Scent Tour
亚菲儿_Lauyfee
叶圣西_叶圣西香水
奕香_Carlotta
张大奕_BigEve
滋色_ZEESEA
自然目录_Nature Edition
AUF_AUF
Blings_Blings
C2U_C2U
Cheerflor_Cheerflor
Colorrose_Colorrose
Croxx_Croxx
Foellie_Foellie
FPF_FPF
Gudu_Gudu
ImSole_ImSole
伊索_Aesop
野兽派_The Beast
雅芳_Avon
五朵里_Uttori
闻献_Documents
味谷_Wegoo
维维尼奥_Vivinevo
维多利亚的秘密_Victoria's Secret
圣美伦_Susanne Lang
飒拉_Zara
气味图书馆_Scent Library
七寸九_Sept Neuf EDP
朴悦然_Adopt
欧舒丹_L'Occitane en Provence
美体小铺_The Body Shop
岚舒_Lush
蔻驰_Coach
科颜氏_Kiehl's
吉尔斯图亚特_Jill Stuart
观夏_To summer
馥生六记_Fushengliuji
茶灵_Cha Ling
冰希黎_Boitown
柏氛_Bon Parfumeur
阿迪达斯_Adidas
触肌_TTOUCHME
托卡_Tocca
索里气味_Solinotes
布雷布车间_Atelier Rebul
4711_4711
JEAN MISS_JEAN MISS
JEP_JeanneEnProvence
KDK_KDK
Sakose_Sakose
TJE_TJE
V.V.LOVE_V.V.LOVE
VNK_VNK

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
- [origin_brand_chi]_[origin_brand_eng]
香奈儿_Chanel


请严格遵守上述格式，除此之外不要返回任何其他内容，包括解释、说明、分析过程等等.
下面是输入数据:
