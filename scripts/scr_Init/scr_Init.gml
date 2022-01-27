enum cardTypes {
	food,
	process,
	restaurant
}

enum foodCard {
	spinch,
	spinchChopped,
	mato,
	matoChopped,
	salad
}

enum procCard {
	knife
}

function InitFoodCardInfo() { // obj_Game
	global.foodCardInfo = ds_grid_create(20, 20);
	
	// x values: food cardID enum
	
	// y values:
	//		0 = sprite
	//		1 = Name
	//		2 = Card Text
	
	var i = 0;
	
	ds_grid_add(global.foodCardInfo, foodCard.spinch, 0, spr_CardSpinch);
	ds_grid_add(global.foodCardInfo, foodCard.spinch, 1, "Spinch");
	ds_grid_add(global.foodCardInfo, foodCard.spinch, 2, "Green, leafy vegatable");
	i++;
	
	ds_grid_add(global.foodCardInfo, foodCard.mato, 0, spr_CardMato);
	ds_grid_add(global.foodCardInfo, foodCard.mato, 1, "Mato");
	ds_grid_add(global.foodCardInfo, foodCard.mato, 2, "Red vegatable");
	i++;
	
	ds_grid_add(global.foodCardInfo, foodCard.matoChopped, 0, spr_CardMatoChopped);
	ds_grid_add(global.foodCardInfo, foodCard.matoChopped, 1, "Copped Mato");
	ds_grid_add(global.foodCardInfo, foodCard.matoChopped, 2, "Chopped, red, vegatable");
	i++;
	
	ds_grid_add(global.foodCardInfo, foodCard.matoChopped, 0, spr_CardMatoChopped);
	ds_grid_add(global.foodCardInfo, foodCard.matoChopped, 1, "Copped Mato");
	ds_grid_add(global.foodCardInfo, foodCard.matoChopped, 2, "Chopped, red, vegatable");
	i++;
	
	ds_grid_add(global.foodCardInfo, foodCard.salad, 0, spr_CardSalad);
	ds_grid_add(global.foodCardInfo, foodCard.salad, 1, "Salad");
	ds_grid_add(global.foodCardInfo, foodCard.salad, 2, "A spinch and tomato salad");
	i++;
	
}

function InitProcCardInfo() { // obj_Game
	global.procCardInfo = ds_grid_create(20, 20);
	
	// x values: proc cardID enum
	
	// y values:
	//		0 = sprite
	//		1 = Name
	//		2 = Card Text
	
	var i = 0;
	
	ds_grid_add(global.procCardInfo,procCard.knife, 0, spr_ProcKnife);
	ds_grid_add(global.procCardInfo,procCard.knife, 1, "Knife");
	ds_grid_add(global.procCardInfo,procCard.knife, 2, "A knife");
	i++;
	
}

function InitProcCheck() { // obj_Game
	global.procCheck = ds_grid_create(20, 20);
	
	// x values: process
	// y values: food
	
				//list			  //x			  //y			 //result value
	ds_grid_add(global.procCheck, procCard.knife, foodCard.mato, foodCard.matoChopped);
	ds_grid_add(global.procCheck, procCard.knife, foodCard.spinch, foodCard.spinchChopped);
	
}

function InitRecipeCheck() { //obj_Player
	global.recipeCheck = ds_grid_create(20, 20);
	
	// x values: output
	// y values: each ingredient
	
				//list			  //x			  //y			 //result value
	ds_grid_add(global.procCheck, foodCard.salad, 0, foodCard.matoChopped);
	ds_grid_add(global.procCheck, foodCard.salad, 1, foodCard.spinch);
	
}

function CleanupGrids() { // obj_Game
	ds_grid_destroy(global.foodCardInfo);
	ds_grid_destroy(global.procCardInfo);
	ds_grid_destroy(global.procCheck);
}