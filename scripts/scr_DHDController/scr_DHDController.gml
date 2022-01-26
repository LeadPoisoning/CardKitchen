// Contains functions used for controlling Deck, Hand, and Discard

function DrawCards(_numCards) { //obj_Player
	for (var i = 0; i < _numCards; i++) {
		var deckSize = ds_list_size(deck);
		var handSize = ds_list_size(hand);
		
		// shuffle discard into deck if no deck
		if (deckSize == 0) {
			ds_list_copy(deck, discard);
			ds_list_clear(discard);
			ds_list_shuffle(deck);
			deckSize = ds_list_size(deck);
			if (deckSize == 0) return; // discard was empty
		}
		
		ds_list_add(hand, deck[| deckSize - 1]);
		handSize++;
		hand[| handSize - 1].faceUp = true;
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

function CreateCard( _x, _y, _type, _id) {
	var newCard = noone;
	switch (_type) {
		case cardTypes.food:
			newCard = instance_create_layer(_x, _y, "Field", obj_FoodCard);
			break;
			
		case cardTypes.process:
			newCard = instance_create_layer(_x, _y, "Field", obj_ProcCard);
			break;
		/*	
		case cardTypes.restaurant:
			newCard = instance_create_layer(_x, _y, "Field", obj_RestCard);
		*/
		
		default:
			return noone;
	}
	
	return newCard;
}