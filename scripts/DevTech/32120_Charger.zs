//1124/0401/24
#priority 1

import mods.gregtech.machine.MachineBuilder;
import mods.gregtech.recipe.RecipeMapBuilder;
import mods.gregtech.recipe.RecipeMaps;
import mods.gregtech.recipe.RecipeMap;

//充能器

RecipeMapBuilder.create("charger")
    .setInputs(1)
    .setOutputs(1)
    .build();
MachineBuilder.create(32120, "charger")
    .setMachine()
    .addTierRange(1,8)
    .setRecipeMap(RecipeMap.getByName("charger"))
    .setRenderer("machines/assembler")
    .buildAndRegister();
