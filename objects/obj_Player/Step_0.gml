var handSize = ds_list_size(hand);
var numCustomers = ds_list_size(customers);

#region ------------ Arrange Cards in Hand ------------

var dBetweenCards = 0;

// hands at 1 or zero, center on page
if (handSize > 1) {
	if (handSize <= 5) { // smaller than 6 hands are shrunk by units of 80
		handStartX = 770-(handSize*80);
	}
	dBetweenCards = (room_width-(2*handStartX))/(handSize - 1);
}

// position each card
for (i = 0; i < handSize; i++) {
	
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

#region ------------ Arrange Customers in Queue ------------

//TODO sort by remaining patience

// position each customer
for (i = 0; i < numCustomers; i++) {
	
	var customer = customers[| i];
	if(customer.patience > 0)
		customer.xTo = 950;
	else
		customer.xTo = room_width+50;
		
	customer.yTo = 60+ 95*i;
	
	customer.depth = 200 + i;
	
}

//delete blanks
for (i = numCustomers-1; i >= 0; i--) {
	
	var customer = customers[| i];
	if(customer.patience == 0)
		ds_list_delete(customers,i);
}
#endregion

#region ------------ Send Cards to Discard ------------
for (i = 0; i < ds_list_size(discard); i++) {
	discard[| i].xTo = discardX;
	discard[| i].yTo = discardY;
	discard[| i].depth = 299 - i;
}

#endregion

#region ------------ Send Shuffle Cards to Deck ------------
#endregion