var deckString = "";
var handString = "";
var discardString = "";

for (i = 0; i < ds_list_size(deck); i++) {
	deckString = deckString + string(deck[| i]) + ", ";
}
for (i = 0; i < ds_list_size(hand); i++) {
	handString = handString + string(hand[| i]) + ", ";
}
for (i = 0; i < ds_list_size(discard); i++) {
	discardString = discardString + string(discard[| i]) + ", ";
}

draw_set_color(c_white);
draw_text(room_width/2, room_height*3/4, handString);
draw_text(room_width/2, room_height/2, discardString);
draw_text(room_width/2, room_height/4, deckString);

draw_sprite(spr_TestCardBack, -1, deckX, deckY);