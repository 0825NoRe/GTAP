#loader contenttweaker
#priority 2

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

val arc_suspension_field_casing as Block = VanillaFactory.createBlock("arc_suspension_field_casing", <blockmaterial:iron>);
    arc_suspension_field_casing.toolClass = "wrench";
    arc_suspension_field_casing.register();