#loader contenttweaker
#priority 2

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

val fission_heat_exchanger as Block = VanillaFactory.createBlock("fission_heat_exchanger", <blockmaterial:iron>);
    fission_heat_exchanger.toolClass = "wrench";
    fission_heat_exchanger.register();