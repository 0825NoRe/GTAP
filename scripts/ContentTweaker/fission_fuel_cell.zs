#loader contenttweaker
#priority 2

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;

val fission_fuel_cell as Block = VanillaFactory.createBlock("fission_fuel_cell", <blockmaterial:glass>);
    fission_fuel_cell.toolClass = "wrench";
    fission_fuel_cell.blockLayer = "CUTOUT";
    fission_fuel_cell.fullBlock = false;
    fission_fuel_cell.register();