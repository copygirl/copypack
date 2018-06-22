import crafttweaker.item.IItemStack;

# Copper and tin are the exception to the rebalancing.

# =======================================
# Disable furnace smelting of most metals
# =======================================

# Iron
furnace.remove(<minecraft:iron_ingot>);
furnace.remove(<minecraft:iron_ingot> * 2);
# Gold
furnace.remove(<minecraft:gold_ingot>);
furnace.remove(<minecraft:gold_ingot> * 2);
# Lead
furnace.remove(<immersiveengineering:metal:2>);
furnace.remove(<thermalfoundation:material:131>);
furnace.remove(<thermalfoundation:material:131> * 2);
# Silver
furnace.remove(<immersiveengineering:metal:3>);
furnace.remove(<thermalfoundation:material:130>);
furnace.remove(<thermalfoundation:material:130> * 2);
# Alumin(i)um
furnace.remove(<immersiveengineering:metal:1>);
furnace.remove(<thermalfoundation:material:132>);
# Nickel
furnace.remove(<immersiveengineering:metal:4>);
furnace.remove(<thermalfoundation:material:133>);
# Platinum
furnace.remove(<thermalfoundation:material:134>);
furnace.remove(<thermalfoundation:material:134> * 2);
# Uranium
furnace.remove(<immersiveengineering:metal:5>);
# Iridium
furnace.remove(<thermalfoundation:material:135>);
# Mana Infused
furnace.remove(<thermalfoundation:material:136>);
# Steel
furnace.remove(<immersiveengineering:metal:8>);
furnace.remove(<thermalfoundation:material:160>);
# Electrum
furnace.remove(<immersiveengineering:metal:7>);
furnace.remove(<thermalfoundation:material:161>);
# Invar
furnace.remove(<thermalfoundation:material:162>);
# Bronze
furnace.remove(<thermalfoundation:material:163>);
# Constantan
furnace.remove(<immersiveengineering:metal:6>);
furnace.remove(<thermalfoundation:material:164>);
# Signalum
furnace.remove(<thermalfoundation:material:165>);
# Limium
furnace.remove(<thermalfoundation:material:166>);
# Enderium
furnace.remove(<thermalfoundation:material:167>);


# ===================================
# Add copper and tin cluster smelting
# ===================================

# Copper
furnace.addRecipe(<thermalfoundation:material:128>, <geolosys:cluster:2>, 1.0);
# Tin
furnace.addRecipe(<thermalfoundation:material:129>, <geolosys:cluster:3>, 0.8);


# ===================================
# Disable metal tool / armor crafting
# ===================================

global           tools as string[] = [ "sword", "shovel", "pickaxe", "axe", "hoe" ];
global    vanillaArmor as string[] = [ "helmet", "chestplate", "leggings", "boots" ];
global foundationArmor as string[] = [ "helmet", "plate", "legs", "boots" ];

function removeVanillaToolsAndArmor(material as string) {
	for tool in tools {
		recipes.removeByRecipeName("minecraft:" + material + "_" + tool);
	}
	for armor in vanillaArmor {
		recipes.removeByRecipeName("minecraft:" + material + "_" + armor);
	}
}

function removeFoundationToolsAndArmor(material as string) {
	for tool in tools {
		recipes.removeByRecipeName("thermalfoundation:tool." + tool + "_" + material);
	}
	for armor in foundationArmor {
		recipes.removeByRecipeName("thermalfoundation:armor." + armor + "_" + material);
	}
}

removeVanillaToolsAndArmor("iron");
removeVanillaToolsAndArmor("golden");

removeFoundationToolsAndArmor("silver");
removeFoundationToolsAndArmor("lead");
removeFoundationToolsAndArmor("aluminum");
removeFoundationToolsAndArmor("nickel");
removeFoundationToolsAndArmor("platinum");
removeFoundationToolsAndArmor("steel");
removeFoundationToolsAndArmor("electrum");
removeFoundationToolsAndArmor("invar");
removeFoundationToolsAndArmor("bronze");
removeFoundationToolsAndArmor("constanstan");

