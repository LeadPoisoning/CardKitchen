// Contains functions used for controlling Deck, Hand, and Discard

function ShuffleDiscard() { // obj_Player
	ds_list_copy(deck, discard);
	ds_list_clear(discard);
	ds_list_shuffle(deck);
	for (var j = 0; j < ds_list_size(deck); j++) {
		deck[| j].xTo = deckX;
		deck[| j].yTo = deckY;
		deck[| j].faceUp = false;
	}
}

function DrawCards(_numCards) { // obj_Player
	for (var i = 0; i < _numCards; i++) {
		var deckSize = ds_list_size(deck);
		var handSize = ds_list_size(hand);
		
		// shuffle discard into deck if no deck
		if (deckSize == 0) {
			ShuffleDiscard();
			deckSize = ds_list_size(deck);
			if (deckSize == 0) return; // discard was empty
		}
		
		ds_list_add(hand, deck[| deckSize - 1]);
		handSize++;
		hand[| handSize - 1].faceUp = true;
		ds_list_delete(deck, deckSize - 1);
		
	}
}

function DiscardCard(_card) { // obj_Player
	if (_card != noone && _card != undefined) {
		var pos = ds_list_find_index(hand, _card);
		_card.xTo = discardX;
		_card.yTo = discardY;
		if (pos != -1) {
			ds_list_add(discard,_card);
			ds_list_delete(hand, pos);
		}
	}
}

function CreateCard( _x, _y, _type, _id) { // obj_Player, obj_Game, obj_CardChoice
	var newCard = noone;
	switch (_type) {
		case cardTypes.food:
			newCard = instance_create_layer(_x, _y, "Field", obj_FoodCard);
			newCard.cardId = _id;
			newCard.sprite_index = global.foodCardInfo[# _id, 0];
			break;
			
		case cardTypes.process:
			newCard = instance_create_layer(_x, _y, "Field", obj_ProcCard);
			newCard.cardId = _id;
			newCard.sprite_index = global.procCardInfo[# _id, 0];
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