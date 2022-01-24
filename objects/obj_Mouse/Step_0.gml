var clicked = mouse_check_button_pressed(mb_left);
var right_clicked = mouse_check_button_pressed(mb_right);
var released = mouse_check_button_released(mb_left);

x = mouse_x;
y = mouse_y;

if (clicked) {
	
	//try to click a card
	var clickedCardList = ds_list_create();
	collision_point_list(x, y, obj_Card, false, true, clickedCardList,false);
	//if click multiple, get the one with the least depth
	var numClicked = ds_list_size(clickedCardList);
	if(numClicked == 1)
		heldCard = clickedCardList[| 0];
	else if (numClicked > 1) {
		heldCard = clickedCardList[| 0];
		//get least depth card
		for(var i = 1; i < numClicked; i++) {
			var test = clickedCardList[| i];
			if(test.depth < heldCard.depth)
				heldCard = test;
		}
	}
	
	//clean up
	ds_list_destroy(clickedCardList);
	
	
	
	if (heldCard != noone && !heldCard.faceUp) { // if there was no card
		heldCard = noone;
	} else {
		// remove card from every slot
		for(var i = 0; i < instance_number(obj_Slot); i++) {
			var testStack = instance_find(obj_Slot,i).cardStack;
			var index = ds_list_find_index(testStack,heldCard);
			if(index != -1)
				ds_list_delete(testStack,index);
		}
		// remove card from hand
		var hand = player.hand;
		var handIndex = ds_list_find_index(hand,heldCard);
		if(handIndex != -1)
			ds_list_delete(hand,handIndex);
	}
}

if (right_clicked) { //flip face up
	var target = collision_point(x, y, obj_Card , false, true);
	if(target != noone)
		target.faceUp = !target.faceUp;
}

if (released) {
	if (heldCard != noone) { // Dropping a card 
		
		with( heldCard ) {
			var hand = player.hand;
			
			// Check if it is being dropped on a slot
			if( place_meeting(x,y,obj_Slot) ) {
				var slot = instance_nearest(x,y,obj_Slot);

				// put card in slotstack
				ds_list_add(slot.cardStack,id);
			} else {
				
				// if not over slot, place in hand
				for (i = 0; i < ds_list_size(hand); i++) { // place according to x pos on screen
					if (x < hand[| i].x) {
						ds_list_insert(hand, i, id);
						other.heldCard = noone;
						break;
					}
				}
				// if it made it past the for loop (meaning too far to the right)
				if (other.heldCard != noone) {
					ds_list_add(hand, id);
				}
				
				
			}
		}	
	}
	
	heldCard = noone;
}

// Update card that is being held
if (heldCard != noone) {
	heldCard.depth = 100;
	heldCard.xTo = x;
	heldCard.yTo = y;
}