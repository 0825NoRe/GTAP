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

//裂变反应堆-等级2-普通巨构
Builder.start("fission_reactor",32002)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle("00000","01110","01110","01110","01110","00000")
            .aisle("01110","13431","13431","13431","13431","01110")
            .aisle("01110","14241","14241","14241","14241","01110")
            .aisle("01110","13431","13431","13431","13431","01110")
            .aisle("00000","01C10","01110","01110","01110","00000")
            .where("0",CTPredicate.getAny())//任何
            .where("1",CTPredicate.states(<blockstate:contenttweaker:lead_titanium_casing>).setMinGlobalLimited(8)//补位方块 - 铅钛混合外壳
                     | CTPredicate.abilities(<mte_ability:MAINTENANCE_HATCH>).setMinGlobalLimited(1).setMaxGlobalLimited(1).setPreviewCount(1)//维修仓
                     | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(4).setPreviewCount(1)//能源仓
                     | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setPreviewCount(1)//输入总线
                     | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(2).setPreviewCount(2)//输入仓
                     | CTPredicate.abilities(<mte_ability:EXPORT_FLUIDS>).setMinGlobalLimited(2).setPreviewCount(2))//输出仓
            .where("2",<blockstate:contenttweaker:fission_fuel_cell>)//燃料容器
            .where("3",<blockstate:contenttweaker:fission_heat_exchanger>)//换热器
            .where("4",<blockstate:contenttweaker:fission_coolant_channel>)//冷却通道
            .where("C",controller.self())//控制器
            .build();
    } as IPatternBuilderFunction)
    .withBaseTexture(<blockstate:contenttweaker:lead_titanium_casing>)
    .withRecipeMap(FactoryRecipeMap.start("fission_reactor")
            .maxInputs(1)
            .maxFluidInputs(2)
            .maxFluidOutputs(2)
            .build()
    )
    .buildAndRegister();


//主方块配方
recipes.addShaped(<gregtech:machine:32002>,
    [[null,null,null],//铅板 中子源 铅板
    [null,null,null],//铅板 EV机身 铅板
    [null,null,null]]//铅板 中子源 铅板
);
//外壳配方
RecipeMap.getByName("assembler").recipeBuilder()
    .inputs(<ore:plateLead>*4,//铅板
            <ore:plateTitanium>*4,//钛板
            <ore:stickTitanium>*2)//钛杆
    .outputs(<contenttweaker:lead_titanium_casing>)
    .EUt(1920)
    .duration(200)
    .buildAndRegister();


//机器配方
//钍
RecipeMap.getByName("fission_reactor").recipeBuilder()
    .fluidInputs([<fluid:water>*2000,//水
                  <fluid:thorium>*10])//钍
    .fluidOutputs([<fluid:supercritical_steam>*2000,//超临界蒸汽
                   <fluid:thorium_fuel_depleted>*10])//枯竭钍燃料
    .EUt(1920)
    .duration(20)
    .buildAndRegister();
RecipeMap.getByName("fission_reactor").recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:497>*6)//铱反射板
    .fluidInputs([<fluid:water>*2000,//水
                  <fluid:thorium>*10])//钍
    .fluidOutputs([<fluid:supercritical_steam>*2000,//超临界蒸汽
                   <fluid:thorium_fuel_depleted>*10])//枯竭钍燃料
    .EUt(1920)
    .duration(10)
    .buildAndRegister();
//铀燃料
RecipeMap.getByName("fission_reactor").recipeBuilder()
    .fluidInputs([<fluid:water>*8000,//水
                  <fluid:uranium_fuel>*10])//铀燃料
    .fluidOutputs([<fluid:supercritical_steam>*8000,//超临界蒸汽
                   <fluid:uranium_fuel_depleted>*10])//枯竭铀燃料
    .EUt(7680)
    .duration(20)
    .buildAndRegister();
RecipeMap.getByName("fission_reactor").recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:497>*6)//铱反射板
    .fluidInputs([<fluid:water>*8000,//水
                  <fluid:uranium_fuel>*10])//铀燃料
    .fluidOutputs([<fluid:supercritical_steam>*8000,//超临界蒸汽
                   <fluid:uranium_fuel_depleted>*10])//枯竭铀燃料
    .EUt(7680)
    .duration(10)
    .buildAndRegister();
//MOX燃料
RecipeMap.getByName("fission_reactor").recipeBuilder()
    .fluidInputs([<fluid:water>*32000,//水
                  <fluid:mox_fuel>*10])//MOX燃料
    .fluidOutputs([<fluid:supercritical_steam>*32000,//超临界蒸汽
                   <fluid:mox_fuel_depleted>*10])//枯竭MOX燃料
    .EUt(30720)
    .duration(20)
    .buildAndRegister();
RecipeMap.getByName("fission_reactor").recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:497>*6)//铱反射板
    .fluidInputs([<fluid:water>*32000,//水
                  <fluid:mox_fuel>*10])//MOX燃料
    .fluidOutputs([<fluid:supercritical_steam>*32000,//超临界蒸汽
                   <fluid:mox_fuel_depleted>*10])//枯竭MOX燃料
    .EUt(30720)
    .duration(10)
    .buildAndRegister();


//枯竭燃料处理
//钍 [铀-238,铀-235,铯]
RecipeMap.getByName("centrifuge").recipeBuilder()
    .fluidInputs([<fluid:thorium_fuel_depleted>*144])
    .outputs([<gregtech:meta_dust_tiny:116>*2,
              <gregtech:meta_dust_tiny:117>,
              <gregtech:meta_dust_tiny:15>])
    .EUt(30)
    .duration(400)
    .buildAndRegister();
//铀 [铀-238,钚-239,钡,氪]
RecipeMap.getByName("centrifuge").recipeBuilder()
    .fluidInputs([<fluid:uranium_fuel_depleted>*144])
    .outputs([<gregtech:meta_dust_tiny:116>*3,
              <gregtech:meta_dust_tiny:81>*2,
              <gregtech:meta_dust_tiny:8>*2])
    .fluidOutputs([<liquid:krypton>*100])
    .EUt(30)
    .duration(400)
    .buildAndRegister();
//MOX [钚-241,铯,钯,镉]
RecipeMap.getByName("centrifuge").recipeBuilder()
    .fluidInputs([<fluid:mox_fuel_depleted>*144])
    .outputs([<gregtech:meta_dust_tiny:82>*2,
              <gregtech:meta_dust_tiny:15>*2,
              <gregtech:meta_dust_tiny:77>*2,
              <gregtech:meta_dust_tiny:19>])
    .EUt(30)
    .duration(400)
    .buildAndRegister();
