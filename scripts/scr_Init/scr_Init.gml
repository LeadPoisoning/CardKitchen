#region Declare Enums
enum cardTypes {
	food,
	process,
	restaurant
}

enum foodCard {
	spinch,
	chopped_spinch,
	spinch_soup,
	tato,
	chopped_tato,
	boiled_tato,
	roasted_tato,
	baked_tato,
	tato_soup,
	tato_wedges,
	mato,
	chopped_mato,
	roasted_mato,
	mato_soup,
	spunion,
	caramelized_spunion,
	spunion_soup,
	cattle_steak,
	ground_cattle,
	cattle_patty,
	cooked_patty,
	cooked_steak,
	bun,
	foccelli_noodles,
	cooked_foccelli_noodles,
	snowbird_egg,
	snowbird,
	snowbird_tenders,
	snowtucky_fried_bird,
	roast_snowbird,
	snowbird_nuggets,
	snowbird_soup,
	rudefish,
	teaweed,
	chopped_teaweed,
	light_tea,
	dark_tea,
	teaweed_crisps,
	rice,
	steamed_rice,
	fried_rice,
	count
}

enum procCard {
	knife,
	skillet,
	pot,
	oven,
	count
}
#endregion

function InitFoodInfo() { // obj_Game
	var foodInfoGrid = ds_grid_create(40, 200);
	foodInfoGrid = load_csv("FoodInfoGrid.csv");
	
	var infoNum = 4; // number of pieces of information for an individual food card (pls rename)
	
	global.foodCardInfo = ds_grid_create(infoNum, foodCard.count);
	global.foodProcessing = ds_grid_create(procCard.count, foodCard.count);
	
	// grab subgrid for card info values and create map for food processing
	var foodEnumMap = ds_map_create();
	var infoOffX = 10;
	var infoOffY = 1;
	for (var y = 0; y < foodCard.count; y++) {
		ds_map_add(foodEnumMap, foodInfoGrid[# 0, infoOffY + y], y);
		
		// creates card info grid
		for (var x = 0; x < infoNum; x++) {
			if (foodInfoGrid[# x, 0] != "") {
				global.foodCardInfo[# x, y] = foodInfoGrid[# infoOffX + x, infoOffY + y];
			}
		}
	}
}

function InitFoodCardInfo() { // obj_Game
	global.foodCardInfo = ds_grid_create(20, 20);
	
	// x values: food cardID enum
	
	// y values:
	//		0 = sprite
	//		1 = Name
	//		2 = Card Text
	//		3 = Default Value
	
	ds_grid_set(global.foodCardInfo, foodCard.spinch, 0, spr_CardSpinch);
	ds_grid_set(global.foodCardInfo, foodCard.spinch, 1, "Spinch");
	ds_grid_set(global.foodCardInfo, foodCard.spinch, 2, "Green leafy vegatable");
	ds_grid_set(global.foodCardInfo, foodCard.spinch, 3, 3);
	
	ds_grid_set(global.foodCardInfo, foodCard.spinchChopped, 0, spr_CardSpinchChopped);
	ds_grid_set(global.foodCardInfo, foodCard.spinchChopped, 1, "Copped Spinch");
	ds_grid_set(global.foodCardInfo, foodCard.spinchChopped, 2, "Chopped, green leafy vegatable");
	ds_grid_set(global.foodCardInfo, foodCard.spinchChopped, 3, 3);
	
	
	
	ds_grid_set(global.foodCardInfo, foodCard.mato, 0, spr_CardMato);
	ds_grid_set(global.foodCardInfo, foodCard.mato, 1, "Mato");
	ds_grid_set(global.foodCardInfo, foodCard.mato, 2, "Red zesty vegatable");
	ds_grid_set(global.foodCardInfo, foodCard.mato, 3, 5);
	
	ds_grid_set(global.foodCardInfo, foodCard.matoChopped, 0, spr_CardMatoChopped);
	ds_grid_set(global.foodCardInfo, foodCard.matoChopped, 1, "Chopped Mato");
	ds_grid_set(global.foodCardInfo, foodCard.matoChopped, 2, "Chopped, red zesty vegatable");
	ds_grid_set(global.foodCardInfo, foodCard.matoChopped, 3, 5);
	
	ds_grid_set(global.foodCardInfo, foodCard.matoSoup, 0, spr_CardMatoSoup);
	ds_grid_set(global.foodCardInfo, foodCard.matoSoup, 1, "Mato Soup");
	ds_grid_set(global.foodCardInfo, foodCard.matoSoup, 2, "Rich and tangy soup made from matos");
	ds_grid_set(global.foodCardInfo, foodCard.matoSoup, 3, 10);
	
	
	
	ds_grid_set(global.foodCardInfo, foodCard.tato, 0, spr_CardTato);
	ds_grid_set(global.foodCardInfo, foodCard.tato, 1, "Tato");
	ds_grid_set(global.foodCardInfo, foodCard.tato, 2, "Brown bumpy vegatable");
	ds_grid_set(global.foodCardInfo, foodCard.tato, 3, 5);
	
	ds_grid_set(global.foodCardInfo, foodCard.tatoChopped, 0, spr_CardTatoChopped);
	ds_grid_set(global.foodCardInfo, foodCard.tatoChopped, 1, "Chopped Tato");
	ds_grid_set(global.foodCardInfo, foodCard.tatoChopped, 2, "Chopped, brown bumpy vegatable");
	ds_grid_set(global.foodCardInfo, foodCard.tatoChopped, 3, 5);
	
	ds_grid_set(global.foodCardInfo, foodCard.tatoMashed, 0, spr_CardTatoMashed);
	ds_grid_set(global.foodCardInfo, foodCard.tatoMashed, 1, "Mashed Tatos");
	ds_grid_set(global.foodCardInfo, foodCard.tatoMashed, 2, "Hearty mash of tatos and butter");
	ds_grid_set(global.foodCardInfo, foodCard.tatoMashed, 3, 10);
	
	
	
	ds_grid_set(global.foodCardInfo, foodCard.salad, 0, spr_CardSalad);
	ds_grid_set(global.foodCardInfo, foodCard.salad, 1, "Salad");
	ds_grid_set(global.foodCardInfo, foodCard.salad, 2, "A spinch and tomato salad");
	ds_grid_set(global.foodCardInfo, foodCard.salad, 3, 15);
	
	
	
	ds_grid_set(global.foodCardInfo, foodCard.snowbird, 0, spr_CardSnowbird);
	ds_grid_set(global.foodCardInfo, foodCard.snowbird, 1, "Snowbird");
	ds_grid_set(global.foodCardInfo, foodCard.snowbird, 2, "A whole raw snowbird");
	ds_grid_set(global.foodCardInfo, foodCard.snowbird, 3, 8);
	
	ds_grid_set(global.foodCardInfo, foodCard.snowbirdTenders, 0, spr_CardSnowbirdTenders);
	ds_grid_set(global.foodCardInfo, foodCard.snowbirdTenders, 1, "Snowbird Tenders");
	ds_grid_set(global.foodCardInfo, foodCard.snowbirdTenders, 2, "Sliced chunks of raw snowbird");
	ds_grid_set(global.foodCardInfo, foodCard.snowbirdTenders, 3, 8);
	
	ds_grid_set(global.foodCardInfo, foodCard.snowTucky, 0, spr_CardSnowTucky);
	ds_grid_set(global.foodCardInfo, foodCard.snowTucky, 1, "Snowtucky Fried Bird");
	ds_grid_set(global.foodCardInfo, foodCard.snowTucky, 2, "Fried bird with 11 herbs and spices");
	ds_grid_set(global.foodCardInfo, foodCard.snowTucky, 3, 20);
	
	ds_grid_set(global.foodCardInfo, foodCard.snowbirdNuggets, 0, spr_CardSnowbirdNuggets);
	ds_grid_set(global.foodCardInfo, foodCard.snowbirdNuggets, 1, "Snowbird Nuggets");
	ds_grid_set(global.foodCardInfo, foodCard.snowbirdNuggets, 2, "A spinch and tomato salad");
	ds_grid_set(global.foodCardInfo, foodCard.snowbirdNuggets, 3, 20);
	
}

function InitProcCardInfo() { // obj_Game
	global.procCardInfo = ds_grid_create(20, 20);
	
	// x values: proc cardID enum
	
	// y values:
	//		0 = sprite
	//		1 = Name
	//		2 = Card Text
	
	ds_grid_set(global.procCardInfo,procCard.knife, 0, spr_ProcKnife);
	ds_grid_set(global.procCardInfo,procCard.knife, 1, "Knife");
	ds_grid_set(global.procCardInfo,procCard.knife, 2, "Razor sharp for dicing and slicing");
	
	ds_grid_set(global.procCardInfo,procCard.skillet, 0, spr_ProcSkillet);
	ds_grid_set(global.procCardInfo,procCard.skillet, 1, "Skillet");
	ds_grid_set(global.procCardInfo,procCard.skillet, 2, "Sizzling hot pan for raosting, searing, or frying");
	
	ds_grid_set(global.procCardInfo,procCard.pot, 0, spr_ProcPot);
	ds_grid_set(global.procCardInfo,procCard.pot, 1, "Pot");
	ds_grid_set(global.procCardInfo,procCard.pot, 2, "Large pot for boiling, mixing, or steaming");
	
}

function InitProcessGrid() { // obj_Game
	global.processes = ds_grid_create(20, 20);
	ds_grid_clear(global.processes, noone);
	
	// x values: process
	// y values: food
	
				//list			  //x			  //y			 //result value
	ds_grid_set(global.processes, procCard.knife, foodCard.mato, foodCard.matoChopped);
	ds_grid_set(global.processes, procCard.knife, foodCard.spinch, foodCard.spinchChopped);
	ds_grid_set(global.processes, procCard.knife, foodCard.tato, foodCard.tatoChopped);
	ds_grid_set(global.processes, procCard.knife, foodCard.snowbird, foodCard.snowbirdTenders);
	
	//ds_grid_set(global.processes, procCard.skillet, foodCard.mato, foodCard.matoRoasted);
	//ds_grid_set(global.processes, procCard.skillet, foodCard.tato, foodCard.tatoFries);
	ds_grid_set(global.processes, procCard.skillet, foodCard.snowbird, foodCard.snowTucky);
	ds_grid_set(global.processes, procCard.skillet, foodCard.snowbirdTenders, foodCard.snowbirdNuggets);
	
	ds_grid_set(global.processes, procCard.pot, foodCard.matoChopped, foodCard.matoSoup);
	ds_grid_set(global.processes, procCard.pot, foodCard.tatoChopped, foodCard.tatoMashed);
	ds_grid_set(global.processes, procCard.pot, foodCard.snowbirdTenders, foodCard.snowbirdSoup);
	
}

function InitRecipeGrid() { //obj_Player
	global.recipes = ds_grid_create(50, 50);
	ds_grid_clear(global.recipes, noone);
	
	// x values: output
	// y values: each ingredient
	
				//list			  //x			  //y			 //result value
	ds_grid_set(global.recipes, foodCard.salad, 0, foodCard.matoChopped);
	ds_grid_set(global.recipes, foodCard.salad, 1, foodCard.spinch);
	
}

function CleanupGrids() { // obj_Game
	ds_grid_destroy(global.foodCardInfo);
	ds_grid_destroy(global.procCardInfo);
	ds_grid_destroy(global.processes);
	ds_grid_destroy(global.recipes);
}