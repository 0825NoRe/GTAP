import mods.gregtech.recipe.RecipeMap;
import scripts.Misc.CraftingScript_Static;

//自定义材料
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

//蒸馏塔：蒸馏水配方优化
<recipemap:distillation_tower>.findRecipe(120, null, [<liquid:water> * 576]).remove();//自来水
RecipeMap.getByName("distillation_tower").recipeBuilder()
    .fluidInputs([<liquid:water>*4000])
    .fluidOutputs([<liquid:distilled_water>*3000])
    .EUt(120)
    .duration(200)
    .buildAndRegister();

//蒸馏塔：润滑油配方优化
<recipemap:distillation_tower>.findRecipe(96, null, [<liquid:creosote> * 24]).remove();//杂酚油
<recipemap:distillation_tower>.findRecipe(96, null, [<liquid:seed_oil> * 24]).remove();//种子油
RecipeMap.getByName("distillation_tower").recipeBuilder()
    .fluidInputs([<liquid:creosote>*1000])
    .fluidOutputs([<liquid:lubricant>*500])
    .EUt(120)
    .duration(200)
    .buildAndRegister();
RecipeMap.getByName("distillation_tower").recipeBuilder()
    .fluidInputs([<liquid:seed_oil>*1000])
    .fluidOutputs([<liquid:lubricant>*500])
    .EUt(120)
    .duration(200)
    .buildAndRegister();

//
