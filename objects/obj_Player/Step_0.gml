var dBetweenCards = 0;
var handSize = ds_list_size(hand);


//Arrange cards in hand
if (handSize >= 4) {
	handStartX = 380;
	dBetweenCards = 606/(handSize - 1);
} else if (handSize >= 3) {
	handStartX = 530;
	dBetweenCards = 306/(handSize - 1);
}  else if (handSize >= 2) {
	handStartX = 610;
	dBetweenCards = 146/(handSize - 1);
} else {
	dBetweenCards = 0;
}

for (i = 0; i < ds_list_size(hand); i++) {
	hand[| i].depth = 300 + i;
	
	if (hand[| i] != mouse.heldCard) {
		if (handSize > 1) {
			hand[| i].xTo = handStartX + i * dBetweenCards;
		} else {
			hand[| i].xTo = room_width/2;
		}
		hand[| i].yTo = handStartY;
	}
}
