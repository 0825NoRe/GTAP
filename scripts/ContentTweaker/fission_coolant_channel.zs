#loader contenttweaker
#priority 2

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

val fission_coolant_channel as Block = VanillaFactory.createBlock("fission_coolant_channel", <blockmaterial:iron>);
    fission_coolant_channel.toolClass = "wrench";
    fission_coolant_channel.register();