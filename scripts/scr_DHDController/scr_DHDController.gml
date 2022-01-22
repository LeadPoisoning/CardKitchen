// Contains functions used for controlling Deck, Hand, and Discard

function DrawCards(_numCards){
	for (var i = 0; i < _numCards; i++) {
		
		// shuffle if no deck
		
		var deckSize = ds_list_size(deck);
		ds_list_add(hand, deck[| deckSize - 1]);
		ds_list_delete(deck, deckSize);
		
		// create card object in hand
	}
}