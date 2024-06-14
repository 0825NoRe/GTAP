//1124/0401/24
#priority 1

import mods.gregtech.machine.MachineBuilder;
import mods.gregtech.recipe.RecipeMapBuilder;
import mods.gregtech.recipe.RecipeMaps;
import mods.gregtech.recipe.RecipeMap;

//头颅装配机

RecipeMapBuilder.create("slice_and_splice")
    .setInputs(6)
    .setOutputs(1)
    .build();
MachineBuilder.create(32100, "slice_and_splice")
    .setMachine()
    .addTierRange(1,8)
    .setRecipeMap(RecipeMap.getByName("slice_and_splice"))
    .setRenderer("machines/assembler")
    .buildAndRegister();
