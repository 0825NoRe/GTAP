//0921/0604/24
#priority 1

import mods.gregtech.machine.MachineBuilder;
import mods.gregtech.recipe.RecipeMapBuilder;
import mods.gregtech.recipe.RecipeMaps;
import mods.gregtech.recipe.RecipeMap;

//开发者拆解机

RecipeMapBuilder.create("dev_disassembler")
    .setInputs(1)
    .setOutputs(9)
    .build();
MachineBuilder.create(32170, "dev_disassembler")
    .setMachine()
    .addTierRange(1,8)
    .setRecipeMap(RecipeMap.getByName("dev_disassembler"))
    .setRenderer("machines/assembler")
    .buildAndRegister();
