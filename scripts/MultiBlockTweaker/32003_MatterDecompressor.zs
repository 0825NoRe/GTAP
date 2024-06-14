//1415/0607/24
#priority 1

import mods.gregtech.IControllerTile;
import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.CTPredicate;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.functions.IPatternBuilderFunction;
import mods.gregtech.multiblock.IBlockPattern;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.recipe.functions.IRunOverclockingLogicFunction;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.recipe.RecipeMaps;
import mods.gregtech.recipe.RecipeMapBuilder;

//物质解压器-等级3-星河奇迹
Builder.start("matter_decompressor",32003)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle("000000000000000","000000060000000","000000000000000")
            .aisle("000000060000000","000011656110000","000000060000000")
            .aisle("000011060110000","000122646221000","000011060110000")
            .aisle("000100060001000","001211646112100","000100060001000")
            .aisle("001000000000100","012100040001210","001000000000100")
            .aisle("001000000000100","012100040001210","001000000000100")
            .aisle("000000111000000","066600141006660","000000111000000")
            .aisle("066600111006660","654444434444456","0666001C1006660")
            .aisle("000000111000000","066600141006660","000000111000000")
            .aisle("001000000000100","012100040001210","001000000000100")
            .aisle("001000000000100","012100040001210","001000000000100")
            .aisle("000100060001000","001211646112100","000100060001000")
            .aisle("000011060110000","000122646221000","000011060110000")
            .aisle("000000060000000","000011656110000","000000060000000")
            .aisle("000000000000000","000000060000000","000000000000000")
            .where("0",CTPredicate.getAny())//任何
            .where("1",CTPredicate.states(<metastate:gregtech:metal_casing:7>).setMinGlobalLimited(32)//补位方块 - 钨钢外壳
                     | CTPredicate.abilities(<mte_ability:MAINTENANCE_HATCH>).setMinGlobalLimited(1).setMaxGlobalLimited(1).setPreviewCount(1)//维修仓
                     | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(4).setPreviewCount(1)//能源仓
                     | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)//输入总线
                     | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)//输入仓
                     | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1))//输出总线
            .where("2",<blockstate:contenttweaker:coil_magnet>)//线圈磁体
            .where("3",<blockstate:contenttweaker:singularity_cell>)//奇点容器
            .where("4",<blockstate:contenttweaker:arc_focuser>)//电弧聚焦通道
            .where("5",<blockstate:contenttweaker:arc_emitter>)//电弧生成器
            .where("6",<blockstate:contenttweaker:arc_suspension_field_casing>)//电弧延留场外壳
            .where("C",controller.self())//控制器
            .build();
    } as IPatternBuilderFunction)
    .withBaseTexture(<metastate:gregtech:metal_casing:7>)
    .withRecipeMap(FactoryRecipeMap.start("matter_decompressor")
            .maxInputs(1)
            .maxFluidInputs(1)
            .maxOutputs(110)
            .build()
    )
    .buildAndRegister();


//主方块配方
recipes.addShaped(<gregtech:machine:32003>,
    [[null,null,null],//
    [null,null,null],//
    [null,null,null]]//
);
//部件方块配方
//线圈磁体
RecipeMap.getByName("assembler").recipeBuilder()
    .inputs(<ore:stickTungstenSteel>*6,//钨钢杆
            <ore:wireFineNeodymiumMagnetic>*32,//细磁化钕线
            <ore:foilGold>*6)//金箔
    .fluidInputs(<fluid:epoxy>*288)//环氧树脂
    .outputs(<contenttweaker:coil_magnet>)
    .EUt(480)
    .duration(200)
    .buildAndRegister();
