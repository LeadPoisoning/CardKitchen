function InitCardInfoGrid() { //obj_Player
	global.cardInfo = ds_grid_create(1, 1);
	
	// y values:
	//		0 = sprite
	//		1 = Name
	//		2 = Card Text
	
	var i = 0;
	
	ds_grid_add(global.cardInfo, i, 0, spr_TestCardBack);
	ds_grid_add(global.cardInfo, i, 1, "");
	ds_grid_add(global.cardInfo, i, 2, "");
	i++;
	
	ds_grid_add(global.cardInfo, i, 0, spr_TestCard1);
	ds_grid_add(global.cardInfo, i, 1, "Test1");
	ds_grid_add(global.cardInfo, i, 2, "A test");
	i++;
	
	ds_grid_add(global.cardInfo, i, 0, spr_TestCard2);
	ds_grid_add(global.cardInfo, i, 1, "Test2");
	ds_grid_add(global.cardInfo, i, 2, "Only a test");
	i++;
}