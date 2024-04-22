//0829/0412/24
import mods.gregtech.recipe.RecipeMap;
import crafttweaker.data.IData;
import crafttweaker.event.PlayerCraftedEvent;

recipes.removeByMod("enderio");

//破损刷怪箱：类型改变
//此为替代配方。受限于"无法记录输入物NBT并应用于输出物"，灵魂绑定器的完全GT化暂无法实现。
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
    .inputs([<ore:dustTinyPulsatingIron>*8,//1/9充能铁粉
                  <ore:dustDiamond>])//钻石粉
    .outputs([<enderio:item_material:36>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:dustPulsatingIron>,//充能铁粉
                  <ore:gemDiamond>])//钻石
    .outputs([<enderio:item_material:14>])
    .EUt(30)
    .duration(200)
    .buildAndRegister();
RecipeMap.getByName("macerator").recipeBuilder()//研磨机
    .inputs([<ore:itemPulsatingCrystal>])//充能水晶
    .outputs([<enderio:item_material:36>])
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
recipes.addShaped(<enderio:item_basic_capacitor:0>,
    [[null,<ore:nuggetGold>,<enderio:item_material:20>],//空,金粒,基岩粉
     [<ore:nuggetGold>,<ore:dustRedstone>,<ore:nuggetGold>],//金粒,红石粉,金粒
     [<enderio:item_material:20>,<ore:nuggetGold>,null]]//基岩粉,金粒,空
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
recipes.addShaped(<enderio:item_basic_capacitor:1>,
    [[null,<ore:plateEnergeticAlloy>,null],//空,充金板,空
     [<enderio:item_basic_capacitor:0>,<ore:dustCoal>,<enderio:item_basic_capacitor:0>],//基础电容,煤粉,基础电容
     [null,<ore:plateEnergeticAlloy>,null]]//空,充金板,空
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
recipes.addShaped(<enderio:item_basic_capacitor:2>,
    [[null,<ore:plateVibrantAlloy>,null],//空,脉金板,空
     [<enderio:item_basic_capacitor:1>,<ore:blockGlowstone>,<enderio:item_basic_capacitor:1>],//双层电容,荧石,双层电容
     [null,<ore:plateVibrantAlloy>,null]]//空,脉金板,空
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
                  <minecraft:shulker_shell>])//潜影壳
    .outputs([<enderio:item_capacitor_stellar>])
    .EUt(480)
    .duration(200)
    .buildAndRegister();

//物品过滤器
//基础
recipes.addShaped(<enderio:item_basic_item_filter>,
    [[null,<minecraft:paper>,null],//空,纸,空
     [<minecraft:paper>,<minecraft:hopper>,<minecraft:paper>],//纸,漏斗,纸
     [null,<minecraft:paper>,null]]//空,纸,空
);
//高级
recipes.addShaped(<enderio:item_advanced_item_filter>,
    [[<ore:dustRedstone>,<minecraft:paper>,<ore:dustRedstone>],//红石粉,纸,红石粉
     [<minecraft:paper>,<enderio:item_material:41>,<minecraft:paper>],//纸,Z-逻辑控制器,纸
     [<ore:dustRedstone>,<minecraft:paper>,<ore:dustRedstone>]]//红石粉,纸,红石粉
);
//限制
recipes.addShaped(<enderio:item_limited_item_filter>,
    [[<minecraft:comparator>,<enderio:item_advanced_item_filter>,<minecraft:comparator>]]//红石比较器,高级物品过滤器,红石比较器
);
//大型
recipes.addShaped(<enderio:item_big_item_filter>,
    [[<ore:dustObsidian>,<enderio:item_basic_item_filter>,<ore:dustObsidian>],//黑曜石粉,基础过滤器,黑曜石粉
     [<enderio:item_basic_item_filter>,<ore:circuitLv>,<enderio:item_basic_item_filter>],//基础过滤器,LV电路板,基础过滤器
     [<ore:dustObsidian>,<enderio:item_basic_item_filter>,<ore:dustObsidian>]]//黑曜石粉,基础过滤器,黑曜石粉
);
//高级大型
recipes.addShapeless(<enderio:item_big_advanced_item_filter>,
    [<enderio:item_advanced_item_filter>,<enderio:item_big_item_filter>]//高级过滤器,大型过滤器
);
//现有
recipes.addShaped(<enderio:item_existing_item_filter>,
    [[null,<ore:dustRedstone>,null],//空,红石粉,空
     [<ore:dustRedstone>,<enderio:item_advanced_item_filter>,<ore:dustRedstone>],//红石粉,高级过滤器,红石粉
     [null,<minecraft:comparator>,null]]//空,比较器,空
);
//模组
recipes.addShaped(<enderio:item_mod_item_filter>,
    [[null,<minecraft:paper>,null],//空,纸,空
     [<minecraft:paper>,<enderio:item_yeta_wrench>,<minecraft:paper>],//纸,以太扳手,纸
     [null,<minecraft:paper>,null]]//空,纸,空
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
recipes.addShapeless(<enderio:item_enchantment_filter_normal>,
    [<enderio:item_basic_item_filter>,<minecraft:enchanted_book>]//基础过滤器,附魔书
);
//大型附魔
recipes.addShapeless(<enderio:item_enchantment_filter_big>,
    [<enderio:item_big_item_filter>,<minecraft:enchanted_book>]//大型过滤器,附魔书
);
//流体过滤器
recipes.addShaped(<enderio:item_fluid_filter>,
    [[null,<minecraft:paper>,null],//空,纸,空
     [<minecraft:paper>,<gregtech:meta_item_1:78>,<minecraft:paper>],//纸,流体单元,纸
     [null,<minecraft:paper>,null]]//空,纸,空
);
//红石过滤器
//非门
recipes.addShaped(<enderio:item_redstone_not_filter>,
    [[<ore:ingotRedstoneAlloy>,<enderio:item_basic_item_filter>,<minecraft:redstone_torch>]]//红石合金锭,基础过滤器,红石火把
);
//或门
recipes.addShaped(<enderio:item_redstone_or_filter>,
    [[<ore:ingotRedstoneAlloy>],//红石合金锭
     [<enderio:item_basic_item_filter>],//基础过滤器
     [<ore:ingotRedstoneAlloy>]]//红石合金锭
);
//与门
recipes.addShaped(<enderio:item_redstone_and_filter>,
    [[<minecraft:redstone_torch>],//红石火把
     [<enderio:item_basic_item_filter>],//基础过滤器
     [<minecraft:redstone_torch>]]//红石火把
);
//或非
recipes.addShapeless(<enderio:item_redstone_nor_filter>,
    [<minecraft:redstone_torch>,<enderio:item_redstone_or_filter>]//红石火把,或门
);
//与非
recipes.addShapeless(<enderio:item_redstone_nand_filter>,
    [<minecraft:redstone_torch>,<enderio:item_redstone_and_filter>]//红石火把,与门
);
//异或
recipes.addShaped(<enderio:item_redstone_xor_filter>,
    [[null,<minecraft:redstone_torch>,null],//空,红石火把,空
     [<ore:ingotRedstoneAlloy>,<enderio:item_basic_item_filter>,<ore:ingotRedstoneAlloy>],//红石合金锭,基础过滤器,红石合金锭
     [null,<minecraft:redstone_torch>,null]]//空,红石火把,空
);
//同或
recipes.addShapeless(<enderio:item_redstone_xnor_filter>,
    [<minecraft:redstone_torch>,<enderio:item_redstone_xor_filter>]//红石火把,异或门
);
//锁存
recipes.addShaped(<enderio:item_redstone_toggle_filter>,
    [[<minecraft:lever>,<enderio:item_basic_item_filter>,<ore:ingotRedstoneAlloy>]]//拉杆,基础过滤器,红石合金锭
);
//计次
recipes.addShaped(<enderio:item_redstone_counting_filter>,
    [[<ore:ingotRedstoneAlloy>,null],//红石合金锭,空
     [<ore:ingotRedstoneAlloy>,<enderio:item_basic_item_filter>],//红石合金锭,基础过滤器
     [<ore:ingotRedstoneAlloy>,null]]//红石合金锭,空
);
//感应
recipes.addShaped(<enderio:item_redstone_sensor_filter>,
    [[<minecraft:comparator>,<enderio:item_basic_item_filter>,<ore:ingotRedstoneAlloy>]]//比较器,基础过滤器,红石合金锭
);
//计时
recipes.addShaped(<enderio:item_redstone_timer_filter>,
    [[<ore:ingotRedstoneAlloy>,<enderio:item_basic_item_filter>,<minecraft:clock>]]//红石合金锭,基础过滤器,时钟
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
             <ore:fusedQuartz>])//石英玻璃
    .outputs([<enderio:block_dark_fused_quartz>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//荧光
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:dustGlowstone>,//荧石粉
             <ore:fusedQuartz>])//石英玻璃
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
recipes.addShaped(<enderio:item_conduit_probe>,
    [[null,<gregtech:meta_item_1:232>,null],//空,LV传感器,空
     [<ore:plateIron>,<ore:gearIron>,<ore:plateIron>],//铁板,铁齿轮,铁板
     [<ore:plateIron>,<ore:plateIron>,<ore:plateIron>]]//铁板,铁板,铁板
);
//旅行权杖
recipes.addShaped(<enderio:item_travel_staff>,
    [[null,null,<gregtech:meta_item_1:233>],//空,空,LV发射器
     [null,<ore:rodDarkSteel>,null],//空,玄钢杆,空
     [<ore:rodDarkSteel>,null,null]]//玄钢杆,空,空
);
//以太扳手
recipes.addShaped(<enderio:item_yeta_wrench>,
    [[<ore:plateElectricalSteel>,null,<ore:plateElectricalSteel>],//磁钢板,空,磁钢板
     [null,<ore:gearIron>,null],//空,铁齿轮,空
     [null,<ore:plateElectricalSteel>,null]]//空,磁钢板,空
);
//灵魂瓶
recipes.addShaped(<enderio:item_soul_vial>,
    [[null,<ore:ingotSoulariumAlloy>,null],//空,魂金锭,空
     [<ore:fusedQuartz>,null,<ore:fusedQuartz>],//石英玻璃,空,石英玻璃
     [null,<ore:fusedQuartz>,null]]//空,石英玻璃,空
);

//太阳能板
//简易 2EU/t ULV
//RecipeMap.getByName("assembler").recipeBuilder()//组装机
//    .inputs([<>*3,//光伏板*3
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>])//
//    .outputs([<enderio:block_solar_panel:0>])
//    .EUt(30)
//    .duration(200)
//    .buildAndRegister();
//普通 8EU/t ULV
//RecipeMap.getByName("assembler").recipeBuilder()//组装机
//    .inputs([<>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>])//
//    .outputs([<enderio:block_solar_panel:1>])
//    .EUt(30)
//    .duration(200)
//    .buildAndRegister();
//强化 32EU/t LV
//RecipeMap.getByName("assembler").recipeBuilder()//组装机
//    .inputs([<>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>])//
//    .fluidInputs([<>])//
//    .outputs([<enderio:block_solar_panel:2>])
//    .EUt(30)
//    .duration(200)
//    .buildAndRegister();
//脉冲 128EU/t MV
//RecipeMap.getByName("assembler").recipeBuilder()//组装机
//    .inputs([<>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>])//
//    .fluidInputs([<>])//
//    .outputs([<enderio:block_solar_panel:3>])
//    .EUt(120)
//    .duration(200)
//    .buildAndRegister();
//晶化 512EU/t HV
//RecipeMap.getByName("assembler").recipeBuilder()//组装机
//    .inputs([<>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>])//
//    .fluidInputs([<>])//
//    .outputs([<enderio:block_solar_panel:4>])
//    .EUt(480)
//    .duration(200)
//    .buildAndRegister();
//旋律 2048EU/t EV
//RecipeMap.getByName("assembler").recipeBuilder()//组装机
//    .inputs([<>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>])//
//    .fluidInputs([<>])//
//    .outputs([<enderio:block_solar_panel:5>])
//    .EUt(1920)
//    .duration(200)
//    .buildAndRegister();
//恒星 8192EU/t IV
//RecipeMap.getByName("assembler").recipeBuilder()//组装机
//    .inputs([<>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>,//
//             <>])//
//    .fluidInputs([<>])//
//    .outputs([<enderio:block_solar_panel:6>])
//    .EUt(7680)
//    .duration(200)
//    .buildAndRegister();

