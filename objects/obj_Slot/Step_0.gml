var d = layer_get_depth(layer);

for(var i = 0; i < ds_list_size(cardStack); i++) {
	var card = ds_list_find_value(cardStack,i);
	
	// Position cards in a descending stack
	card.xTo = x;
	card.yTo = y + i*10;
	
	// Cards vertically lower on the stack will be drawn after the previous card (solitaire style)
	card.depth = d - (i+1);
	
}