//0130/0423/24
#priority 1

import mods.gregtech.machine.MachineBuilder;
import mods.gregtech.recipe.RecipeMapBuilder;
import mods.gregtech.recipe.RecipeMaps;
import mods.gregtech.recipe.RecipeMap;

//高压涡旋发电机

RecipeMapBuilder.create("high_pressure_vortex_generator")
    .setInputs(1)
    .setFluidInputs(2)
    .build();
MachineBuilder.create(32130, "high_pressure_vortex_generator")
    .setGenerator()
    .addTier(4,5,6)
    .setRecipeMap(RecipeMap.getByName("high_pressure_vortex_generator"))
    .setRenderer("generators/gas_turbine")
    .buildAndRegister();

//配方(获取)
RecipeMap.getByName("assembler").recipeBuilder()//EV
    .inputs([
        <gregtech:machine:990>*1,//IV机身
        <gregtech:machine:1641>*1,//EV转子支架
        <ore:circuitIv>*1,//IV电路板
        <gregtech:fluid_pipe_normal:115>*1,//钨流体管道
        <gregtech:wire_single:427>*8,//EV超导线
        <gregtech:meta_item_1:130>*4])//EV马达
    .outputs([
        <gregtech:machine:32136>*1])
    .EUt(1920)
    .duration(400)
    .buildAndRegister();
RecipeMap.getByName("assembler").recipeBuilder()//IV
    .inputs([
        <gregtech:machine:991>*1,//LuV机身
        <gregtech:machine:1642>*1,//IV转子支架
        <ore:circuitLuv>*1,//LuV电路板
        <gregtech:fluid_pipe_normal:115>*1,//钨流体管道
        <gregtech:wire_single:428>*8,//IV超导线
        <gregtech:meta_item_1:131>*4])//IV马达
    .outputs([
        <gregtech:machine:32137>*1])
    .EUt(7680)
    .duration(400)
    .buildAndRegister();
RecipeMap.getByName("assembler").recipeBuilder()//LuV
    .inputs([
        <gregtech:machine:992>*1,//ZPM机身
        <gregtech:machine:1643>*1,//LuV转子支架
        <ore:circuitZpm>*1,//ZPM电路板
        <gregtech:fluid_pipe_normal:115>*1,//钨流体管道
        <gregtech:wire_single:429>*8,//LuV超导线
        <gregtech:meta_item_1:132>*4])//LuV马达
    .outputs([
        <gregtech:machine:32138>*1])
    .EUt(30720)
    .duration(400)
    .buildAndRegister();
//配方(用途)
RecipeMap.getByName("high_pressure_vortex_generator").recipeBuilder()
    .notConsumable([
        <gregtech:meta_item_1:711>])//转子
    .fluidInputs([
        <liquid:supercritical_steam>*1280,//超临界蒸汽
        <liquid:lubricant>*1])//润滑油
    .EUt(-2048)
    .duration(80)
    .buildAndRegister();
