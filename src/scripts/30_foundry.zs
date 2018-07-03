import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;


# Material Router
mods.jei.JEI.removeAndHide(<foundry:machine:4>);

# Coal Coke (done by Immersive Engineering)
mods.jei.JEI.hide(<foundry:component:21>);

# Refractory Fluid Container
mods.jei.JEI.removeAndHide(<foundry:fluidcontainer>);

# Refractory Tanks
mods.jei.JEI.removeAndHide(<foundry:refractorytank>);
mods.jei.JEI.removeAndHide(<foundry:refractorytankstandard>);
mods.jei.JEI.removeAndHide(<foundry:infernotank>);

# TODO: Remove Heating Coil + Constantan Rod and adjust recipes?


# ===============================================
# Add other coals as valid fuels in Burner Heater
# ===============================================

mods.foundry.BurnerHeater.addFuel(<geolosys:coal:1>, 1600, 248);
mods.foundry.BurnerHeater.addFuel(<geolosys:coal:2>, 2400, 258);
mods.foundry.BurnerHeater.addFuel(<geolosys:coal:3>, 3200, 268);
mods.foundry.BurnerHeater.addFuel(<ore:blockFuelCoke>, 16000, 258);


# ===========================================
# Remove guns, ingredients, bullets and molds
# ===========================================

function removeAndHideComponent(component as IItemStack, liquid as ILiquidStack, mold as IItemStack) {
	mods.foundry.Casting.removeRecipe(liquid, mold);
	mods.jei.JEI.hide(component);
}

function removeAndHideMold(mold as IItemStack, grid as int[]) {
	mods.foundry.MoldStation.removeRecipe(grid);
	mods.foundry.Casting.removeMold(mold);
	mods.jei.JEI.hide(mold);
}

function removeAndHideComponentAndMold(component as IItemStack, liquid as ILiquidStack, mold as IItemStack, grid as int[]) {
	removeAndHideComponent(component, liquid, mold);
	removeAndHideMold(mold, grid);
}

# Gun Barrel
removeAndHideComponentAndMold(<foundry:component:3>, <liquid:liquidsteel> * 108,
                              <foundry:mold:19>, [ 0, 0, 0, 0, 0, 0,
                                                   0, 0, 4, 0, 0, 0,
                                                   0, 4, 0, 4, 0, 0,
                                                   0, 0, 4, 0, 0, 0,
                                                   0, 0, 0, 0, 0, 0,
                                                   0, 0, 0, 0, 0, 0 ]);

# Revolver + Drum + Frame
mods.jei.JEI.removeAndHide(<foundry:revolver>);
removeAndHideComponentAndMold(<foundry:component:4>, <liquid:liquidsteel> * 81,
                              <foundry:mold:20>, [ 0, 3, 3, 3, 0, 0,
                                                   3, 0, 3, 0, 3, 0,
                                                   3, 3, 3, 3, 3, 0,
                                                   3, 0, 3, 0, 3, 0,
                                                   0, 3, 3, 3, 0, 0,
                                                   0, 0, 0, 0, 0, 0 ]);
removeAndHideComponentAndMold(<foundry:component:5>, <liquid:liquidsteel> * 162,
                              <foundry:mold:21>, [ 0, 2, 2, 0, 0, 0,
                                                   0, 2, 2, 2, 0, 0,
                                                   2, 2, 2, 2, 0, 0,
                                                   0, 2, 2, 2, 2, 0,
                                                   0, 0, 2, 2, 2, 0,
                                                   0, 0, 2, 2, 2, 0 ]);

# Shotgun + Pump + Frame
mods.jei.JEI.removeAndHide(<foundry:shotgun>);
removeAndHideComponentAndMold(<foundry:component:12>, <liquid:liquidsteel> * 54,
                              <foundry:mold:24>, [ 0, 0, 0, 0, 0, 0,
                                                   0, 4, 0, 4, 0, 0,
                                                   0, 4, 0, 4, 0, 0,
                                                   0, 4, 4, 4, 0, 0,
                                                   0, 0, 0, 0, 0, 0,
                                                   0, 0, 0, 0, 0, 0 ]);
removeAndHideComponentAndMold(<foundry:component:13>, <liquid:liquidsteel> * 162,
                              <foundry:mold:25>, [ 0, 2, 2, 0, 0, 0,
                                                   0, 2, 2, 2, 2, 0,
                                                   0, 2, 2, 2, 2, 2,
                                                   2, 2, 2, 2, 2, 2,
                                                   0, 0, 0, 2, 2, 2,
                                                   0, 0, 0, 0, 0, 0 ]);

