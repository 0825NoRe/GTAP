import mods.gregtech.recipe.RecipeMap;
import crafttweaker.data.IData;
import crafttweaker.event.PlayerCraftedEvent;
import scripts.Misc.CraftingScript_Static;

recipes.removeByMod("enderio");

//破损刷怪箱：类型改变
//此为替代配方。受限于"无法记录输入物NBT并应用于输出物"，灵魂绑定器的完全GT化暂无法实现。
//我搞了十三个小时的无用功！... #抓狂 #阴暗地爬行 #化身天灾
recipes.addShapeless(
"BrokenSpawnerChangeRecipe",
<enderio:item_broken_spawner>,
[<enderio:item_soul_vial>.marked("Target").transformReplace(<enderio:item_soul_vial>),<enderio:item_broken_spawner>],
function(out,input,info){
    if(isNull(input.Target.tag.entityId)){
        return null;
    }
    else{
        return out.withTag({entityId:input.Target.tag.entityId});
    }
},
null
);

//光伏粉&板
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<ore:dustLapis>,//青金石粉
                  <ore:dustCoal>,//煤粉
                  <ore:dustSilicon>])//硅粉
    .outputs([<enderio:item_material:38>*3])
    .EUt(16)
    .duration(300)
    .buildAndRegister();
RecipeMap.getByName("compressor").recipeBuilder()//压缩机
    .inputs([<enderio:item_material:38>*3])//光伏粉
    .outputs([<enderio:item_material:3>])//光伏板
    .EUt(16)
    .duration(300)
    .buildAndRegister();
//充能水晶&粉
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<ore:dustPulsatingIronTiny>*8,//1/9充能铁粉
                  <ore:dustDiamond>])//钻石粉
    .outputs([<ore:itemPulsatingPowder>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:dustPulsatingIron>,//充能铁粉
                  <ore:diamond>])//钻石
    .outputs([<ore:itemPulsatingCrystal>])
    .EUt(30)
    .duration(200)
    .buildAndRegister();
