//0858/0604/24
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

//进阶电弧炉-等级2-普通巨构
Builder.start("advanced_arc_furnace",32006)
    .withPattern(function(controller as IControllerTile) as IBlockPattern {
        return FactoryBlockPattern.start()
            .aisle("1111111","1110000","1110000","0000000","0000000")
            .aisle("1111111","1210111","1210000","1100000","0000000")
            .aisle("1111111","1210101","1210030","1300030","0333330")
            .aisle("1111111","1210111","1210000","1100000","0000000")
            .aisle("111C111","1110000","1110000","0000000","0000000")
            .where("0",CTPredicate.getAny())//任何
            .where("1",CTPredicate.states(<metastate:gregtech:metal_casing:3>).setMinGlobalLimited(16)//补位方块 - 铝外壳
                     | CTPredicate.abilities(<mte_ability:MAINTENANCE_HATCH>).setMinGlobalLimited(1).setMaxGlobalLimited(1).setPreviewCount(1)//维修仓
                     | CTPredicate.abilities(<mte_ability:INPUT_ENERGY>).setMinGlobalLimited(1).setMaxGlobalLimited(4).setPreviewCount(1)//能源仓
                     | CTPredicate.abilities(<mte_ability:IMPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1)//输入总线
                     | CTPredicate.abilities(<mte_ability:IMPORT_FLUIDS>).setMinGlobalLimited(1).setPreviewCount(1)//输入仓
                     | CTPredicate.abilities(<mte_ability:EXPORT_ITEMS>).setMinGlobalLimited(1).setPreviewCount(1))//输出总线
            .where("2",<blockstate:enderio:block_fused_quartz>)//某线圈
            .where("3",CTPredicate.states(<blockstate:minecraft:grass>))//某管道
            .where("C",controller.self())//控制器
            .build();
    } as IPatternBuilderFunction)
    .withBaseTexture(<metastate:gregtech:metal_casing:3>)
    .withRecipeMap(FactoryRecipeMap.start("advanced_arc_furnace")
            .maxInputs(1)
            .maxFluidInputs(1)
            .maxOutputs(4)
            .build()
    )
    .buildAndRegister();


//主方块配方
recipes.addShaped(<gregtech:machine:32006>,
    [[null,null,null],//
     [null,null,null],//
     [null,null,null]]//
);

//机器配方
//?
// RecipeMap.getByName("advanced_arc_furnace").recipeBuilder()
//     .inputs()//
//     .fluidInputs([])//
//     .outputs([])
//     .EUt()
//     .duration()
//     .buildAndRegister();
