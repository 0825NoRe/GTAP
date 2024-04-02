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

