import mods.gregtech.recipe.RecipeMap;
import scripts.Misc.CraftingScript_Static;

//自定义材料
//晶金
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<ore:dustGold>,//金粉
             <ore:itemPulsatingPowder>])//充能水晶粉
    .outputs([<gregtech:meta_dust:32000>])
    .EUt(30)
    .duration(100)
    .buildAndRegister();
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:ingotGold>,//金锭
             <ore:itemPulsatingPowder>])//充能水晶粉
    .outputs([<gregtech:meta_ingot:32000>])
    .EUt(30)
    .duration(200)
    .buildAndRegister();
//旋金
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<ore:dustEndSteel>,//末影钢粉
             <ore:dustRedstone>,//红石粉
             <ore:dustLapis>])//青金石粉
    .outputs([<gregtech:meta_dust:32001>])
    .EUt(480)
    .duration(100)
    .buildAndRegister();
//恒金
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<ore:dustNetherStar>,//下界之星粉
             <ore:dustMelodicAlloy>])//旋律合金粉
    .outputs([<gregtech:meta_dust:32002>*2])
    .EUt(7680)
    .duration(100)
    .buildAndRegister();
    RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:netherStar>,//下界之星
             <ore:ingotMelodicAlloy>])//旋律合金锭
    .outputs([<gregtech:meta_ingot:32002>*2])
    .EUt(7680)
    .duration(200)
    .buildAndRegister();
//充能铁
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<ore:dustIron>,//铁粉
             <ore:dustEnderPearl>])//末影珍珠粉
    .outputs([<gregtech:meta_dust:32003>])
    .EUt(30)
    .duration(100)
    .buildAndRegister();
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:ingotIron>,//铁锭
             <ore:enderPearl>])//末影珍珠
    .outputs([<gregtech:meta_ingot:32003>])
    .EUt(30)
    .duration(200)
    .buildAndRegister();
//充能合金
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<ore:dustGold>,//金粉
             <ore:dustRedstone>,//红石粉
             <ore:dustGlowstone>])//荧石粉
    .outputs([<gregtech:meta_dust:32004>])
    .EUt(30)
    .duration(100)
    .buildAndRegister();
//脉冲合金
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<ore:dustEnergeticAlloy>,//充能合金粉
             <ore:dustEnderPearl>])//末影珍珠粉
    .outputs([<gregtech:meta_dust:32005>])
    .EUt(60)
    .duration(100)
    .buildAndRegister();
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:ingotEnergeticAlloy>,//充能合金锭
             <ore:enderPearl>])//末影珍珠
    .outputs([<gregtech:meta_ingot:32005>])
    .EUt(60)
    .duration(200)
    .buildAndRegister();
//魂金
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<minecraft:soul_sand>,//灵魂沙
             <ore:dustGold>])//金粉
    .outputs([<gregtech:meta_dust:32012>])
    .EUt(16)
    .duration(100)
    .buildAndRegister();
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<minecraft:soul_sand>,//灵魂沙
             <ore:ingotGold>])//金锭
    .outputs([<gregtech:meta_ingot:32012>])
    .EUt(30)
    .duration(200)
    .buildAndRegister();
//玄钢
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<ore:dustIron>,//铁粉
             <ore:dustCoal>,//煤粉
             <ore:dustObsidian>])//黑曜石粉
    .outputs([<gregtech:meta_dust:32013>])
    .EUt(16)
    .duration(100)
    .buildAndRegister();
//导电铁
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<ore:dustIron>,//铁粉
             <ore:dustRedstone>])//红石粉
    .outputs([<gregtech:meta_dust:32014>])
    .EUt(16)
    .duration(100)
    .buildAndRegister();
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:ingotIron>,//铁锭
             <ore:dustRedstone>])//红石粉
    .outputs([<gregtech:meta_ingot:32014>])
    .EUt(30)
    .duration(200)
    .buildAndRegister();
//红石合金
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<ore:dustRedstone>,//红石粉
             <ore:dustCoal>,//煤粉
             <ore:dustSilicon>])//硅粉
    .outputs([<gregtech:meta_dust:32015>])
    .EUt(16)
    .duration(100)
    .buildAndRegister();
//磁钢
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<ore:dustIron>,//铁粉
             <ore:dustCoal>,//煤粉
             <ore:dustSilicon>])//硅粉
    .outputs([<gregtech:meta_dust:32016>])
    .EUt(16)
    .duration(100)
    .buildAndRegister();
//末影钢
RecipeMap.getByName("mixer").recipeBuilder()//搅拌机
    .inputs([<ore:dustDarkSteel>,//玄钢粉
             <ore:dustEndstone>])//末地石粉
    .outputs([<gregtech:meta_dust:32017>])
    .EUt(16)
    .duration(100)
    .buildAndRegister();
RecipeMap.getByName("alloy_smelter").recipeBuilder()//合金炉
    .inputs([<ore:ingotDarkSteel>,//玄钢锭
             <ore:dustEndstone>])//末地石粉
    .outputs([<gregtech:meta_ingot:32017>])
    .EUt(30)
    .duration(200)
    .buildAndRegister();
//铀燃料
RecipeMap.getByName("large_chemical_reactor").recipeBuilder()//大型化学反应釜
    .fluidInputs([<fluid:uranium_235>*144,//铀-235
                  <fluid:uranium>*288])//铀-238
    .fluidOutputs([<fluid:uranium_fuel>*432])
    .EUt(30)
    .duration(1200)
    .buildAndRegister();
//MOX燃料
RecipeMap.getByName("large_chemical_reactor").recipeBuilder()//大型化学反应釜
    .fluidInputs([<fluid:uranium_235>*432,//铀-235
                  <fluid:uranium>*288,//铀-238
                  <fluid:plutonium_241>*144,//钚-241
                  <fluid:plutonium>*432])//钚-239
    .fluidOutputs([<fluid:mox_fuel>*1296])
    .circuit(32)
    .EUt(30)
    .duration(1200)
    .buildAndRegister();