//导管框架
//普通
recipes.addShaped(<enderio:item_conduit_facade:0>*64,
    [[<ore:stickIron>,<ore:plateIron>,<ore:stickIron>],//铁杆,铁板,铁杆
     [<ore:plateIron>,<ore:frameIron>,<ore:plateIron>],//铁板,铁框架,铁板
     [<ore:stickIron>,<ore:plateIron>,<ore:stickIron>]]//铁杆,铁板,铁杆
);
//硬化
recipes.addShaped(<enderio:item_conduit_facade:1>*64,
    [[<ore:stickSteel>,<ore:plateSteel>,<ore:stickSteel>],//钢杆,钢板,钢杆
     [<ore:plateSteel>,<ore:frameSteel>,<ore:plateSteel>],//钢板,钢框架,钢板
     [<ore:stickSteel>,<ore:plateSteel>,<ore:stickSteel>]]//钢杆,钢板,钢杆
);
//透明
recipes.addShaped(<enderio:item_conduit_facade:2>*64,
    [[<ore:stickIron>,<minecraft:glass>,<ore:stickIron>],//铁杆,玻璃,铁杆
     [<minecraft:glass>,<ore:frameIron>,<minecraft:glass>],//玻璃,铁框架,玻璃
     [<ore:stickIron>,<minecraft:glass>,<ore:stickIron>]]//铁杆,玻璃,铁杆
);
//透明硬化
recipes.addShaped(<enderio:item_conduit_facade:3>*64,
    [[<ore:stickSteel>,<ore:fusedQuartz>,<ore:stickSteel>],//钢杆,石英玻璃,钢杆
     [<ore:fusedQuartz>,<ore:frameSteel>,<ore:fusedQuartz>],//石英玻璃,钢框架,石英玻璃
     [<ore:stickSteel>,<ore:fusedQuartz>,<ore:stickSteel>]]//钢杆,石英玻璃,钢杆
);

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

//传送抑制

//重定向
