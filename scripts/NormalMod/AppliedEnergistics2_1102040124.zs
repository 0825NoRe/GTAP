import mods.gregtech.recipe.RecipeMaps;
import scripts.Misc.CraftingScript_Static;

recipes.removeByMod("appliedenergistics2");
recipes.removeByMod("aeadditions");
recipes.removeByMod("ae2stuff");
recipes.removeByMod("ae2fc");

//ME存储外壳


//[组件&元件 (1 to 16384 to 4096...)]
//[物品]
//1K

A = <appliedenergistics2:material:39>;//外壳
B = <appliedenergistics2:material:35>;//组件
recipes.addShapeless(<appliedenergistics2:storage_cell_1k>,
    [A,B]
);
//4K
A = <appliedenergistics2:material:37>;//组件
recipes.addShapeless(<appliedenergistics2:material:36>,
    [A]
);
A = <appliedenergistics2:material:39>;//外壳
B = <appliedenergistics2:material:36>;//组件
recipes.addShapeless(<appliedenergistics2:storage_cell_4k>,
    [A,B]
);
//16K
A = <appliedenergistics2:material:38>;//组件
recipes.addShapeless(<appliedenergistics2:material:37>,
    [A]
);
A = <appliedenergistics2:material:39>;//外壳
B = <appliedenergistics2:material:37>;//组件
recipes.addShapeless(<appliedenergistics2:storage_cell_16k>,
    [A,B]
);
//64K
A = <aeadditions:storage.component:0>;//组件
recipes.addShapeless(<appliedenergistics2:material:38>,
    [A]
);
A = <appliedenergistics2:material:39>;//外壳
B = <appliedenergistics2:material:39>;//组件
recipes.addShapeless(<appliedenergistics2:storage_cell_64k>,
    [A,B]
);
//256K
A = <aeadditions:storage.component:1>;//组件
recipes.addShapeless(<aeadditions:storage.component:0>,
    [A]
);
A = <appliedenergistics2:material:39>;//外壳
B = <aeadditions:storage.component:0>;//组件
recipes.addShapeless(<aeadditions:storage.physical:0>,
    [A,B]
);
//1024K
A = <aeadditions:storage.component:2>;//组件
recipes.addShapeless(<aeadditions:storage.component:1>,
    [A]
);
A = <appliedenergistics2:material:39>;//外壳
B = <aeadditions:storage.component:1>;//组件
recipes.addShapeless(<aeadditions:storage.physical:1>,
    [A,B]
);
//4096K
A = <aeadditions:storage.component:3>;//组件
recipes.addShapeless(<aeadditions:storage.component:2>,
    [A]
);
A = <appliedenergistics2:material:39>;//外壳
B = <aeadditions:storage.component:2>;//组件
recipes.addShapeless(<aeadditions:storage.physical:2>,
    [A,B]
);
//16384K
//A = <appliedenergistics2:material:35>;//1K-ME组件
//B = <ore:>;//石英玻璃
//C = <>;//
//D = <>;//
//recipes.addShaped(<aeadditions:storage.component:3>,
//    [[D,C,D],
//     [A,B,A],
//     [D,A,D]]
//);

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
