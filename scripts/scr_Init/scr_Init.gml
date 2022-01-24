function InitFoodCardInfo() { //obj_Player
	global.foodCardInfo = ds_grid_create(1, 1);
	
	// y values:
	//		0 = sprite
	//		1 = Name
	//		2 = Card Text
	
	var i = 0;
	
	ds_grid_add(global.foodCardInfo, i, 0, spr_TestCardBack);
	ds_grid_add(global.foodCardInfo, i, 1, "");
	ds_grid_add(global.foodCardInfo, i, 2, "");
	i++;
	
	ds_grid_add(global.foodCardInfo, i, 0, spr_TestCardSpinch);
	ds_grid_add(global.foodCardInfo, i, 1, "Spinch");
	ds_grid_add(global.foodCardInfo, i, 2, "Green, leafy vegatable");
	i++;
	
	ds_grid_add(global.foodCardInfo, i, 0, spr_TestCardMato);
	ds_grid_add(global.foodCardInfo, i, 1, "Mato");
	ds_grid_add(global.foodCardInfo, i, 2, "Red vegatable");
	i++;
	
	ds_grid_add(global.foodCardInfo, i, 0, spr_TestCardMatoChopped);
	ds_grid_add(global.foodCardInfo, i, 1, "Copped Mato");
	ds_grid_add(global.foodCardInfo, i, 2, "Chopped, red, vegatable");
	i++;
	
	ds_grid_add(global.foodCardInfo, i, 0, spr_TestCardSalad);
	ds_grid_add(global.foodCardInfo, i, 1, "Salad");
	ds_grid_add(global.foodCardInfo, i, 2, "A spinch and tomato salad");
	i++;
	
	ds_grid_add(global.foodCardInfo, i, 0, spr_TestCardSalad);
	ds_grid_add(global.foodCardInfo, i, 1, "Copped Mato");
	ds_grid_add(global.foodCardInfo, i, 2, "Chopped, red, vegatable");
	i++;
	
}

function initProcCardInfo() {
	global.procCardInfo = ds_grid_create(1, 1);
	
	// y values:
	//		0 = sprite
	//		1 = Name
	//		2 = Card Text
	
	var i = 0;
	
	ds_grid_add(global.foodCardInfo, i, 0, spr_TestCardBack);
	ds_grid_add(global.foodCardInfo, i, 1, "");
	ds_grid_add(global.foodCardInfo, i, 2, "");
	i++;
	
	ds_grid_add(global.foodCardInfo, i, 0, spr_TestCardKnife);
	ds_grid_add(global.foodCardInfo, i, 1, "");
	ds_grid_add(global.foodCardInfo, i, 2, "");
	i++;
	
}