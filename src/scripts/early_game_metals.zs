import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;

function removeRecipesOfItemsWithMeta(base as IItemStack, metas as int[]) {
	for meta in metas {
		recipes.remove(base.definition.makeStack(meta));
	}
}

# =================================================
# Adjust some recipes because iron is more mid-game
# =================================================

# Engineer's Hammer
recipes.addShaped(<immersiveengineering:tool:0>.withDamage(60),
	[ [            null, <ore:ingotCopper>, <minecraft:string> ],
	  [            null,   <ore:stickWood>,  <ore:ingotCopper> ],
	  [ <ore:stickWood>,              null,               null ] ]);

# Metal Caster
recipes.remove(<foundry:machine:1>);
recipes.addShaped(<foundry:machine:1>,
	[ [               null,            <ore:chestWood>,               null ],
	  [ <ore:dustRedstone>, <foundry:componentblock:0>, <ore:dustRedstone> ],
	  [      <ore:gearTin>,       <ore:craftingPiston>,      <ore:gearTin> ] ]);


# =======================================
# Remove / replace plate and gear recipes
# =======================================

global hammer as IIngredient = <immersiveengineering:tool:0>;

function addPlateRecipe(result as IItemStack, item as IIngredient) {
	recipes.addShapeless(result, [ item, item, hammer ]);
}

function addGearRecipe(result as IItemStack, item as IIngredient) {
	recipes.addShaped(result, [ [ null, item, hammer ],
	                            [ item, item,   item ],
	                            [ null, item,   null ] ]);
}


# Remove plate recipes using Engineer's Hammer
removeRecipesOfItemsWithMeta(<immersiveengineering:metal>,
	# Copper, Aluminum, Lead, Silver, Nickel, Uranium, Constantan, Electrum, Steel, Iron, Gold
	[     30,       31,   32,     33,     34,      35,         36,       37,    38,   39,   40 ]);

# Readd copper and tin plate recipes
addPlateRecipe(<thermalfoundation:material:320>, <ore:ingotCopper>);
addPlateRecipe(<thermalfoundation:material:321>, <ore:ingotTin>);


# Remove gear recipes
removeRecipesOfItemsWithMeta(<thermalfoundation:material>,
	#   Iron,       Gold,   Copper,    Tin,   Silver,     Lead, Aluminum,
	[     24,         25,      256,    257,      258,      259,      260,
	# Nickel,   Platinum,  Iridium,   Mana,    Steel, Electrum,    Invar,
	     261,        262,      263,    264,      288,      289,      290,
	# Bronze, Constantan, Signalum, Limium, Enderium
	     291,        292,      293,    294,      295 ]);

# Readd copper and tin gear recipes
addGearRecipe(<thermalfoundation:material:256>, <ore:ingotCopper>);
addGearRecipe(<thermalfoundation:material:257>, <ore:ingotTin>);


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
