import crafttweaker.item.IItemStack;
import crafttweaker.liquid.ILiquidStack;

function removeAndHideComponent(component as IItemStack, mold as IItemStack, liquid as ILiquidStack) {
	mods.foundry.Casting.removeRecipe(liquid, mold);
	mods.jei.JEI.hide(component);
}

function removeAndHideMold(mold as IItemStack) {
	mods.foundry.Casting.removeMold(mold);
	mods.jei.JEI.hide(mold);
}

function removeAndHideComponentAndMold(component as IItemStack, mold as IItemStack, liquid as ILiquidStack) {
	removeAndHideComponent(component, mold, liquid);
	removeAndHideMold(mold);
}


# Material Router
mods.jei.JEI.removeAndHide(<foundry:machine:4>);

# Coal Coke (done by Immersive Engineering)
mods.jei.JEI.hide(<foundry:component:21>);

# TODO: Remove Heating Coil + Constantan Rod and adjust recipes?

# ===========================================
# Remove guns, ingredients, bullets and molds
# ===========================================

# Gun Barrel
removeAndHideComponentAndMold(<foundry:component:3>, <foundry:mold:19>, <liquid:liquidsteel> * 108);

# Revolver + Drum + Frame
mods.jei.JEI.removeAndHide(<foundry:revolver>);
removeAndHideComponentAndMold(<foundry:component:4>, <foundry:mold:20>, <liquid:liquidsteel> * 81);
removeAndHideComponentAndMold(<foundry:component:5>, <foundry:mold:21>, <liquid:liquidsteel> * 162);

# Shotgun + Pump + Frame
mods.jei.JEI.removeAndHide(<foundry:shotgun>);
removeAndHideComponentAndMold(<foundry:component:12>, <foundry:mold:24>, <liquid:liquidsteel> * 54);
removeAndHideComponentAndMold(<foundry:component:13>, <foundry:mold:25>, <liquid:liquidsteel> * 162);

# Round Casing
removeAndHideComponentAndMold(<foundry:component:6>, <foundry:mold:18>, <liquid:liquidbrass> * 12);
# Hollow Point Bullet
removeAndHideComponentAndMold(<foundry:component:8>, <foundry:mold:17>, <liquid:liquidlead> * 36);
# Shell Casing
removeAndHideComponentAndMold(<foundry:component:11>, <foundry:mold:23>, <liquid:liquidbrass> * 24);

# Jacketed Bullet (special because it uses bullet as extra)
mods.foundry.Casting.removeRecipe(<liquid:liquidcopper> * 12, <foundry:mold:16>, <foundry:component:7>);
mods.jei.JEI.hide(<foundry:component:9>);

# Bullet + Pellet molds
removeAndHideMold(<foundry:mold:16>);
removeAndHideMold(<foundry:mold:22>);
# (Lead) Bullet + Pellet
removeAndHideComponent(<foundry:component:7>, <foundry:mold:16>, <liquid:liquidlead> * 36);
removeAndHideComponent(<foundry:component:10>, <foundry:mold:22>, <liquid:liquidlead> * 12);
# Steel Bullet + Pellet
removeAndHideComponent(<foundry:component:14>, <foundry:mold:16>, <liquid:liquidsteel> * 36);
removeAndHideComponent(<foundry:component:15>, <foundry:mold:22>, <liquid:liquidsteel> * 12);
# Lumium Bullet + Pellet
removeAndHideComponent(<foundry:component:19>, <foundry:mold:16>, <liquid:liquidlumium> * 36);
removeAndHideComponent(<foundry:component:20>, <foundry:mold:22>, <liquid:liquidlumium> * 12);

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
