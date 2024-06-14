//1124/0401/24
#priority 1

import mods.gregtech.machine.MachineBuilder;
import mods.gregtech.recipe.RecipeMapBuilder;
import mods.gregtech.recipe.RecipeMaps;
import mods.gregtech.recipe.RecipeMap;

//原子再构机

RecipeMapBuilder.create("atomic_reconstructor")
    .setInputs(1)
    .setOutputs(9)
    .build();
MachineBuilder.create(32110, "atomic_reconstructor")
    .setMachine()
    .addTierRange(1,8)
    .setRecipeMap(RecipeMap.getByName("atomic_reconstructor"))
    .setRenderer("machines/assembler")
    .buildAndRegister();
