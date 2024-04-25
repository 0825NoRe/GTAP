//1033/0425/24
import mods.gregtech.recipe.RecipeMap;
import crafttweaker.data.IData;
import crafttweaker.event.PlayerCraftedEvent;

recipes.removeByMod("enderio");

//[[特殊]]
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

//[[材料]]
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
    .inputs([<ore:dustTinyPulsatingIron>*8,//1/9充能铁粉
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
RecipeMap.getByName("autoclave").recipeBuilder()//高压釜
    .inputs([<ore:itemPulsatingPowder>])//充能水晶粉
    .fluidInputs([<fluid:water>*1000])//水
    .outputs([<enderio:item_material:14>])
    .EUt(30)
    .duration(600)
    .buildAndRegister();
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
//纯净玻璃
furnace.addRecipe(<enderio:block_fused_glass>, 
                  <minecraft:glass>,//玻璃
                  0.1);
//黑暗纯净玻璃
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:dyeBlack>,//黑色染料
             <enderio:block_fused_glass>])//纯净玻璃
    .outputs([<enderio:block_dark_fused_glass>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//荧光纯净玻璃
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:dustGlowstone>,//荧石粉
             <enderio:block_fused_glass>])//纯净玻璃
    .outputs([<enderio:block_enlightened_fused_glass>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//石英玻璃
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:gemQuartzite>*4])//石英岩*4
    .notConsumable([<gregtech:meta_item_1:18>])//模具：块
    .outputs([<enderio:block_fused_quartz>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
RecipeMap.getByName("alloy_smelter").recipeBuilder()
    .inputs([<ore:gemQuartz>*4])//下界石英*4
    .notConsumable([<gregtech:meta_item_1:18>])//模具：块
    .outputs([<enderio:block_fused_quartz>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
RecipeMap.getByName("alloy_smelter").recipeBuilder()
    .inputs([<ore:gemCertusQuartz>*4])//赛特斯石英*4
    .notConsumable([<gregtech:meta_item_1:18>])//模具：块
    .outputs([<enderio:block_fused_quartz>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//黑暗石英玻璃
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:dyeBlack>,//黑色染料
             <ore:fusedQuartz>])//石英玻璃
    .outputs([<enderio:block_dark_fused_quartz>])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//荧光石英玻璃
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
    .inputs([<enderio:item_material:20>*9])//基岩粉*9
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
    .inputs([<enderio:block_infinity:0>*9])//基岩粉块*9
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
    .inputs([<enderio:block_infinity:1>*9])//压缩基岩粉块*9
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

//[[道具]]
//导管提取速率升级
//recipes.addShaped(<enderio:item_extract_speed_upgrade>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
recipes.addShapeless(<enderio:item_extract_speed_upgrade>,
    [<enderio:item_extract_speed_downgrade>]//导管提取速率降级
);
//导管提取速率降级
recipes.addShapeless(<enderio:item_extract_speed_downgrade>,
    [<enderio:item_extract_speed_upgrade>]//导管提取速率升级
);
//电容
//基础1.0
recipes.addShaped(<enderio:item_basic_capacitor:0>,
    [[null,<ore:nuggetGold>,<enderio:item_material:20>],//空,金粒,基岩粉
     [<ore:nuggetGold>,<ore:dustRedstone>,<ore:nuggetGold>],//金粒,红石粉,金粒
     [<enderio:item_material:20>,<ore:nuggetGold>,null]]//基岩粉,金粒,空
);
RecipeMap.getByName("assembler").recipeBuilder()//组装机
    .inputs([<ore:nuggetGold>*4,//金粒*4
                  <enderio:item_material:20>*2,//基岩粉*2
                  <ore:dustRedstone>])//红石粉
    .outputs([<enderio:item_basic_capacitor:0>])
    .EUt(16)
    .duration(100)
    .buildAndRegister();
//双层2.0
recipes.addShaped(<enderio:item_basic_capacitor:1>,
    [[null,<ore:plateEnergeticAlloy>,null],//空,充能合金板,空
     [<enderio:item_basic_capacitor:0>,<ore:dustCoal>,<enderio:item_basic_capacitor:0>],//基础电容,煤粉,基础电容
     [null,<ore:plateEnergeticAlloy>,null]]//空,充能合金板,空
);
RecipeMap.getByName("assembler").recipeBuilder()//组装机
    .inputs([<ore:plateEnergeticAlloy>*2,//充能合金板*2
                  <enderio:item_basic_capacitor:0>*2,//基础电容*2
                  <ore:dustCoal>])//煤粉
    .outputs([<enderio:item_basic_capacitor:1>])
    .EUt(16)
    .duration(100)
    .buildAndRegister();
//八位3.0
recipes.addShaped(<enderio:item_basic_capacitor:2>,
    [[null,<ore:plateVibrantAlloy>,null],//空,脉冲合金板,空
     [<enderio:item_basic_capacitor:1>,<ore:blockGlowstone>,<enderio:item_basic_capacitor:1>],//双层电容,荧石块,双层电容
     [null,<ore:plateVibrantAlloy>,null]]//空,脉冲合金板,空
);
RecipeMap.getByName("assembler").recipeBuilder()//组装机
    .inputs([<ore:plateVibrantAlloy>*2,//脉冲合金板*2
                  <enderio:item_basic_capacitor:1>*2,//双层电容*2
                  <ore:blockGlowstone>])//荧石块
    .outputs([<enderio:item_basic_capacitor:2>])
    .EUt(16)
    .duration(100)
    .buildAndRegister();
//晶金3.5
RecipeMap.getByName("assembler").recipeBuilder()//组装机
    .inputs([<ore:plateCrystallineAlloy>*2,//晶金板*2
                  <enderio:item_basic_capacitor:2>,//八位电容*2
                  <ore:dustPrismarine>])//海晶砂粒
    .outputs([<enderio:item_capacitor_crystalline>])
    .EUt(30)
    .duration(200)
    .buildAndRegister();
//旋金4.0
RecipeMap.getByName("assembler").recipeBuilder()//组装机
    .inputs([<ore:plateMelodicAlloy>*2,//旋律合金板*2
                  <enderio:item_capacitor_crystalline>,//晶金电容
                  <ore:ingotEndSteel>])//末影钢锭
    .outputs([<enderio:item_capacitor_melodic>])
    .EUt(120)
    .duration(200)
    .buildAndRegister();
//恒金5.0
RecipeMap.getByName("assembler").recipeBuilder()//组装机
    .inputs([<ore:plateStellarAlloy>*2,//恒星合金板*2
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
//荧石纳米颗粒
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<ore:dustGlowstone>,//荧石粉
             <ore:dustClay>])//粘土粉
    .outputs([<enderio:block_holier_fog>*2])
    .EUt(16)
    .duration(200)
    .buildAndRegister();
//导管探测器
recipes.addShaped(<enderio:item_conduit_probe>,
    [[null,<gregtech:meta_item_1:232>,null],//空,LV传感器,空
     [<ore:plateIron>,<gregtech:>,<ore:plateIron>],//铁板,屏幕,铁板
     [<ore:plateIron>,<ore:gearIron>,<ore:plateIron>]]//铁板,铁齿轮,铁板
);
//旅行权杖
//recipes.addShaped(<enderio:item_travel_staff>,
//   [[null,null,<gregtech:>],//空,空,LV发射器
//    [null,<ore:stickDarkSteel>,null],//空,玄钢杆,空
//    [<ore:batteryLv>,null,null]]//LV电池,空,空
//);
//以太扳手
recipes.addShaped(<enderio:item_yeta_wrench>,
    [[<ore:plateElectricalSteel>,null,<ore:plateElectricalSteel>],//磁钢板,空,磁钢板
     [null,<ore:gearIron>,null],//空,铁齿轮,空
     [null,<ore:stickElectricalSteel>,null]]//空,磁钢杆,空
);
//灵魂瓶
recipes.addShaped(<enderio:item_soul_vial>,
    [[null,<ore:ingotSoulariumAlloy>,null],//空,魂金锭,空
     [<ore:fusedQuartz>,null,<ore:fusedQuartz>],//石英玻璃,空,石英玻璃
     [null,<ore:fusedQuartz>,null]]//空,石英玻璃,空
);

//[[功能性方块]]
//玄钢砧
recipes.addShaped(<enderio:block_dark_steel_anvil>,
    [[<ore:blockDarkSteel>,<ore:blockDarkSteel>,<ore:blockDarkSteel>],//玄钢块,玄钢块,玄钢块
     [null,<ore:ingotDarkSteel>,null],//空,玄钢锭,空
     [<ore:ingotDarkSteel>,<ore:ingotDarkSteel>,<ore:ingotDarkSteel>]]//玄钢锭,玄钢锭,玄钢锭
);
//强化黑曜石
//RecipeMap.getByName("").recipeBuilder()//?
//   .inputs([<ore:dustObsidian>,//黑曜石粉
//            <ore:dustBedrock>*4])//基岩粉*4
//   .fluidInputs([<fluid:dark_steel>*576])//熔融玄钢*576
//   .outputs([<enderio:block_reinforced_obsidian>])
//   .EUt(30)
//   .duration(200)
//   .buildAndRegister();
//工业隔离方块
//recipes.addShaped(<enderio:block_industrial_insulation>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//方块检测器
recipes.addShaped(<enderio:block_detector_block>,
    [[<ore:plateDarkSteel>,<gregtech:meta_item_1:232>,<ore:plateDarkSteel>],//玄钢板,LV传感器,玄钢板
     [<ore:plateDarkSteel>,<minecraft:piston>,<ore:plateDarkSteel>],//玄钢板,活塞,玄钢板
     [<ore:plateDarkSteel>,<ore:blockRedstone>,<ore:plateDarkSteel>]]//玄钢板,红石块,玄钢板
);
recipes.addShapeless(<enderio:block_detector_block>,
    [<enderio:block_detector_block_silent>]//方块检测器: 无声
);
//方块检测器: 无声
recipes.addShapeless(<enderio:block_detector_block_silent>,
    [<enderio:block_detector_block>]//方块检测器
);
//附魔器
//recipes.addShaped(<enderio:block_enchanter>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//杀手乔
//recipes.addShaped(<enderio:block_killer_joe>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//喷涂机
//recipes.addShaped(<enderio:block_painter>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//蓄水库
//recipes.addShaped(<enderio:block_reservoir>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//电动刷怪箱
recipes.addShaped(<enderio:block_powered_spawner>,
    [[<ore:plateSoulariumAlloy>,<ore:plateSoulariumAlloy>,<ore:plateSoulariumAlloy>],//魂金板,魂金板,魂金板
     [<ore:plateSoulariumAlloy>,<enderio:item_material:41>,<ore:plateSoulariumAlloy>],//魂金板,Z-逻辑控制器,魂金板
     [<ore:plateElectricalSteel>,<gregtech:machine:986>,<ore:plateElectricalSteel>]]//磁钢板,LV机身,磁钢板
);
//流体储罐
RecipeMap.getByName("assembler").recipeBuilder()//组装机
   .inputs([<ore:blockGlass>*4,//玻璃*4
            <ore:plateIron>*4,//铁板*4
            <ore:stickiron>*12])//铁杆*12
   .outputs([<enderio:block_tank:0>])
   .EUt(16)
   .duration(100)
   .buildAndRegister();
//高压储罐
RecipeMap.getByName("assembler").recipeBuilder()//组装机
   .inputs([<ore:fusedQuartz>*4,//石英玻璃*4
            <ore:plateDarkSteel>*4,//玄钢板*4
            <ore:stickDarkSteel>*12])/玄钢杆*12
   .outputs([<enderio:block_tank:1>])
   .EUt(16)
   .duration(100)
   .buildAndRegister();
//空间传送器
//recipes.addShaped(<enderio:block_transceiver>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//流体填充器
//recipes.addShaped(<enderio:block_niard>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//旅行锚
//recipes.addShaped(<enderio:block_travel_anchor>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//传送台
//recipes.addShaped(<enderio:block_tele_pad>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//推力漏斗
//recipes.addShaped(<enderio:block_impulse_hopper>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//合成器
//recipes.addShaped(<enderio:block_crafter>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
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
    [[<ore:stickIron>,<ore:blockGlass>,<ore:stickIron>],//铁杆,玻璃,铁杆
     [<ore:blockGlass>,<ore:frameIron>,<ore:blockGlass>],//玻璃,铁框架,玻璃
     [<ore:stickIron>,<ore:blockGlass>,<ore:stickIron>]]//铁杆,玻璃,铁杆
);
//透明硬化
recipes.addShaped(<enderio:item_conduit_facade:3>*64,
    [[<ore:stickSteel>,<ore:fusedQuartz>,<ore:stickSteel>],//钢杆,石英玻璃,钢杆
     [<ore:fusedQuartz>,<ore:frameSteel>,<ore:fusedQuartz>],//石英玻璃,钢框架,石英玻璃
     [<ore:stickSteel>,<ore:fusedQuartz>,<ore:stickSteel>]]//钢杆,石英玻璃,钢杆
);
//导管
//物品
//recipes.addShaped(<enderio:item_item_conduit>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//流体
//recipes.addShaped(<enderio:item_liquid_conduit:0>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//高压流体
//recipes.addShaped(<enderio:item_liquid_conduit:1>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//末影流体
//recipes.addShaped(<enderio:item_liquid_conduit:2>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//红石
//recipes.addShaped(<enderio:item_redstone_conduit>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//方尖碑
//经验
//recipes.addShaped(<enderio:block_experience_obelisk>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//天气
//recipes.addShaped(<enderio:block_weather_obelisk>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//诱引
//recipes.addShaped(<enderio:block_attractor_obelisk>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//排除
//recipes.addShaped(<enderio:block_aversion_obelisk>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//传送抑制
//recipes.addShaped(<enderio:block_inhibitor_obelisk>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//重定向
//recipes.addShaped(<enderio:block_relocator_obelisk>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//虚空箱子
//recipes.addShaped(<enderio:block_vacuum_chest>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//虚空经验箱
//recipes.addShaped(<enderio:block_xp_vacuum>,
//    [[<>,<>,<>],//,,
//     [<>,<>,<>],//,,
//     [<>,<>,<>]]//,,
//);
//太阳能板
//简易 2EU/t ULV
RecipeMap.getByName("assembler").recipeBuilder()//组装机
   .inputs([<ore:itemPlatePhotovoltaic>*4,//光伏板*4
            <ore:cableGtSingleRedAlloy>*2,//1A-红色合金线缆[ULV超导线]*2
            <ore:circuitUlv>*2,//ULV电路板*2
            <ore:plateIron>*3,//铁板*3
            <ore:screwBronze>*4,//青铜螺丝*4
            <ore:springSmallCopper>])//小型铜弹簧
   .outputs([<enderio:block_solar_panel:0>])
   .EUt(30)
   .duration(200)
   .buildAndRegister();
//普通 8EU/t ULV
RecipeMap.getByName("assembler").recipeBuilder()//组装机
   .inputs([<ore:itemPlatePhotovoltaic>*8,//光伏板*8
            <ore:cableGtSingleRedAlloy>*8,//1A-红色合金线缆[ULV超导线]*8
            <ore:circuitUlv>*4,//ULV电路板*4
            <ore:plateBronze>*3,//青铜板*3
            <ore:screwBronze>*4,//青铜螺丝*4
            <ore:springSmallCopper>])//小型铜弹簧
   .outputs([<enderio:block_solar_panel:1>])
   .EUt(30)
   .duration(200)
   .buildAndRegister();
//强化 32EU/t LV
RecipeMap.getByName("assembler").recipeBuilder()//组装机
   .inputs([<ore:itemPlatePhotovoltaic>*16,//光伏板*16
            <ore:wireGtSingleManganesePhosphide>*8,//1A-磷化锰导线[LV超导线]*8
            <ore:circuitLv>*4,//LV电路板*4
            <ore:platePulsatingIron>*3,//脉冲铁板*3
            <ore:screwSteel>*4,//钢螺丝*4
            <ore:batteryLv>])//LV电池
   .fluidInputs([<fluid:sodium_potassium>*1000])//钠钾共晶合金
   .outputs([<enderio:block_solar_panel:2>])
   .EUt(30)
   .duration(200)
   .buildAndRegister();
//脉冲 128EU/t MV
RecipeMap.getByName("assembler").recipeBuilder()//组装机
   .inputs([<ore:itemPlatePhotovoltaic>*32,//光伏板*32
            <ore:wireGtSingleMagnesiumDiboride>*8,//1A-二硼化镁导线[MV超导线]*8
            <ore:circuitMv>*4,//MV电路板*4
            <ore:plateVibrantAlloy>*3,//脉冲合金板*3
            <ore:screwAluminium>*4,//铝螺丝*4
            <ore:batteryMv>])//MV电池
   .fluidInputs([<fluid:sodium_potassium>*1000])//钠钾共晶合金
   .outputs([<enderio:block_solar_panel:3>])
   .EUt(120)
   .duration(200)
   .buildAndRegister();
//晶化 512EU/t HV
RecipeMap.getByName("assembler").recipeBuilder()//组装机
   .inputs([<ore:itemPlatePhotovoltaic>*64,//光伏板*64
            <ore:wireGtSingleMercuryBariumCalciumCuprate>*8,//1A-汞钡钙铜氧化物导线[HV超导线]*8
            <ore:circuitHv>*4,//HV电路板*4
            <ore:plateCrystallineAlloy>*3,//晶化合金板*3
            <ore:screwStainlessSteel>*4,//不锈钢螺丝*4
            <ore:batteryHv>])//HV电池
   .fluidInputs([<fluid:sodium_potassium>*1000])//钠钾共晶合金
   .outputs([<enderio:block_solar_panel:4>])
   .EUt(480)
   .duration(200)
   .buildAndRegister();
//旋律 2048EU/t EV
RecipeMap.getByName("assembler").recipeBuilder()//组装机
   .inputs([<ore:itemPlatePhotovoltaic>*64,//光伏板*64
            <ore:itemPlatePhotovoltaic>*64,//光伏板*64
            <ore:wireGtSingleUraniumTriplatinum>*8,//1A-三铂化铀导线[EV超导线]*8
            <ore:circuitEv>*4,//EV电路板*4
            <ore:plateMelodicAlloy>*3,//旋律合金板*3
            <ore:screwTitanium>*4,//钛螺丝*4
            <ore:batteryEv>])//EV电池
   .fluidInputs([<fluid:pcb_coolant>*1000])//绝缘性多氯联苯冷却液
   .outputs([<enderio:block_solar_panel:5>])
   .EUt(1920)
   .duration(200)
   .buildAndRegister();
//恒星 8192EU/t IV
RecipeMap.getByName("assembler").recipeBuilder()//组装机
   .inputs([<ore:itemPlatePhotovoltaic>*64,//光伏板*64
            <ore:itemPlatePhotovoltaic>*64,//光伏板*64
            <ore:itemPlatePhotovoltaic>*64,//光伏板*64
            <ore:itemPlatePhotovoltaic>*64,//光伏板*64
            <ore:wireGtSingleSamariumIronArsenicOxide>*8,//1A-钐铁砷氧化物导线[IV超导线]*8
            <ore:circuitIv>*4,//IV电路板*4
            <ore:plateStellarAlloy>*3,//恒星合金板*3
            <ore:screwTungstenSteel>*4,//钨钢螺丝*4
            <ore:batteryIv>])//IV电池
   .fluidInputs([<fluid:pcb_coolant>*1000])//绝缘性多氯联苯冷却液
   .outputs([<enderio:block_solar_panel:6>])
   .EUt(7680)
   .duration(200)
   .buildAndRegister();

//[[功能性流体]]
//液态阳光
RecipeMap.getByName("brewery").recipeBuilder()//酿造室
   .inputs([<ore:dustGlowstone>])//荧石粉
   .fluidInputs([<fluid:water>*1000])//水
   .fluidOutputs([<fluid:liquid_sunshine>*1000])
   .EUt(30)
   .duration(3600)
   .buildAndRegister();
//营养精华液
RecipeMap.getByName("brewery").recipeBuilder()//酿造室
   .inputs([<ore:materialNutrient>])//[自定义矿辞]营养液材料
   .fluidInputs([<fluid:water>*1000])//水
   .fluidOutputs([<fluid:nutrient_distillation>*1000])
   .EUt(30)
   .duration(1200)
   .buildAndRegister();
//云之精华

//浓缩云之精华
