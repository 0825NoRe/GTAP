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
import scripts.#Misc.CraftingScript_Static;

//园艺玻璃缸
var glass_garden_jar = Builder.start("glass_garden_jar",32001)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle(
                "0222220","0222220","0000000","0000000","0000000","0000000","0000000","0000000","0000000","0000000")
            .aisle(
                "2222222","2211122","0211120","0211120","0211120","0211120","0211120","0211120","0222220","0000000")
            .aisle(
                "2222222","2133312","0100010","0100010","0100010","0111110","0111110","0100010","0200020","0022200")
            .aisle(
                "2222222","2133312","0100010","0100010","0100010","0111110","0111110","0100010","0204020","0022200")
            .aisle(
                "2222222","2133312","0100010","0100010","0100010","0111110","0111110","0100010","0200020","0022200")
            .aisle(
                "2222222","2211122","0211120","0211120","0211120","0211120","0211120","0211120","0222220","0000000")
            .aisle(
                "022C220","0222220","0000000","0000000","0000000","0000000","0000000","0000000","0000000","0000000")
            .where("0",CTPredicate.getAny())//任何
            .where("1",<blockstate:enderio:block_fused_quartz>)//石英玻璃
            .where("2",
                          CTPredicate.states(<metastate:gregtech:metal_casing:3>)//补位方块 - 铝外壳
                        | CTPredicate.abilities(<mte_ability:MAINTENANCE_HATCH>).setMinGlobalLimited(1).setMaxGlobalLimited(1).setPreviewCount(1)//维修仓
                        | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(2).setPreviewCount(1)//能源仓
                        | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setMaxGlobalLimited(2).setPreviewCount(1)//输入总线
                        | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setMaxGlobalLimited(2).setPreviewCount(1)//输入仓
                        | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setMaxGlobalLimited(2).setPreviewCount(1))//输出总线
            .where("3",
                          CTPredicate.states(<blockstate:minecraft:dirt>)//泥土
                        | CTPredicate.states(<blockstate:minecraft:grass>))//草方块
            .where("4",<blockstate:minecraft:glowstone>)//荧石
            .where("C",controller.self())//控制器
            .build();
    } as IPatternBuilderFunction)
    .withBaseTexture(<metastate:gregtech:metal_casing:3>)
    .withRecipeMap(FactoryRecipeMap.start("glass_garden_jar")
            .maxInputs(1)
            .maxFluidInputs(1)
            .maxOutputs(4)
            .build()
    )
    .buildAndRegister();


//主方块配方
A = <gregtech:machine:84>;//
recipes.addShaped(<gregtech:machine:32001>,
    [[N,N,N],
     [N,A,N],
     [N,N,N]]
);

//机器配方
//橡木
RecipeMap.getByName("glass_garden_jar").recipeBuilder()
    .notConsumable([<minecraft:sapling:0>])
    .fluidInputs([<fluid:water>*8000])//水
    .outputs([<minecraft:log:0>*64,
                     <minecraft:sapling:0>*4,
                     <minecraft:leaves:0>*4,
                     <minecraft:apple>*4])
    .EUt(7)
    .duration(1200)
    .buildAndRegister();
RecipeMap.getByName("glass_garden_jar").recipeBuilder()
    .notConsumable([<minecraft:sapling:0>])
    .fluidInputs([<fluid:fermented_biomass>*8000])//发酵生物质
    .outputs([<minecraft:log:0>*64,
                     <minecraft:sapling:0>*4,
                     <minecraft:leaves:0>*4,
                     <minecraft:apple>*4])
    .EUt(7)
    .duration(200)
    .buildAndRegister();
//云杉木
RecipeMap.getByName("glass_garden_jar").recipeBuilder()
    .notConsumable([<minecraft:sapling:1>])
    .fluidInputs([<fluid:water>*8000])//水
    .outputs([<minecraft:log:1>*64,
                     <minecraft:sapling:1>*4,
                     <minecraft:leaves:1>*4])
    .EUt(7)
    .duration(1200)
    .buildAndRegister();
RecipeMap.getByName("glass_garden_jar").recipeBuilder()
    .notConsumable([<minecraft:sapling:1>])
    .fluidInputs([<fluid:fermented_biomass>*8000])//发酵生物质
    .outputs([<minecraft:log:1>*64,
                     <minecraft:sapling:1>*4,
                     <minecraft:leaves:1>*4])
    .EUt(7)
    .duration(200)
    .buildAndRegister();
