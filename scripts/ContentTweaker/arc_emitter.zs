#loader contenttweaker
#priority 2

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

val arc_emitter as Block = VanillaFactory.createBlock("arc_emitter", <blockmaterial:iron>);
    arc_emitter.toolClass = "wrench";
    arc_emitter.register();