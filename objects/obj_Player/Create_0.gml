mouse = instance_create_layer(mouse_x, mouse_y, "FG", obj_Mouse);

deck = ds_list_create();
hand = ds_list_create();
discard = ds_list_create();

deckX = room_width * 0.13;
deckY = room_height - (0.16*room_height);
discardX = deckX;
discardY = deckY - global.cardH*3/2;
handStartX = room_width/3;
handStartY = room_height - (0.18*room_height);

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