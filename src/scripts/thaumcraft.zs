# 3x Ingot => 3x Plate recipe
recipes.removeByRecipeName("thaumcraft:brassplate");
recipes.removeByRecipeName("thaumcraft:ironplate");
recipes.removeByRecipeName("thaumcraft:thaumiumplate");
recipes.removeByRecipeName("thaumcraft:voidplate");

# Iron Plate
mods.jei.JEI.hide(<thaumcraft:plate:1>);

# Rename Alchemical Brass
<thaumcraft:ingot:2>.displayName = "Brass Ingot";
<thaumcraft:nugget:8>.displayName = "Brass Nugget";
