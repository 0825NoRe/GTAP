//1113/0401/24
#priority 1

import mods.gregtech.machine.MachineBuilder;
import mods.gregtech.recipe.RecipeMapBuilder;
import mods.gregtech.recipe.RecipeMaps;
import mods.gregtech.recipe.RecipeMap;

//灵魂绑定器

RecipeMapBuilder.create("soul_binder")
    .setInputs(2)
    .setOutputs(2)
    .build();
MachineBuilder.create(32140, "soul_binder")
    .setMachine()
    .addTierRange(1,8)
    .setRecipeMap(RecipeMap.getByName("soul_binder"))
    .setRenderer("machines/assembler")
    .buildAndRegister();
