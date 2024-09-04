//0929/0904/24
import mods.gregtech.recipe.RecipeMaps;

recipes.removeByMod("appliedenergistics2");
recipes.removeByMod("aeadditions");
recipes.removeByMod("ae2stuff");
recipes.removeByMod("ae2fc");


//[组件&元件] 这段改一下，用LV的多步骤正序处理
//1K物品组件&元件
//recipes.addShaped(<appliedenergistics2:material:35>,
//    [[<ore:dustRedstone>,<ore:crystalCertusQuartz>,<ore:dustRedstone>],//红石粉,赛特斯石英,红石粉
//     [<ore:crystalCertusQuartz>,<appliedenergistics2:material:22>,<ore:crystalCertusQuartz>],//赛特斯石英,逻辑处理器,赛特斯石英
//     [<ore:dustRedstone>,<ore:crystalCertusQuartz>,<ore:dustRedstone>]]//红石粉,赛特斯石英,红石粉
//);
RecipeMap.getByName("laser_engraver").recipeBuilder()//激光蚀刻
    .inputs(<>*1)//
    .notConsumable(<>*1)//<>透镜
    .outputs(<appliedenergistics2:material:35>*1)//1K组件
    .duration(600)
    .EUt(30)
    .buildAndRegister();
recipes.addShapeless(<appliedenergistics2:material:35>,
    [<appliedenergistics2:material:36>]//4K组件
);
recipes.addShapeless(<appliedenergistics2:storage_cell_1k>,
    [<appliedenergistics2:material:39>,<appliedenergistics2:material:35>]//外壳,1K组件
);
//4K物品组件&元件
recipes.addShapeless(<appliedenergistics2:material:36>,
    [<appliedenergistics2:material:37>]//16K组件
);
recipes.addShapeless(<appliedenergistics2:storage_cell_4k>,
    [<appliedenergistics2:material:39>,<appliedenergistics2:material:36>]//外壳,4K组件
);
//16K物品组件&元件
recipes.addShapeless(<appliedenergistics2:material:37>,
    [<appliedenergistics2:material:38>]//64K组件
);
recipes.addShapeless(<appliedenergistics2:storage_cell_16k>,
    [<appliedenergistics2:material:39>,<appliedenergistics2:material:37>]//外壳,16K组件
);
//64K物品组件&元件
recipes.addShapeless(<appliedenergistics2:material:38>,
    [<aeadditions:storage.component:0>]//256K组件
);
recipes.addShapeless(<appliedenergistics2:storage_cell_64k>,
    [<appliedenergistics2:material:39>,<appliedenergistics2:material:39>]//外壳,64K组件
);
//256K物品组件&元件
recipes.addShapeless(<aeadditions:storage.component:0>,
    [<aeadditions:storage.component:1>]//1024K组件
);
recipes.addShapeless(<aeadditions:storage.physical:0>,
    [<appliedenergistics2:material:39>,<aeadditions:storage.component:0>]//外壳,256K组件
);
//1024K物品组件&元件
recipes.addShapeless(<aeadditions:storage.component:1>,
    [<aeadditions:storage.component:2>]//4096K组件
);
recipes.addShapeless(<aeadditions:storage.physical:1>,
    [<appliedenergistics2:material:39>,<aeadditions:storage.component:1>]//外壳,1024K组件
);
//4096K物品组件&元件
recipes.addShapeless(<aeadditions:storage.component:2>,
    [<aeadditions:storage.component:3>]//16384K组件
);
recipes.addShapeless(<aeadditions:storage.physical:2>,
    [<appliedenergistics2:material:39>,<aeadditions:storage.component:2>]//外壳,4096K组件
);
//16384K物品组件&元件
recipes.addShaped(<aeadditions:storage.component:3>,
    [[<ore:circuitLv>,<appliedenergistics2:material:23>,<ore:circuitLv>],//LV电路板,运算处理器,LV电路板
     [<appliedenergistics2:material:24>,<appliedenergistics2:material:35>,<appliedenergistics2:material:24>],//工程处理器 ,1K组件,工程处理器 
     [<ore:circuitLv>,<appliedenergistics2:material:23>,<ore:circuitLv>]]//LV电路板,运算处理器,LV电路板
);
recipes.addShapeless(<aeadditions:storage.physical:3>,
    [<appliedenergistics2:material:39>,<aeadditions:storage.component:3>]//外壳,16384K组件
);
//1K流体组件&元件

//4K流体组件&元件

//16K流体组件&元件

//64K流体组件&元件

//256K流体组件&元件

//1024K流体组件&元件

//4096K流体组件&元件

//石英纤维
RecipeMap.getByName("wiremill").recipeBuilder()//压线机
    .inputs(<>*1)//石英？
    .outputs(<>*1)
    .duration(100)
    .EUt(2)
    .buildAndRegister();
//ME玻璃线缆

//ME包层线缆

//ME智能线缆

//ME致密线缆

//ME致密包层线缆

//物质聚合器

//能源接收器

//能源元件

//致密能源元件

//ME箱子

//磁盘驱动器

//ME-IO端口

//ME接口

//ME流体接口

//分子装配室

//ME安全终端

//ME无线访问点

//ME量子链接仓

//ME量子环

//1K合成存储器

//4K合成存储器

//16K合成存储器

//64K合成存储器

//256K合成存储器

//1024K合成存储器

//4096K合成存储器

//16384K合成存储器

//并行处理单元

//合成监控器

//合成单元

//普通终端

//流体终端

//合成终端

//样板终端

//接口终端

//P2P通道

//输入总线

//流体输入总线

//输出总线

//流体输出总线

//存储总线

//流体存储总线

//成型面板

//流体成型面板

//破坏面板

//流体破坏面板

//精准破坏面板

//标准发信器

//流体

//触发总线

//反相

//ME存储外壳
recipes.addShaped(<appliedenergistics2:material:39>,
    [[<ore:plateSteel>,<ore:plateSteel>,<ore:plateSteel>],//钢板,钢板,钢板
     [<ore:fusedQuartz>,<appliedenergistics2:part:140>,<ore:fusedQuartz>],//石英玻璃,石英纤维,石英玻璃
     [<ore:plateSteel>,<ore:plateSteel>,<ore:plateSteel>]]//钢板,钢板,钢板
);
//陨石雷达

//空白样板

//身份卡

//工程压印模板

//逻辑压印模板

//计算压印模板

//工程处理器
//RecipeMap.getByName("forming_press").recipeBuilder()//冲压机床
//    .inputs(<ore:gemDiamond>*1)//钻石
//    .notConsumable(<>*1)//工程压印模板
//    .outputs(<>*1)
//    .duration(100)
//    .EUt(30)
//    .buildAndRegister();
//逻辑处理器

//计算处理器

//无线信号增幅器

//加速卡

//容量卡

//红石卡

//反相卡

//模糊卡

//合成卡

//显示元件

