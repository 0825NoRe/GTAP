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

//灵魂投影仪-等级2-普通巨构
Builder.start("soul_projector",32005)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle("11111","11111","11111","11111","11111")
            .aisle("11111","10001","10001","10001","11111")
            .aisle("11111","10201","10201","10201","11111")
            .aisle("11111","10001","10001","10001","11111")
            .aisle("11111","11111","11C11","11111","11111")
            .where("0",CTPredicate.getAny())//任何
            .where("1",CTPredicate.states(<metastate:gregtech:metal_casing:3>).setMinGlobalLimited(16)//补位方块 - 铝外壳
                     | CTPredicate.abilities(<mte_ability:MAINTENANCE_HATCH>).setMinGlobalLimited(1).setMaxGlobalLimited(1).setPreviewCount(1)//维修仓
                     | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(4).setPreviewCount(1)//能源仓
                     | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)//输入总线
                     | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)//输入仓
                     | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1))//输出总线
                     | CTPredicate.abilities(<mte_ability:EXPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)//输出仓
            .where("2",<blockstate:enderio:block_fused_quartz>)//某管道
            .where("C",controller.self())//控制器
            .build();
    } as IPatternBuilderFunction)
    .withBaseTexture(<metastate:gregtech:metal_casing:3>)
    .withRecipeMap(FactoryRecipeMap.start("soul_projector")
            .maxInputs(1)
            .maxFluidInputs(1)
            .maxOutputs(9)
            .maxFluidOutputs(1)
            .build()
    )
    .buildAndRegister();


//主方块配方
recipes.addShaped(<gregtech:machine:32005>,
    [[null,null,null],//
     [null,null,null],//
     [null,null,null]]//
);

//机器配方
//?
// RecipeMap.getByName("soul_projector").recipeBuilder()
//     .notConsumable([])//灵魂瓶
//     .fluidInputs([])//液态魂金
//     .outputs([])//
//     .fluidOutputs([])//液态经验
//     .EUt()
//     .duration()
//     .buildAndRegister();