//奇点容器
// RecipeMap.getByName("assembler").recipeBuilder()
//     .inputs(<ore:>*,//
//             <ore:>*,//
//             <ore:>*)//
//     .outputs(<contenttweaker:singularity_cell>)
//     .EUt(7680)
//     .duration(200)
//     .buildAndRegister();
//电弧聚焦通道
// RecipeMap.getByName("assembler").recipeBuilder()
//     .inputs(<ore:>*,//
//             <ore:>*,//
//             <ore:>*)//
//     .outputs(<contenttweaker:arc_focuser>)
//     .EUt(1920)
//     .duration(200)
//     .buildAndRegister();
//电弧生成器
// RecipeMap.getByName("assembler").recipeBuilder()
//     .inputs(<ore:>*,//
//             <ore:>*,//
//             <ore:>*)//
//     .outputs(<contenttweaker:arc_emitter>)
//     .EUt(1920)
//     .duration(200)
//     .buildAndRegister();
//电弧延留场外壳
// RecipeMap.getByName("assembler").recipeBuilder()
//     .inputs(<ore:>*,//
//             <ore:>*,//
//             <ore:>*)//
//     .outputs(<contenttweaker:arc_suspension_field_casing>)
//     .EUt(1920)
//     .duration(200)
//     .buildAndRegister();