# TODO: Do something about bow, fishing rod, shears, sickle, hammer and shield.
#       Perhaps add custom sticks / molds for them, also?

# TODO: Maybe make diamond tools only obtainable through exploration and trading?


# ===============================
# Disable basic crafting of gears
# ===============================

recipes.remove(<thermalfoundation:material:24>);  # Iron
recipes.remove(<thermalfoundation:material:25>);  # Gold
recipes.remove(<thermalfoundation:material:256>); # Copper
recipes.remove(<thermalfoundation:material:257>); # Tin
recipes.remove(<thermalfoundation:material:258>); # Silver
recipes.remove(<thermalfoundation:material:259>); # Lead
recipes.remove(<thermalfoundation:material:260>); # Aluminum
recipes.remove(<thermalfoundation:material:261>); # Nickel
recipes.remove(<thermalfoundation:material:262>); # Platinum
recipes.remove(<thermalfoundation:material:263>); # Iridium
recipes.remove(<thermalfoundation:material:264>); # Mana Infused
recipes.remove(<thermalfoundation:material:288>); # Steel
recipes.remove(<thermalfoundation:material:289>); # Electrum
recipes.remove(<thermalfoundation:material:290>); # Invar
recipes.remove(<thermalfoundation:material:291>); # Bronze
recipes.remove(<thermalfoundation:material:292>); # Constantan
recipes.remove(<thermalfoundation:material:293>); # Signalum
recipes.remove(<thermalfoundation:material:294>); # Lumium
recipes.remove(<thermalfoundation:material:295>); # Enderium

# Readd copper and tin gear recipes without iron

recipes.addShaped(<thermalfoundation:material:256>,
	[ [              null, <ore:ingotCopper>,              null ],
	  [ <ore:ingotCopper>,   <ore:stickWood>, <ore:ingotCopper> ],
	  [              null, <ore:ingotCopper>,              null ] ]);

recipes.addShaped(<thermalfoundation:material:256>,
	[ [           null,  <ore:ingotTin>,           null ],
	  [ <ore:ingotTin>, <ore:stickWood>, <ore:ingotTin> ],
	  [           null,  <ore:ingotTin>,           null ] ]);


# ================================
# Remove Alloy Furnace and recipes
# ================================

mods.jei.JEI.removeAndHide(<foundry:alloyfurnace>);

function removeAlloyRecipe(ingot1 as IItemStack, dust1 as IItemStack, ingot2 as IItemStack, dust2 as IItemStack) {
	mods.foundry.AlloyFurnace.removeRecipe(ingot1, ingot2);
	mods.foundry.AlloyFurnace.removeRecipe( dust1, ingot2);
	mods.foundry.AlloyFurnace.removeRecipe(ingot1,  dust2);
	mods.foundry.AlloyFurnace.removeRecipe( dust1,  dust2);
}

# Bronze
removeAlloyRecipe(<thermalfoundation:material:128> * 3, <thermalfoundation:material:64> * 3,
                  <thermalfoundation:material:129>, <thermalfoundation:material:65>);
# Invar
removeAlloyRecipe(<minecraft:iron_ingot> * 2, <thermalfoundation:material:0> * 2,
                  <thermalfoundation:material:133>, <thermalfoundation:material:69>);
# Electrum
removeAlloyRecipe(<minecraft:gold_ingot>, <thermalfoundation:material:1>,
                  <thermalfoundation:material:130>, <thermalfoundation:material:66>);

# Refractory Glass
mods.foundry.AlloyFurnace.removeRecipe(<minecraft:sand>, <minecraft:clay_ball>);
# Readd Refractory Glass recipe to the Alloy Kiln
mods.immersiveengineering.AlloySmelter.addRecipe(<foundry:refractoryglass>, <minecraft:sand>, <minecraft:clay_ball>, 300);
