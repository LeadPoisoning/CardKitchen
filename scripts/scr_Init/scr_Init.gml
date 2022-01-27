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

function InitFoodCardInfo() { //obj_Player
	global.foodCardInfo = ds_grid_create(20, 20);
	
	// y values:
	//		0 = sprite
	//		1 = Name
	//		2 = Card Text
	
	var i = 0;
	
	ds_grid_add(global.foodCardInfo, i, 0, spr_CardSpinch);
	ds_grid_add(global.foodCardInfo, i, 1, "Spinch");
	ds_grid_add(global.foodCardInfo, i, 2, "Green, leafy vegatable");
	i++;
	
	ds_grid_add(global.foodCardInfo, i, 0, spr_CardMato);
	ds_grid_add(global.foodCardInfo, i, 1, "Mato");
	ds_grid_add(global.foodCardInfo, i, 2, "Red vegatable");
	i++;
	
	ds_grid_add(global.foodCardInfo, i, 0, spr_CardMatoChopped);
	ds_grid_add(global.foodCardInfo, i, 1, "Copped Mato");
	ds_grid_add(global.foodCardInfo, i, 2, "Chopped, red, vegatable");
	i++;
	
	ds_grid_add(global.foodCardInfo, i, 0, spr_CardSalad);
	ds_grid_add(global.foodCardInfo, i, 1, "Salad");
	ds_grid_add(global.foodCardInfo, i, 2, "A spinch and tomato salad");
	i++;
	
}

function InitProcCardInfo() { //obj_Player
	global.procCardInfo = ds_grid_create(20, 20);
	
	// y values:
	//		0 = sprite
	//		1 = Name
	//		2 = Card Text
	
	var i = 0;
	
	ds_grid_add(global.procCardInfo, i, 0, spr_ProcKnife);
	ds_grid_add(global.procCardInfo, i, 1, "Knife");
	ds_grid_add(global.procCardInfo, i, 2, "A knife");
	i++;
	
}

function InitProcCheck() { //obj_Player
	global.procCheck = ds_grid_create(20, 20);
	
	// x values: process
	// y values: food
				//list			  //x			  //y			 //result value
	ds_grid_add(global.procCheck, procCard.knife, foodCard.mato, foodCard.matoChopped);
	ds_grid_add(global.procCheck, procCard.knife, foodCard.spinch, foodCard.spinchChopped  );
	
}