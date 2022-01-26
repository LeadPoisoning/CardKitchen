mouse = instance_create_layer(mouse_x, mouse_y, "FG", obj_Mouse);
deck = ds_list_create();
hand = ds_list_create();
discard = ds_list_create();

InitFoodCardInfo();
InitProcCardInfo();
InitProcCheck();

cardW = 96;
cardH = 128;
deckX = 100;
deckY = 600;
discardX = 1000;
discardY = 600 - cardH*3/2;
handStartX = 380;
handStartY = 640;

var i = 0;
repeat(4) {
	var card = instance_create_layer(deckX, deckY, "Field", obj_FoodCard);
	card.cardId = i mod 2;
	card.xTo = deckX;
	card.yTo = deckY;
	deck[| i++] = card;
	
}
var card = instance_create_layer(deckX, deckY, "Field", obj_ProcCard);
card.cardId = 0;
card.xTo = deckX;
card.yTo = deckY;
deck[| i++] = card;

repeat(8) {
	var card = instance_create_layer(deckX, deckY, "Field", obj_FoodCard);
	card.cardId = i mod 2;
	card.xTo = deckX;
	card.yTo = deckY;
	deck[| i++] = card;
	
}
var card = instance_create_layer(deckX, deckY, "Field", obj_ProcCard);
card.cardId = 0;
card.xTo = deckX;
card.yTo = deckY;
deck[| i++] = card;

/*
repeat(4) {
	var card = instance_create_layer(deckX, deckY, "Field", obj_Card);
	card.cardId = 2;
	card.xTo = deckX;
	card.yTo = deckY;
	deck[| i++] = card;
	
}
*/

global.dayTurnCount = 0;