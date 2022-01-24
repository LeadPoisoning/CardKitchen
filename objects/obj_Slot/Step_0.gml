var d = layer_get_depth(layer);

j = 0;
for(var i = 0; i < ds_list_size(cardStack); i++) {
	var card = ds_list_find_value(cardStack,i);
	
	if( card != heldCard) {
		// Position cards in a descending stack
		card.xTo = x;
		card.yTo = y + (j++)*20;
	
		// Cards vertically lower on the stack will be drawn after the previous card (solitaire style)
		card.depth = d - (j+1);
	}
}