//机器配方
RecipeMap.getByName("matter_decompressor").recipeBuilder()
    .hidden()//太难看了
    .notConsumable(<ore:everyGtLens>)
    .fluidInputs(<fluid:ultimate_universal_matter>*1)//Uu
    .chancedOutput(<gregtech:ore_aluminium_0>*1,3300,0)//铝
    .chancedOutput(<gregtech:ore_beryllium_0>*1,3300,0)//铍
    .chancedOutput(<gregtech:ore_cobalt_0>*1,3300,0)//钴
    .chancedOutput(<gregtech:ore_copper_0>*1,3300,0)//铜
    .chancedOutput(<gregtech:ore_gold_0>*1,3300,0)//金
    .chancedOutput(<gregtech:ore_iron_0>*1,3300,0)//铁
    .chancedOutput(<gregtech:ore_lead_0>*1,3300,0)//铅
    .chancedOutput(<gregtech:ore_lithium_0>*1,3300,0)//锂
    .chancedOutput(<gregtech:ore_molybdenum_0>*1,3300,0)//钼
    .chancedOutput(<gregtech:ore_neodymium_0>*1,3300,0)//钕
    .chancedOutput(<gregtech:ore_nickel_0>*1,3300,0)//镍
    .chancedOutput(<gregtech:ore_palladium_0>*1,3300,0)//钯
    .chancedOutput(<gregtech:ore_platinum_0>*1,3300,0)//铂
    .chancedOutput(<gregtech:ore_plutonium_0>*1,3300,0)//钚-239
    .chancedOutput(<gregtech:ore_silver_0>*1,3300,0)//银
    .chancedOutput(<gregtech:ore_sulfur_0>*1,3300,0)//硫
    .chancedOutput(<gregtech:ore_thorium_0>*1,3300,0)//钍
    .chancedOutput(<gregtech:ore_tin_0>*1,3300,0)//锡
    .chancedOutput(<gregtech:ore_naquadah_0>*1,3300,0)//硅岩
    .chancedOutput(<gregtech:ore_certus_quartz_0>*1,3300,0)//赛特斯石英
    .chancedOutput(<gregtech:ore_almandine_0>*1,3300,0)//铁铝榴石
    .chancedOutput(<gregtech:ore_asbestos_0>*1,3300,0)//石棉
    .chancedOutput(<gregtech:ore_banded_iron_0>*1,3300,0)//带状铁
    .chancedOutput(<gregtech:ore_blue_topaz_0>*1,3300,0)//蓝黄玉
    .chancedOutput(<gregtech:ore_brown_limonite_0>*1,3300,0)//棕色褐铁
    .chancedOutput(<gregtech:ore_calcite_0>*1,3300,0)//方解石
    .chancedOutput(<gregtech:ore_cassiterite_0>*1,3300,0)//锡石
    .chancedOutput(<gregtech:ore_cassiterite_sand_0>*1,3300,0)//锡石矿砂
    .chancedOutput(<gregtech:ore_chalcopyrite_0>*1,3300,0)//黄铜
    .chancedOutput(<gregtech:ore_chromite_0>*1,3300,0)//铬铁
    .chancedOutput(<gregtech:ore_cinnabar_0>*1,3300,0)//朱砂
    .chancedOutput(<gregtech:ore_coal_0>*1,3300,0)//煤
    .chancedOutput(<gregtech:ore_cobaltite_0>*1,3300,0)//辉钴
    .chancedOutput(<gregtech:ore_cooperite_0>*1,3300,0)//谢尔顿
    .chancedOutput(<gregtech:ore_diamond_0>*1,3300,0)//钻石
    .chancedOutput(<gregtech:ore_emerald_0>*1,3300,0)//绿宝石
    .chancedOutput(<gregtech:ore_galena_0>*1,3300,0)//方铅
    .chancedOutput(<gregtech:ore_garnierite_0>*1,3300,0)//硅镁镍矿
    .chancedOutput(<gregtech:ore_green_sapphire_0>*1,3300,0)//绿色蓝宝石
    .chancedOutput(<gregtech:ore_grossular_0>*1,3300,0)//钙铝榴石
    .chancedOutput(<gregtech:ore_ilmenite_0>*1,3300,0)//钛铁
    .chancedOutput(<gregtech:ore_bauxite_0>*1,3300,0)//铝土
    .chancedOutput(<gregtech:ore_lazurite_0>*1,3300,0)//蓝金石
    .chancedOutput(<gregtech:ore_magnesite_0>*1,3300,0)//菱镁
    .chancedOutput(<gregtech:ore_magnetite_0>*1,3300,0)//磁铁
    .chancedOutput(<gregtech:ore_molybdenite_0>*1,3300,0)//辉钼
    .chancedOutput(<gregtech:ore_powellite_0>*1,3300,0)//钼钨钙
    .chancedOutput(<gregtech:ore_pyrite_0>*1,3300,0)//黄铁
    .chancedOutput(<gregtech:ore_pyrolusite_0>*1,3300,0)//软锰
    .chancedOutput(<gregtech:ore_pyrope_0>*1,3300,0)//镁铝榴石
    .chancedOutput(<gregtech:ore_rock_salt_0>*1,3300,0)//岩盐
    .chancedOutput(<gregtech:ore_ruby_0>*1,3300,0)//红宝石
    .chancedOutput(<gregtech:ore_salt_0>*1,3300,0)//盐
    .chancedOutput(<gregtech:ore_saltpeter_0>*1,3300,0)//硝石
    .chancedOutput(<gregtech:ore_sapphire_0>*1,3300,0)//蓝宝石
    .chancedOutput(<gregtech:ore_scheelite_0>*1,3300,0)//白钨
    .chancedOutput(<gregtech:ore_sodalite_0>*1,3300,0)//方钠石
    .chancedOutput(<gregtech:ore_tantalite_0>*1,3300,0)//钽铁
    .chancedOutput(<gregtech:ore_spessartine_0>*1,3300,0)//锰铝榴石
    .chancedOutput(<gregtech:ore_sphalerite_0>*1,3300,0)//闪锌
    .chancedOutput(<gregtech:ore_stibnite_0>*1,3300,0)//辉锑
    .chancedOutput(<gregtech:ore_tetrahedrite_0>*1,3300,0)//黝铜
    .chancedOutput(<gregtech:ore_topaz_0>*1,3300,0)//黄玉
    .chancedOutput(<gregtech:ore_tungstate_0>*1,3300,0)//钨酸锂
    .chancedOutput(<gregtech:ore_uraninite_0>*1,3300,0)//晶质铀矿
    .chancedOutput(<gregtech:ore_wulfenite_0>*1,3300,0)//钼铅
    .chancedOutput(<gregtech:ore_yellow_limonite_0>*1,3300,0)//黄色褐铁
    .chancedOutput(<gregtech:ore_nether_quartz_0>*1,3300,0)//下界石英
    .chancedOutput(<gregtech:ore_quartzite_0>*1,3300,0)//石英岩
    .chancedOutput(<gregtech:ore_graphite_0>*1,3300,0)//石墨
    .chancedOutput(<gregtech:ore_bornite_0>*1,3300,0)//斑铜
    .chancedOutput(<gregtech:ore_chalcocite_0>*1,3300,0)//辉铜
    .chancedOutput(<gregtech:ore_realgar_0>*1,3300,0)//雄黄
    .chancedOutput(<gregtech:ore_bastnasite_0>*1,3300,0)//氟碳镧铈
    .chancedOutput(<gregtech:ore_pentlandite_0>*1,3300,0)//镍黄铁
    .chancedOutput(<gregtech:ore_spodumene_0>*1,3300,0)//锂辉石
    .chancedOutput(<gregtech:ore_lepidolite_0>*1,3300,0)//锂云母
    .chancedOutput(<gregtech:ore_glauconite_sand_0>*1,3300,0)//海绿石矿砂
    .chancedOutput(<gregtech:ore_malachite_0>*1,3300,0)//孔雀石
    .chancedOutput(<gregtech:ore_mica_0>*1,3300,0)//云母
    .chancedOutput(<gregtech:ore_barite_0>*1,3300,0)//重晶石
    .chancedOutput(<gregtech:ore_alunite_0>*1,3300,0)//明钒石
    .chancedOutput(<gregtech:ore_talc_0>*1,3300,0)//滑石
    .chancedOutput(<gregtech:ore_soapstone_0>*1,3300,0)//皂石
    .chancedOutput(<gregtech:ore_kyanite_0>*1,3300,0)//蓝晶石
    .chancedOutput(<gregtech:ore_pyrochlore_0>*1,3300,0)//烧绿石
    .chancedOutput(<gregtech:ore_oilsands_0>*1,3300,0)//油砂
    .chancedOutput(<gregtech:ore_olivine_0>*1,3300,0)//橄榄石
    .chancedOutput(<gregtech:ore_opal_0>*1,3300,0)//猫眼石
    .chancedOutput(<gregtech:ore_amethyst_0>*1,3300,0)//紫水晶
    .chancedOutput(<gregtech:ore_lapis_0>*1,3300,0)//青金石
    .chancedOutput(<gregtech:ore_apatite_0>*1,3300,0)//磷灰石
    .chancedOutput(<gregtech:ore_tricalcium_phosphate_0>*1,3300,0)//磷酸三钙
    .chancedOutput(<gregtech:ore_garnet_red_0>*1,3300,0)//红石榴石
    .chancedOutput(<gregtech:ore_garnet_yellow_0>*1,3300,0)//黄石榴石
    .chancedOutput(<gregtech:ore_vanadium_magnetite_0>*1,3300,0)//钒磁铁
    .chancedOutput(<gregtech:ore_pollucite_0>*1,3300,0)//铯榴石
    .chancedOutput(<gregtech:ore_bentonite_0>*1,3300,0)//膨润土
    .chancedOutput(<gregtech:ore_fullers_earth_0>*1,3300,0)//漂白土
    .chancedOutput(<gregtech:ore_pitchblende_0>*1,3300,0)//沥青铀矿
    .chancedOutput(<gregtech:ore_monazite_0>*1,3300,0)//独居石
    .chancedOutput(<gregtech:ore_trona_0>*1,3300,0)//天然碱
    .chancedOutput(<gregtech:ore_gypsum_0>*1,3300,0)//石膏
    .chancedOutput(<gregtech:ore_zeolite_0>*1,3300,0)//氟石
    .chancedOutput(<gregtech:ore_redstone_0>*1,3300,0)//红石
    .chancedOutput(<gregtech:ore_electrotine_0>*1,3300,0)//蓝石
    .chancedOutput(<gregtech:ore_diatomite_0>*1,3300,0)//硅藻土
    .chancedOutput(<gregtech:ore_granitic_mineral_sand_0>*1,3300,0)//花岗岩矿砂
    .chancedOutput(<gregtech:ore_garnet_sand_0>*1,3300,0)//石榴石矿砂
    .chancedOutput(<gregtech:ore_basaltic_mineral_sand_0>*1,3300,0)//玄武岩矿砂
    .EUt(1920)
    .duration(1)
    .buildAndRegister();
