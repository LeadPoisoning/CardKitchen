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

for (var i = 0; i < ds_list_size(global.baseDeck); i++) {
	var card = global.baseDeck[| i];
	card.xTo = deckX;
	card.yTo = deckY;
	card.x = deckX;
	card.y = deckY;
	card.visible = true;
	ds_list_add(deck, card);
}

global.dayTurnCount = 0;