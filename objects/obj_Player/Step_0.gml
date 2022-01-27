var dBetweenCards = 0;
var handSize = ds_list_size(hand);

#region ------------ Arrange Cards in Hand ------------

// hands at 1 or zero, center on page
if (handSize <= 1) {
	dBetweenCards = 0;
} else {

	if (handSize <= 5) { // smaller than 6 hands are shrunk by units of 80
		handStartX = 770-(handSize*80);
	}
	dBetweenCards = (room_width-(2*handStartX))/(handSize - 1);

}

// position each card
for (i = 0; i < ds_list_size(hand); i++) {
	
	//only target cards in hand
	if (hand[| i] != mouse.heldCard) {
		if (handSize > 1) {
			hand[| i].xTo = handStartX + i * dBetweenCards;
		} else {
			hand[| i].xTo = room_width/2;
		}
		hand[| i].yTo = handStartY;
	}
	
	//dont set depth of hovered card
	if(hand[| i] != mouse.hoverCard)
		hand[| i].depth = 300 + i;
	else
		hand[| i].yTo = handStartY-15;
		
}
#endregion

#region ------------ Send Cards to Discard ------------
for (i = 0; i < ds_list_size(discard); i++) {
	hand[| i].xTo = discardX;
	hand[| i].yTo = discardY;
	hand[| i].depth = 299 - i;
}

#endregion

#region ------------ Send Draw Cards to Deck ------------
#endregion