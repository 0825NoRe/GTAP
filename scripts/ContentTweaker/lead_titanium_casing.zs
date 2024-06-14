#loader contenttweaker
#priority 2

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

val lead_titanium_casing as Block = VanillaFactory.createBlock("lead_titanium_casing", <blockmaterial:iron>);
    lead_titanium_casing.toolClass = "wrench";
    lead_titanium_casing.register();