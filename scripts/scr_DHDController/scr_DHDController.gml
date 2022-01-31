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

function CreateCard( _x, _y, _type, _id) { //agnostic, obj_Player, obj_Game, obj_CardChoice
	var newCard = noone;
	switch (_type) {
		case cardTypes.food:
			newCard = instance_create_layer(_x, _y, "Field", obj_FoodCard);
			newCard.cardId = _id;
			newCard.sprite_index = global.foodCardInfo[# _id, 0];
			newCard.cardTitle = global.foodCardInfo[# _id, 1];
			newCard.cardDesc = global.foodCardInfo[# _id, 2];
			newCard.value = global.foodCardInfo[# _id, 3];
			break;
			
		case cardTypes.process:
			newCard = instance_create_layer(_x, _y, "Field", obj_ProcCard);
			newCard.cardId = _id;
			newCard.sprite_index = global.procCardInfo[# _id, 0];
			newCard.cardTitle = global.procCardInfo[# _id, 1];
			newCard.cardDesc = global.procCardInfo[# _id, 2];
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

function DestroyCard(_card) { //agnostic
	var _player = obj_Player;
	
	var pos = ds_list_find_index(_player.hand,_card);
	if (pos != -1) {
		ds_list_delete(_player.hand, pos);
	}
	
	for(var i = 0; i < instance_number(obj_Slot); i++) { //iterate through the slots to find the one containing the card
		var testStack = instance_find(obj_Slot,i).cardStack;
		var Spos = ds_list_find_index(testStack,_card);
		if (Spos != -1) {
			ds_list_delete(testStack, Spos);
		}
	}
	
	instance_destroy(_card);
}

function DiscardCard(_card) { //agnostic
	var _player = obj_Player;
	
	var pos = ds_list_find_index(_player.hand, _card);
	if (pos != -1) {
		ds_list_delete(_player.hand, pos);
	}
	
	for(var i = 0; i < instance_number(obj_Slot); i++) { //iterate through the slots to find the one containing the card
		var testStack = instance_find(obj_Slot,i).cardStack;
		var Spos = ds_list_find_index(testStack,_card);
		if (Spos != -1) {
			ds_list_delete(testStack, Spos);
		}
	}
	
	_card.faceUp = true;
	ds_list_add(_player.discard,_card);
}