RecipeMap.getByName("macerator").recipeBuilder()//研磨机
    .inputs([<ore:itemPulsatingCrystal>])//充能水晶
    .outputs([<ore:itemPulsatingPowder>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//RecipeMap.getByName("").recipeBuilder()//高压釜
//    .inputs([<>])//充能水晶粉
//    .fluidInputs([<fluid:water>*1000])
//    .outputs([<ore:itemPulsatingCrystal>])
//    .EUt(30)
//    .duration(600)
//    .buildAndRegister();
//Z-逻辑控制器
RecipeMap.getByName("slice_and_splice").recipeBuilder()//头颅装配机
    .inputs([<ore:plateSoulariumAlloy>*2,//魂金板
                  <ore:dustSilicon>*2,//硅粉
                  <ore:dustRedstone>,//红石粉
                  <minecraft:skull:2>])//僵尸头颅
    .outputs([<enderio:item_material:41>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//人造僵尸
RecipeMap.getByName("soul_binder").recipeBuilder()//灵魂绑定器
    .inputs([<enderio:item_material:41>,//Z-逻辑控制器
                  <enderio:item_soul_vial>.withTag({entityId:"minecraft:zombie"})])//灵魂瓶：僵尸
    .outputs([<enderio:item_material:42>,
                     <enderio:item_soul_vial>])//空瓶回收
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//末影谐振器
RecipeMap.getByName("slice_and_splice").recipeBuilder()//头颅装配机
    .inputs([<ore:plateSoulariumAlloy>*2,//魂金板
                  <ore:dustSilicon>*2,//硅粉
                  <ore:dustEnderPearl>,//末影珍珠粉
                  <enderio:block_enderman_skull>])//末影人头颅
    .outputs([<enderio:item_material:43>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//意识末影谐振器
RecipeMap.getByName("soul_binder").recipeBuilder()//灵魂绑定器
    .inputs([<enderio:item_material:43>,//末影谐振器
                  <enderio:item_soul_vial>.withTag({entityId:"minecraft:enderman"})])//灵魂瓶：末影人
    .outputs([<enderio:item_material:44>,
                     <enderio:item_soul_vial>])//空瓶回收
    .EUt(24)
    .duration(200)
    .buildAndRegister();

//电容
//基础1.0
A = <ore:nuggetGold>;//金粒
B = <enderio:item_material:20>;//基岩粉
C = <ore:dustRedstone>;//红石粉
recipes.addShaped(<enderio:item_basic_capacitor:0>,
    [[N,A,B],
     [A,C,A],
     [B,A,N]]
);
RecipeMap.getByName("assembler").recipeBuilder()
    .inputs([<ore:nuggetGold>*4,
                  <enderio:item_material:20>*2,
                  <ore:dustRedstone>])
    .outputs([<enderio:item_basic_capacitor:0>])
    .EUt(16)
    .duration(100)
    .buildAndRegister();
//双层2.0
A = <ore:plateEnergeticAlloy>;//充能合金板
B = <ore:dustCoal>;//煤粉
C = <enderio:item_basic_capacitor:0>;//基础电容
recipes.addShaped(<enderio:item_basic_capacitor:1>,
    [[N,A,N],
     [C,B,C],
     [N,A,N]]
);
RecipeMap.getByName("assembler").recipeBuilder()
    .inputs([<ore:plateEnergeticAlloy>*2,
                  <enderio:item_basic_capacitor:0>*2,
                  <ore:dustCoal>])
    .outputs([<enderio:item_basic_capacitor:1>])
    .EUt(16)
    .duration(100)
    .buildAndRegister();
//八位3.0
A = <ore:plateVibrantAlloy>;//脉冲合金板
B = <ore:blockGlowstone>;//荧石
C = <enderio:item_basic_capacitor:1>;//双层电容
recipes.addShaped(<enderio:item_basic_capacitor:2>,
    [[N,A,N],
     [C,B,C],
     [N,A,N]]
);
RecipeMap.getByName("assembler").recipeBuilder()
    .inputs([<ore:plateVibrantAlloy>*2,
                  <enderio:item_basic_capacitor:1>*2,
                  <ore:blockGlowstone>])
    .outputs([<enderio:item_basic_capacitor:2>])
    .EUt(16)
    .duration(100)
    .buildAndRegister();
//晶金3.5
RecipeMap.getByName("assembler").recipeBuilder()
    .inputs([<ore:plateCrystallineAlloy>*2,//晶金板
                  <enderio:item_basic_capacitor:2>,//八位电容
                  <ore:dustPrismarine>])//海晶砂粒
    .outputs([<enderio:item_capacitor_crystalline>])
    .EUt(30)
    .duration(200)
    .buildAndRegister();
//旋金4.0
RecipeMap.getByName("assembler").recipeBuilder()
    .inputs([<ore:plateMelodicAlloy>*2,//旋金板
                  <enderio:item_capacitor_crystalline>,//晶金电容
                  <ore:ingotEndSteel>])//末影钢锭
    .outputs([<enderio:item_capacitor_melodic>])
    .EUt(120)
    .duration(200)
    .buildAndRegister();
//恒金5.0
RecipeMap.getByName("assembler").recipeBuilder()
    .inputs([<ore:plateStellarAlloy>*2,//恒金板
                  <enderio:item_capacitor_melodic>,//旋金电容
                  <minecraft:shulker_skull>])//潜影壳
    .outputs([<enderio:item_capacitor_stellar>])
    .EUt(480)
    .duration(200)
    .buildAndRegister();

//物品过滤器
//基础
A = <minecraft:paper>;//纸
B = <minecraft:hopper>;//漏斗
recipes.addShaped(<enderio:item_basic_item_filter>,
    [[N,A,N],
     [A,B,A],
     [N,A,N]]
);
//高级
A = <minecraft:paper>;//纸
B = <enderio:item_material:41>;//Z-逻辑控制器
C = <ore:dustRedstone>;//红石粉
recipes.addShaped(<enderio:item_advanced_item_filter>,
    [[C,A,C],
     [A,B,A],
     [C,A,C]]
);
//限制
A = <minecraft:comparator>;//红石比较器
B = <enderio:item_advanced_item_filter>;//高级物品过滤器
recipes.addShaped(<enderio:item_limited_item_filter>,
    [[A,B,A]]
);
//大型
A = <enderio:item_basic_item_filter>;//基础过滤器
B = <ore:circuitLv>;//LV电路板
C = <ore:dustObsidian>;//黑曜石粉
recipes.addShaped(<enderio:item_big_item_filter>,
    [[C,A,C],
     [A,B,A],
     [C,A,C]]
);
//高级大型
A = <enderio:item_advanced_item_filter>;//高级过滤器
B = <enderio:item_big_item_filter>;//大型过滤器
recipes.addShapeless(<enderio:item_big_advanced_item_filter>,
    [A,B]
);
//现有
A = <ore:dustRedstone>;//红石粉
B = <enderio:item_advanced_item_filter>;//高级过滤器
C = <minecraft:comparator>;//比较器
recipes.addShaped(<enderio:item_existing_item_filter>,
    [[N,A,N],
     [A,B,A],
     [N,C,N]]
);
//模组
A = <minecraft:paper>;//纸
B = <enderio:item_yeta_wrench>;//以太扳手
recipes.addShaped(<enderio:item_mod_item_filter>,
    [[N,A,N],
     [A,B,A],
     [N,A,N]]
);
//灵魂
RecipeMap.getByName("soul_binder").recipeBuilder()//灵魂绑定器
    .inputs([<enderio:item_basic_item_filter>,//基础过滤器
                  <enderio:item_soul_vial>.withTag({entityId:""})])//灵魂瓶：任何
    .outputs([<enderio:item_soul_filter_normal>,
                     <enderio:item_soul_vial>])//空瓶回收
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//大型灵魂
RecipeMap.getByName("soul_binder").recipeBuilder()//灵魂绑定器
    .inputs([<enderio:item_big_item_filter>,//大型过滤器
                  <enderio:item_soul_vial>.withTag({entityId:""})])//灵魂瓶：任何
    .outputs([<enderio:item_soul_filter_big>,
                     <enderio:item_soul_vial>])//空瓶回收
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//附魔
A = <enderio:item_basic_item_filter>;//基础过滤器
B = <minecraft:enchanted_book>;//附魔书
recipes.addShapeless(<enderio:item_enchantment_filter_normal>,
    [A,B]
);
//大型附魔
A = <enderio:item_big_item_filter>;//大型过滤器
B = <minecraft:enchanted_book>;//附魔书
recipes.addShapeless(<enderio:item_enchantment_filter_big>,
    [A,B]
);
//流体过滤器
A = <minecraft:paper>;//纸
B = <gregtech:meta_item_1:78>;//流体单元
recipes.addShaped(<enderio:item_fluid_filter>,
    [[N,A,N],
     [A,B,A],
     [N,A,N]]
);
//红石过滤器
A = <enderio:item_basic_item_filter>;//基础过滤器
B = <ore:ingotRedstoneAlloy>;//红石合金锭
C = <minecraft:redstone_torch>;//红石火把
D = <minecraft:lever>;//拉杆
E = <minecraft:comparator>;//比较器
F = <minecraft:clock>;//时钟
G = <enderio:item_redstone_or_filter>;//或门
H = <enderio:item_redstone_and_filter>;//与门
I = <enderio:item_redstone_xor_filter>;//异或门
//非门
recipes.addShaped(<enderio:item_redstone_not_filter>,
    [[B,A,C]]
);
//或门
recipes.addShaped(<enderio:item_redstone_or_filter>,
    [[B],
     [A],
     [B]]
);
//与门
recipes.addShaped(<enderio:item_redstone_and_filter>,
    [[C],
     [A],
     [C]]
);
//或非
recipes.addShapeless(<enderio:item_redstone_nor_filter>,
    [C,G]
);
//与非
recipes.addShapeless(<enderio:item_redstone_nand_filter>,
    [C,H]
);
//异或
recipes.addShaped(<enderio:item_redstone_xor_filter>,
    [[N,C,N],
     [B,A,B],
     [N,C,N]]
);
//同或
recipes.addShapeless(<enderio:item_redstone_xnor_filter>,
    [C,I]
);
//锁存
recipes.addShaped(<enderio:item_redstone_toggle_filter>,
    [[D,A,B]]
);
//计次
recipes.addShaped(<enderio:item_redstone_counting_filter>,
    [[B,N],
     [B,A],
     [B,N]]
);
//感应
recipes.addShaped(<enderio:item_redstone_sensor_filter>,
    [[E,A,B]]
);
//计时
recipes.addShaped(<enderio:item_redstone_timer_filter>,
    [[B,A,F]]
);

//纯净玻璃
//普通
furnace.addRecipe(<enderio:block_fused_glass>, 
                                <minecraft:glass>,//玻璃
                                0.1);
//黑暗
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:dyeBlack>,//黑色染料
                  <enderio:block_fused_glass>])//纯净玻璃
    .outputs([<enderio:block_dark_fused_glass>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//荧光
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:dustGlowstone>,//荧石粉
                  <enderio:block_fused_glass>])//纯净玻璃
    .outputs([<enderio:block_enlightened_fused_glass>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//石英玻璃
//普通
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:gemQuartzite>*4])//石英岩
    .notConsumable([<gregtech:meta_item_1:18>])//模具：块
    .outputs([<enderio:block_fused_quartz>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
RecipeMap.getByName("alloy_smelter").recipeBuilder()
    .inputs([<ore:gemQuartz>*4])//下界石英
    .notConsumable([<gregtech:meta_item_1:18>])
    .outputs([<enderio:block_fused_quartz>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
RecipeMap.getByName("alloy_smelter").recipeBuilder()
    .inputs([<ore:gemCertusQuartz>*4])//赛特斯石英
    .notConsumable([<gregtech:meta_item_1:18>])
    .outputs([<enderio:block_fused_quartz>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//黑暗
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:dyeBlack>,//黑色染料
                  <enderio:block_fused_quartz>])//石英玻璃
    .outputs([<enderio:block_dark_fused_quartz>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//荧光
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:dustGlowstone>,//荧石粉
                  <enderio:block_fused_quartz>])//石英玻璃
    .outputs([<enderio:block_enlightened_fused_quartz>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();

//基岩尘
RecipeMap.getByName("macerator").recipeBuilder()//研磨机
    .inputs([<enderio:item_material:20>])//基岩粉
    .outputs([<enderio:block_infinity_fog>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//基岩粉块 压缩&解压
RecipeMap.getByName("packer").recipeBuilder()//打包机
    .inputs([<enderio:item_material:20>*9])//基岩粉
    .outputs([<enderio:block_infinity:0>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
RecipeMap.getByName("packer").recipeBuilder()//打包机
    .inputs([<enderio:block_infinity:0>])//基岩粉块
    .circuit(1)
    .outputs([<enderio:item_material:20>*9])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//压缩基岩粉块 压缩&解压
RecipeMap.getByName("packer").recipeBuilder()//打包机
    .inputs([<enderio:block_infinity:0>*9])//基岩粉块
    .outputs([<enderio:block_infinity:1>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
RecipeMap.getByName("packer").recipeBuilder()//打包机
    .inputs([<enderio:block_infinity:1>])//压缩基岩粉块
    .circuit(1)
    .outputs([<enderio:block_infinity:0>*9])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//二重压缩基岩粉块 压缩&解压
RecipeMap.getByName("packer").recipeBuilder()//打包机
    .inputs([<enderio:block_infinity:1>*9])//压缩基岩粉块
    .outputs([<enderio:block_infinity:2>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
RecipeMap.getByName("packer").recipeBuilder()//打包机
    .inputs([<enderio:block_infinity:2>])//二重压缩基岩粉块
    .circuit(1)
    .outputs([<enderio:block_infinity:1>*9])
    .EUt(16)
    .duration(200)
    .buildAndRegister();

//导管探测器
A = <gregtech:meta_item_1:232>;//LV传感器
B = <ore:plateIron>;//铁板
C = <ore:gearIron>;//铁齿轮
recipes.addShaped(<enderio:item_conduit_probe>,
    [[N,A,N],
     [B,C,B],
     [B,B,B]]
);
//旅行权杖
A = <gregtech:meta_item_1:233>;//LV发射器
B = <ore:rodDarkSteel>;//玄钢杆
recipes.addShaped(<enderio:item_travel_staff>,
    [[N,N,A],
     [N,B,N],
     [B,N,N]]
);
//以太扳手
A = <ore:plateElectricalSteel>;//磁钢板
B = <ore:gearIron>;//铁齿轮
recipes.addShaped(<enderio:item_yeta_wrench>,
    [[A,N,A],
     [N,B,N],
     [N,A,N]]
);
//灵魂瓶
A = <ore:ingotSoulariumAlloy>;//魂金锭
B = <ore:fusedQuartz>;//石英玻璃
recipes.addShaped(<enderio:item_soul_vial>,
    [[N,A,N],
     [B,N,B],
     [N,B,N]]
);

//太阳能板
//简易 2EU/t ULV

//普通 8EU/t ULV

//强化 32EU/t LV

//脉冲 128EU/t MV

//晶化 512EU/t HV

//旋律 2048EU/t EV

//恒星 8192EU/t IV


//导管框架
//普通

//透明

//硬化

//透明硬化


//导管
//物品

//流体

//高压流体

//末影流体

//红石


//方尖碑
//经验

//天气

//诱引

//排除

