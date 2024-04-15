//0921/0415/24
import mods.gregtech.recipe.RecipeMaps;

recipes.removeByMod("appliedenergistics2");
recipes.removeByMod("aeadditions");
recipes.removeByMod("ae2stuff");
recipes.removeByMod("ae2fc");

//ME存储外壳
recipes.addShaped(<appliedenergistics2:material:39>,
    [[<ore:fusedQuartz>,<ore:dustRedstone>,<ore:fusedQuartz>],//石英玻璃,红石粉,石英玻璃
     [<ore:dustRedstone>,null,<ore:dustRedstone>],//红石粉,空,红石粉
     [<ore:ingotIron>,<ore:ingotIron>,<ore:ingotIron>]]//铁锭,铁锭,铁锭
);

//[组件&元件]
//[物品]
//1K
recipes.addShaped(<appliedenergistics2:material:35>,
    [[<ore:dustRedstone>,<ore:crystalCertusQuartz>,<ore:dustRedstone>],//红石粉,赛特斯石英,红石粉
     [<ore:crystalCertusQuartz>,<appliedenergistics2:material:22>,<ore:crystalCertusQuartz>],//赛特斯石英,逻辑处理器,赛特斯石英
     [<ore:dustRedstone>,<ore:crystalCertusQuartz>,<ore:dustRedstone>]]//红石粉,赛特斯石英,红石粉
);
recipes.addShapeless(<appliedenergistics2:material:35>,
    [<appliedenergistics2:material:36>]//4K组件
);
recipes.addShapeless(<appliedenergistics2:storage_cell_1k>,
    [<appliedenergistics2:material:39>,<appliedenergistics2:material:35>]//外壳,1K组件
);
//4K
recipes.addShapeless(<appliedenergistics2:material:36>,
    [<appliedenergistics2:material:37>]//16K组件
);
recipes.addShapeless(<appliedenergistics2:storage_cell_4k>,
    [<appliedenergistics2:material:39>,<appliedenergistics2:material:36>]//外壳,4K组件
);
//16K
recipes.addShapeless(<appliedenergistics2:material:37>,
    [<appliedenergistics2:material:38>]//64K组件
);
recipes.addShapeless(<appliedenergistics2:storage_cell_16k>,
    [<appliedenergistics2:material:39>,<appliedenergistics2:material:37>]//外壳,16K组件
);
//64K
recipes.addShapeless(<appliedenergistics2:material:38>,
    [<aeadditions:storage.component:0>]//256K组件
);
recipes.addShapeless(<appliedenergistics2:storage_cell_64k>,
    [<appliedenergistics2:material:39>,<appliedenergistics2:material:39>]//外壳,64K组件
);
//256K
recipes.addShapeless(<aeadditions:storage.component:0>,
    [<aeadditions:storage.component:1>]//1024K组件
);
recipes.addShapeless(<aeadditions:storage.physical:0>,
    [<appliedenergistics2:material:39>,<aeadditions:storage.component:0>]//外壳,256K组件
);
//1024K
recipes.addShapeless(<aeadditions:storage.component:1>,
    [<aeadditions:storage.component:2>]//4096K组件
);
recipes.addShapeless(<aeadditions:storage.physical:1>,
    [<appliedenergistics2:material:39>,<aeadditions:storage.component:1>]//外壳,1024K组件
);
//4096K
recipes.addShapeless(<aeadditions:storage.component:2>,
    [<aeadditions:storage.component:3>]//16384K组件
);
recipes.addShapeless(<aeadditions:storage.physical:2>,
    [<appliedenergistics2:material:39>,<aeadditions:storage.component:2>]//外壳,4096K组件
);
//16384K
recipes.addShaped(<aeadditions:storage.component:3>,
    [[<ore:circuitLv>,<appliedenergistics2:material:23>,<ore:circuitLv>],//LV电路板,运算处理器,LV电路板
     [<appliedenergistics2:material:24>,<appliedenergistics2:material:35>,<appliedenergistics2:material:24>],//工程处理器 ,1K组件,工程处理器 
     [<ore:circuitLv>,<appliedenergistics2:material:23>,<ore:circuitLv>]]//LV电路板,运算处理器,LV电路板
);
recipes.addShapeless(<aeadditions:storage.physical:3>,
    [<appliedenergistics2:material:39>,<aeadditions:storage.component:3>]//外壳,16384K组件
);

//[流体]
//1K

//4K

//16K

//64K

//256K

//1024K

//4096K


//设备
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

//[合成存储器]
//1K

//4K

//16K

//64K

//256K

//1024K

//4096K

//16384K

//并行处理单元

//合成监控器

//合成单元

//终端

//流体

//合成

//样板

//接口

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


//[材料]
//[压印模板]
//硅

//工程

//逻辑

//计算

//[电路板]
//硅

//工程

//逻辑

//计算

//[处理器]
//工程

//逻辑

//计算
