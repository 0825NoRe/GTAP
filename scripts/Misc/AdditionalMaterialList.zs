//2248/0412/24
#loader gregtech
#priority 3

import mods.gregtech.material.Material;
import mods.gregtech.material.MaterialRegistry;
import mods.gregtech.material.MaterialBuilder;
import mods.gregtech.material.Elements;

//原版材料
<material:glowstone>.setFormula("AuSi(FeS₂)₅(CrAl₂O₃)Hg₃(?)", true);//荧石

//自定义材料
//32000 - 晶金 - Crystalline Alloy
MaterialBuilder(32000, "crystalline_alloy")
    .ingot()
    .fluid()
    .flags(["generate_plate","generate_rod"])
    .color(0x88FFFF)
    .iconSet("shiny")
    .build();
<material:crystalline_alloy>.setFormula("(((Fe)(BeK₄N₅))₈(C)₉)(Au)", true);

//32001 - 旋金 - Melodic Alloy
MaterialBuilder(32001, "melodic_alloy")
    .ingot()
    .fluid()
    .flags(["generate_plate","generate_rod"])
    .color(0xDD99FF)
    .iconSet("shiny")
    .build();
<material:melodic_alloy>.setFormula("(((Fe)(C)(MgFeSi₂O₄))(?))(Si(FeS₂)₅(CrAl₂O₃)Hg₃)((Al₆Si₆Ca₈Na₈)₁₂(Al₃Si₃Na₄Cl)₂(FeS₂)(CaCO₃))", true);

//32002 - 恒金 - Stellar Alloy
MaterialBuilder(32002, "stellar_alloy")
    .ingot()
    .fluid()
    .flags(["generate_plate","generate_rod"])
    .color(0xFFFFCC)
    .iconSet("shiny")
    .build();
<material:stellar_alloy>.setFormula("((((Fe)(C)(MgFeSi₂O₄))(?))(Si(FeS₂)₅(CrAl₂O₃)Hg₃)((Al₆Si₆Ca₈Na₈)₁₂(Al₃Si₃Na₄Cl)₂(FeS₂)(CaCO₃)))(?)", true);

//32003 - 充能铁 - Pulsating Iron
MaterialBuilder(32003, "pulsating_iron")
    .ingot()
    .fluid()
    .flags(["generate_plate","generate_rod"])
    .color(0x66DD66)
    .iconSet("metallic")
    .build();
<material:pulsating_iron>.setFormula("(Fe)(BeK₄N₅)", true);

//32004 - 充能合金 - Energetic Alloy
MaterialBuilder(32004, "energetic_alloy")
    .ingot()
    .fluid()
    .flags(["generate_plate","generate_rod"])
    .color(0xEEBB44)
    .iconSet("metallic")
    .build();
<material:energetic_alloy>.setFormula("(AuSi(FeS₂)₅(CrAl₂O₃)Hg₃)(AuSi(FeS₂)₅(CrAl₂O₃)Hg₃(?))", true);

//32005 - 脉冲合金 - Vibrant Alloy
MaterialBuilder(32005, "vibrant_alloy")
    .ingot()
    .fluid()
    .flags(["generate_plate","generate_rod"])
    .color(0x99EE66)
    .iconSet("metallic")
    .build();
<material:vibrant_alloy>.setFormula("((AuSi(FeS₂)₅(CrAl₂O₃)Hg₃)(AuSi(FeS₂)₅(CrAl₂O₃)Hg₃(?)))(BeK₄N₅)", true);

//32006 - 超临界蒸汽 - SupercriticalSteam
MaterialBuilder(32006,"supercritical_steam")
    .fluid()
    .fluidTemp(900)
    .color(0xDDDDDD)
    .build();
<material:supercritical_steam>.setFormula("H₂O", true);

//32007 - 枯竭钍燃料 - ThoriumFuelDepleted
MaterialBuilder(32007,"thorium_fuel_depleted")
    .fluid()
    .fluidTemp(3200)
    .color(0x332211)
    .build();
<material:thorium_fuel_depleted>.setFormula("(?)", true);

//32008 - 铀燃料 - UraniumFuel
MaterialBuilder(32008,"uranium_fuel")
    .fluid()
    .fluidTemp(300)
    .color(0x335533)
    .build();
<material:uranium_fuel>.setFormula("U", true);

//32009 - 枯竭铀燃料 - UraniumFuelDepleted
MaterialBuilder(32009,"uranium_fuel_depleted")
    .fluid()
    .fluidTemp(3200)
    .color(0x225522)
    .build();
<material:uranium_fuel_depleted>.setFormula("(?)", true);

//32010 - 钚铀混合氧化物燃料 - MOXFuel
MaterialBuilder(32010,"mox_fuel")
    .fluid()
    .fluidTemp(300)
    .color(0x333344)
    .build();
<material:mox_fuel>.setFormula("(Pu)(U)", true);

//32011 - 枯竭钚铀混合氧化物燃料 - MOXFuelDepleted
MaterialBuilder(32011,"mox_fuel_depleted")
    .fluid()
    .fluidTemp(3200)
    .color(0x222233)
    .build();
<material:mox_fuel_depleted>.setFormula("(?)", true);

//32012 - 魂金 - Soularium Alloy
MaterialBuilder(32012, "soularium_alloy")
    .ingot()
    .fluid()
    .flags(["generate_plate","generate_rod"])
    .color(0x553300)
    .iconSet("metallic")
    .build();
<material:soularium_alloy>.setFormula("(Au)(?)", true);

//32013 - 玄钢 - Dark Steel
MaterialBuilder(32013, "dark_steel")
    .ingot()
    .fluid()
    .flags(["generate_plate","generate_rod"])
    .color(0x333333)
    .iconSet("metallic")
    .build();
<material:dark_steel>.setFormula("(Fe)(C)(MgFeSi₂O₄)", true);

//32014 - 导电铁 - Conductive iron
MaterialBuilder(32014, "conductive_iron")
    .ingot()
    .fluid()
    .flags(["generate_plate","generate_rod"])
    .color(0xFFCCCC)
    .iconSet("metallic")
    .build();
<material:conductive_iron>.setFormula("(Fe)(Si(FeS₂)₅(CrAl₂O₃)Hg₃(?))", true);

//32015 - 红石合金 - Redstone Alloy
MaterialBuilder(32015, "redstone_alloy")
    .ingot()
    .fluid()
    .flags(["generate_plate","generate_rod"])
    .color(0xCC3333)
    .iconSet("metallic")
    .build();
<material:redstone_alloy>.setFormula("(Si(FeS₂)₅(CrAl₂O₃)Hg₃(?))(C)(Si)", true);

//32016 - 磁钢 - Electrical Steel
MaterialBuilder(32016, "electrical_steel")
    .ingot()
    .fluid()
    .flags(["generate_plate","generate_rod"])
    .color(0xAAAAAA)
    .iconSet("metallic")
    .build();
<material:electrical_steel>.setFormula("(Fe)(C)(Si)", true);

//32017 - 末影钢 - End Steel
MaterialBuilder(32017, "end_steel")
    .ingot()
    .fluid()
    .flags(["generate_plate","generate_rod"])
    .color(0xCCCC88)
    .iconSet("metallic")
    .build();
<material:end_steel>.setFormula("((Fe)(C)(MgFeSi₂O₄))(?)", true);
