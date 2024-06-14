//0851/0604/24
#priority 1

import mods.gregtech.machine.MachineBuilder;
import mods.gregtech.recipe.RecipeMapBuilder;
import mods.gregtech.recipe.RecipeMaps;
import mods.gregtech.recipe.RecipeMap;

//过载燃气涡轮

MachineBuilder.create(32160, "gas_turbine_ev")
    .setGenerator()
    .addTier(4)
    .setRecipeMap(RecipeMap.getByName("gas_turbine"))
    .setRenderer("generators/gas_turbine")
    .buildAndRegister();

//配方(获取)
 recipes.addShaped(<gregtech:machine:32166>,
 [[<>,<>,<>],//
  [<>,<>,<>],//
  [<>,<>,<>]]);//
RecipeMap.getByName("assembler").recipeBuilder()
    .inputs([
        <gregtech:machine:990>*1,//IV机身
        <gregtech:machine:1641>*1,//EV转子支架
        <ore:circuitIv>*1,//IV电路板
        <gregtech:fluid_pipe_normal:115>*1,//钨流体管道
        <gregtech:wire_single:427>*8,//EV超导线
        <gregtech:meta_item_1:130>*4])//EV马达
    .outputs([
        <gregtech:machine:32166>*1])
    .EUt(7)
    .duration(200)
    .buildAndRegister();
