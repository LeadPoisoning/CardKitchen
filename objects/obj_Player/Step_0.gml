
for (i = 0; i < ds_list_size(hand); i++) {
	if (hand[| i] != mouse.heldCard) {
		hand[| i].xTo = handStartX + i * cardW;
		hand[| i].yTo = handStartY;
	}
}