//白桦木
RecipeMap.getByName("glass_garden_jar").recipeBuilder()
    .notConsumable([<minecraft:sapling:2>])
    .fluidInputs([<fluid:water>*8000])//水
    .outputs([<minecraft:log:2>*64,
                     <minecraft:sapling:2>*4,
                     <minecraft:leaves:2>*4])
    .EUt(7)
    .duration(1200)
    .buildAndRegister();
RecipeMap.getByName("glass_garden_jar").recipeBuilder()
    .notConsumable([<minecraft:sapling:2>])
    .fluidInputs([<fluid:fermented_biomass>*8000])//发酵生物质
    .outputs([<minecraft:log:2>*64,
                     <minecraft:sapling:2>*4,
                     <minecraft:leaves:2>*4])
    .EUt(7)
    .duration(200)
    .buildAndRegister();
//丛林木
RecipeMap.getByName("glass_garden_jar").recipeBuilder()
    .notConsumable([<minecraft:sapling:3>])
    .fluidInputs([<fluid:water>*8000])//水
    .outputs([<minecraft:log:3>*64,
                     <minecraft:sapling:3>*4,
                     <minecraft:leaves:3>*4])
    .EUt(7)
    .duration(1200)
    .buildAndRegister();
RecipeMap.getByName("glass_garden_jar").recipeBuilder()
    .notConsumable([<minecraft:sapling:3>])
    .fluidInputs([<fluid:fermented_biomass>*8000])//发酵生物质
    .outputs([<minecraft:log:3>*64,
                     <minecraft:sapling:3>*4,
                     <minecraft:leaves:3>*4])
    .EUt(7)
    .duration(200)
    .buildAndRegister();
//金合欢木
RecipeMap.getByName("glass_garden_jar").recipeBuilder()
    .notConsumable([<minecraft:sapling:4>])
    .fluidInputs([<fluid:water>*8000])//水
    .outputs([<minecraft:log2:0>*64,
                     <minecraft:sapling:4>*4,
                     <minecraft:leaves2:0>*4])
    .EUt(7)
    .duration(1200)
    .buildAndRegister();
RecipeMap.getByName("glass_garden_jar").recipeBuilder()
    .notConsumable([<minecraft:sapling:4>])
    .fluidInputs([<fluid:fermented_biomass>*8000])//发酵生物质
    .outputs([<minecraft:log2:0>*64,
                     <minecraft:sapling:4>*4,
                     <minecraft:leaves2:0>*4])
    .EUt(7)
    .duration(200)
    .buildAndRegister();
//深色橡木
RecipeMap.getByName("glass_garden_jar").recipeBuilder()
    .notConsumable([<minecraft:sapling:5>*4])
    .fluidInputs([<fluid:water>*16000])//水
    .outputs([<minecraft:log2:1>*96,
                     <minecraft:sapling:5>*8,
                     <minecraft:leaves2:1>*8,
                     <minecraft:apple>*4])
    .EUt(7)
    .duration(1800)
    .buildAndRegister();
RecipeMap.getByName("glass_garden_jar").recipeBuilder()
    .notConsumable([<minecraft:sapling:5>*4])
    .fluidInputs([<fluid:fermented_biomass>*16000])//发酵生物质
    .outputs([<minecraft:log2:1>*96,
                     <minecraft:sapling:5>*8,
                     <minecraft:leaves2:1>*8,
                     <minecraft:apple>*4])
    .EUt(7)
    .duration(300)
    .buildAndRegister();
//橡胶木
RecipeMap.getByName("glass_garden_jar").recipeBuilder()
    .notConsumable([<gregtech:rubber_sapling>])
    .fluidInputs([<fluid:water>*8000])//水
    .outputs([<gregtech:rubber_log>*64,
                     <gregtech:rubber_sapling>*4,
                     <gregtech:rubber_leaves>*4,
                     <gregtech:meta_item_1:438>*8])
    .EUt(7)
    .duration(1200)
    .buildAndRegister();
RecipeMap.getByName("glass_garden_jar").recipeBuilder()
    .notConsumable([<gregtech:rubber_sapling>])
    .fluidInputs([<fluid:fermented_biomass>*8000])//发酵生物质
    .outputs([<gregtech:rubber_log>*64,
                     <gregtech:rubber_sapling>*4,
                     <gregtech:rubber_leaves>*4,
                     <gregtech:meta_item_1:438>*8])
    .EUt(7)
    .duration(200)
    .buildAndRegister();
