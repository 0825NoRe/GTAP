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
import scripts.Misc.CraftingScript_Static;

//裂变反应堆
var fission_reactor = Builder.start("fission_reactor",32002)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle("C")
            .where("0",CTPredicate.getAny())//任何
            .where("1",<blockstate:enderio:block_fused_quartz>)//石英玻璃
            .where("2",
                          CTPredicate.states(<metastate:gregtech:metal_casing:6>).setMinGlobalLimited(4)//补位方块 - 钛外壳
                        | CTPredicate.abilities(<mte_ability:MAINTENANCE_HATCH>).setMinGlobalLimited(1).setMaxGlobalLimited(1).setPreviewCount(1)//维修仓
                        | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(2).setPreviewCount(1)//能源仓
                        | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)//输入总线
                        | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(2).setPreviewCount(2)//输入仓
                        | CTPredicate.abilities(<mte_ability:EXPORT_FLUIDS>).setMinGlobalLimited(2).setPreviewCount(2))//输出仓
            .where("C",controller.self())//控制器
            .build();
    } as IPatternBuilderFunction)
    .withBaseTexture(<metastate:gregtech:metal_casing:6>)
    .withRecipeMap(FactoryRecipeMap.start("fission_reactor")
            .maxInputs(1)
            .maxFluidInputs(2)
            .maxFluidOutputs(2)
            .build()
    )
    .buildAndRegister();


//主方块配方
A = <gregtech:machine:85>;//
recipes.addShaped(<gregtech:machine:32002>,
    [[N,N,N],
     [N,A,N],
     [N,N,N]]
);
//机器配方
//钍
RecipeMap.getByName("fission_reactor").recipeBuilder()
    .fluidInputs([<fluid:water>*32000,
                          <fluid:thorium>*288])
    .fluidOutputs([<fluid:supercritical_steam>*32000,
                             <fluid:thorium_fuel_depleted>*288])
    .EUt(1920)
    .duration(1200)
    .buildAndRegister();
RecipeMap.getByName("fission_reactor").recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:497>*4)
    .fluidInputs([<fluid:water>*32000,
                          <fluid:thorium>*288])
    .fluidOutputs([<fluid:supercritical_steam>*32000,
                             <fluid:thorium_fuel_depleted>*288])
    .EUt(1920)
    .duration(600)
    .buildAndRegister();
//铀
RecipeMap.getByName("fission_reactor").recipeBuilder()
    .fluidInputs([<fluid:water>*128000,
                          <fluid:uranium_fuel>*288])
    .fluidOutputs([<fluid:supercritical_steam>*128000,
                             <fluid:uranium_fuel_depleted>*288])
    .EUt(7680)
    .duration(1200)
    .buildAndRegister();
RecipeMap.getByName("fission_reactor").recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:497>*4)
    .fluidInputs([<fluid:water>*128000,
                          <fluid:uranium_fuel>*288])
    .fluidOutputs([<fluid:supercritical_steam>*128000,
                             <fluid:uranium_fuel_depleted>*288])
    .EUt(7680)
    .duration(600)
    .buildAndRegister();
//MOX
RecipeMap.getByName("fission_reactor").recipeBuilder()
    .fluidInputs([<fluid:water>*512000,
                          <fluid:mox_fuel>*288])
    .fluidOutputs([<fluid:supercritical_steam>*512000,
                             <fluid:mox_fuel_depleted>*288])
    .EUt(30720)
    .duration(1200)
    .buildAndRegister();
RecipeMap.getByName("fission_reactor").recipeBuilder()
    .notConsumable(<gregtech:meta_item_1:497>*4)
    .fluidInputs([<fluid:water>*512000,
                          <fluid:mox_fuel>*288])
    .fluidOutputs([<fluid:supercritical_steam>*512000,
                             <fluid:mox_fuel_depleted>*288])
    .EUt(30720)
    .duration(600)
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
