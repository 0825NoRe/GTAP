#loader contenttweaker
#priority 2

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

val arc_focuser as Block = VanillaFactory.createBlock("arc_focuser", <blockmaterial:iron>);
    arc_focuser.toolClass = "wrench";
    arc_focuser.register();