#loader contenttweaker
#priority 2

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

val singularity_cell as Block = VanillaFactory.createBlock("singularity_cell", <blockmaterial:iron>);
    singularity_cell.toolClass = "wrench";
    singularity_cell.register();