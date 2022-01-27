mouse = instance_create_layer(mouse_x, mouse_y, "FG", obj_Mouse);
deck = ds_list_create();
hand = ds_list_create();
discard = ds_list_create();

deckX = 100;
deckY = 600;
discardX = deckX;
discardY = deckY - global.cardH*3/2;
handStartX = 380;
handStartY = 640;

var i = 0;
repeat(8) {
	var card = CreateCard(deckX, deckY, cardTypes.food, i mod 2);
	card.xTo = deckX;
	card.yTo = deckY;
	deck[| i++] = card;
	
}
var card = CreateCard(deckX, deckY, cardTypes.process, 0);
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