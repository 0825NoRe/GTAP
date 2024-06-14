#loader contenttweaker
#priority 2

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

val coil_magnet as Block = VanillaFactory.createBlock("coil_magnet", <blockmaterial:iron>);
    coil_magnet.toolClass = "wrench";
    coil_magnet.register();