# Round Casing
removeAndHideComponentAndMold(<foundry:component:6>, <liquid:liquidbrass> * 12,
                              <foundry:mold:18>, [ 0, 0, 0, 0, 0, 0,
                                                   0, 0, 2, 2, 0, 0,
                                                   0, 2, 1, 1, 2, 0,
                                                   0, 2, 1, 1, 2, 0,
                                                   0, 0, 2, 2, 0, 0,
                                                   0, 0, 0, 0, 0, 0 ]);
# Hollow Point Bullet
removeAndHideComponentAndMold(<foundry:component:8>, <liquid:liquidlead> * 36,
                              <foundry:mold:17>, [ 0, 0, 0, 0, 0, 0,
                                                   0, 0, 2, 0, 0, 0,
                                                   0, 2, 1, 2, 0, 0,
                                                   0, 0, 2, 0, 0, 0,
                                                   0, 0, 0, 0, 0, 0,
                                                   0, 0, 0, 0, 0, 0 ]);
# Shell Casing
removeAndHideComponentAndMold(<foundry:component:11>, <liquid:liquidbrass> * 24,
                              <foundry:mold:23>, [ 0, 0, 3, 0, 0, 0,
                                                   0, 3, 1, 3, 0, 0,
                                                   3, 1, 1, 1, 3, 0,
                                                   0, 3, 1, 3, 0, 0,
                                                   0, 0, 3, 0, 0, 0,
                                                   0, 0, 0, 0, 0, 0 ]);

# Jacketed Bullet (special because it uses bullet as extra)
mods.foundry.Casting.removeRecipe(<liquid:liquidcopper> * 12, <foundry:mold:16>, <foundry:component:7>);
mods.jei.JEI.hide(<foundry:component:9>);

# Bullet + Pellet molds
removeAndHideMold(<foundry:mold:16>, [ 0, 0, 0, 0, 0, 0,
                                       0, 0, 1, 0, 0, 0,
                                       0, 1, 2, 1, 0, 0,
                                       0, 0, 1, 0, 0, 0,
                                       0, 0, 0, 0, 0, 0,
                                       0, 0, 0, 0, 0, 0 ]);
removeAndHideMold(<foundry:mold:22>, [ 0, 0, 0, 0, 0, 0,
                                       0, 0, 0, 0, 0, 0,
                                       0, 0, 1, 0, 0, 0,
                                       0, 0, 0, 0, 0, 0,
                                       0, 0, 0, 0, 0, 0,
                                       0, 0, 0, 0, 0, 0 ]);
# (Lead) Bullet + Pellet
removeAndHideComponent(<foundry:component:7>, <liquid:liquidlead> * 36, <foundry:mold:16>);
removeAndHideComponent(<foundry:component:10>, <liquid:liquidlead> * 12, <foundry:mold:22>);
# Steel Bullet + Pellet
removeAndHideComponent(<foundry:component:14>, <liquid:liquidsteel> * 36, <foundry:mold:16>);
removeAndHideComponent(<foundry:component:15>, <liquid:liquidsteel> * 12, <foundry:mold:22>);
# Lumium Bullet + Pellet
removeAndHideComponent(<foundry:component:19>, <liquid:liquidlumium> * 36, <foundry:mold:16>);
removeAndHideComponent(<foundry:component:20>, <liquid:liquidlumium> * 12, <foundry:mold:22>);

# Bullets
mods.jei.JEI.removeAndHide(<foundry:roundnormal>);
mods.jei.JEI.removeAndHide(<foundry:roundjacketed>);
mods.jei.JEI.removeAndHide(<foundry:roundhollow>);
mods.jei.JEI.removeAndHide(<foundry:roundfire>);
mods.jei.JEI.removeAndHide(<foundry:roundpoison>);
mods.jei.JEI.removeAndHide(<foundry:roundap>);
mods.jei.JEI.removeAndHide(<foundry:roundlumium>);
mods.jei.JEI.removeAndHide(<foundry:roundsnow>);
# Shells
mods.jei.JEI.removeAndHide(<foundry:shellnormal>);
mods.jei.JEI.removeAndHide(<foundry:shellap>);
mods.jei.JEI.removeAndHide(<foundry:shelllumium>);

# Small Pile of Blaze Powder and Gunpowder
mods.jei.JEI.removeAndHide(<foundry:component:22>);
mods.jei.JEI.removeAndHide(<foundry:component:23>);
