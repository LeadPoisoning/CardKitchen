var dBetweenCards = 0;
var handSize = ds_list_size(hand);

if (handSize != 1) {
	dBetweenCards = 820/(handSize - 1);
} else {
	dBetweenCards = 0;
}

//Arrange cards in hand
for (i = 0; i < ds_list_size(hand); i++) {
	hand[| i].depth = 300;
	
	if (hand[| i] != mouse.heldCard) {
		if (handSize != 1) {
			hand[| i].xTo = handStartX + i * dBetweenCards;
		} else {
			hand[| i].xTo = room_width/2;
		}
		hand[| i].yTo = handStartY;
	}
}
