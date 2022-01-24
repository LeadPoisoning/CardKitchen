// Contains functions used for controlling Deck, Hand, and Discard

function DrawCards(_numCards) { //obj_Player
	for (var i = 0; i < _numCards; i++) {
		var deckSize = ds_list_size(deck);
		
		// shuffle discard into deck if no deck
		if (deckSize == 0) {
			ds_list_copy(deck, discard);
			ds_list_clear(discard);
			ds_list_shuffle(deck);
			deckSize = ds_list_size(deck);
			if (deckSize == 0) return; // discard was empty
		}
		
		ds_list_add(hand, deck[| deckSize - 1]);
		ds_list_delete(deck, deckSize - 1);
		
	}
}

function DiscardCard(_pos) { //obj_Player
	if (hand[| _pos] != undefined) {
		var discardSize = ds_list_size(discard);
		discard[| discardSize] = hand[| _pos];
		ds_list_delete(hand, _pos);
	}
}