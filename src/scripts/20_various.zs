# ===============================
# Add Dynamic Trees seeds as fuel
# ===============================

for item in <ore:treeSapling>.items {
	furnace.setFuel(item, 100);
}

# ====================
# Change Bucket recipe
# ====================

recipes.remove(<minecraft:bucket>);
recipes.addShaped(<minecraft:bucket>,
	[ [           null,           null,         hammer ],
	  [ <ore:plateTin>,           null, <ore:plateTin> ],
	  [           null, <ore:plateTin>,           null ] ]);

# ===========================================
# Change Hopper and Refractory Hopper recipes
# ===========================================

recipes.remove(<minecraft:hopper>);
recipes.addShaped(<minecraft:hopper>,
	[ [ <ore:plateIron>,  <ore:chestWood>, <ore:plateIron> ],
	  [ <ore:plateIron>, <ore:gearCopper>, <ore:plateIron> ],
	  [            null,  <ore:plateIron>,            null ] ]);

recipes.remove(<foundry:refractoryhopper>);
recipes.addShaped(<foundry:refractoryhopper>,
	[ [       <ore:plateIron>, <minecraft:bucket>,       <ore:plateIron> ],
	  [ <foundry:component:2>,      <ore:gearTin>, <foundry:component:2> ],
	  [                  null,    <ore:plateIron>,                  null ] ]);
