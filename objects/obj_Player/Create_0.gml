mouse = instance_create_layer(mouse_x, mouse_y, "Focus", obj_Mouse);
deck = ds_list_create();
hand = ds_list_create();
discard = ds_list_create();

InitCardInfoGrid();

cardW = 96;
cardH = 128;
deckX = 1000;
deckY = 600;
discardX = 1000;
discardY = 600 - cardH*3/2;
handStartX = 272;
handStartY = 640;

var i = 0;
repeat(4) {
	var card = instance_create_layer(deckX, deckY, "Field", obj_Card);
	card.cardId = 1;
	card.xTo = deckX;
	card.yTo = deckY;
	deck[| i++] = card;
	
}
repeat(4) {
	var card = instance_create_layer(deckX, deckY, "Field", obj_Card);
	card.cardId = 2;
	card.xTo = deckX;
	card.yTo = deckY;
	deck[| i++] = card;
	
}