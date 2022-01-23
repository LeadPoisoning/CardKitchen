function InitCardInfoGrid(){
	global.cardInfo = ds_grid_create(1, 1);
	
	var i = 0;
	global.cardInfo = ds_grid_add(0, i, spr_TestCardBack)
}