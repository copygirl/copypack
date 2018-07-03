# ===============================
# Add Dynamic Trees seeds as fuel
# ===============================

for item in <ore:treeSapling>.items {
	furnace.setFuel(item, 100);
}

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
