var dBetweenCards = 0;
if (mouse.heldCard == noone) {
	dBetweenCards = 820/(ds_list_size(hand) - 1)
} else {
	dBetweenCards = 820/(ds_list_size(hand) - 2)
}
var j = 0;
for (i = 0; i < ds_list_size(hand); i++) {
	if (hand[| i] != mouse.heldCard) {
		hand[| i].xTo = handStartX + j++ * dBetweenCards;
		hand[| i].yTo = handStartY;
	}
}