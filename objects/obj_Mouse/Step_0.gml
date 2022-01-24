var clicked = mouse_check_button_pressed(mb_left);
var right_clicked = mouse_check_button_pressed(mb_right);
var released = mouse_check_button_released(mb_left);

x = mouse_x;
y = mouse_y;

if (clicked) {
	heldCard = collision_point(x, y, obj_Card , false, true);
	if (heldCard != noone && !heldCard.faceUp) {
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
		
		with( heldCard) {
			var hand = player.hand;
			
			// Check if it is being dropped on a slot
			if( place_meeting(x,y,obj_Slot) ) {
				var slot = instance_nearest(x,y,obj_Slot);

				// put card in slotstack
				ds_list_add(slot.cardStack,id);
			} else {
				// check if not over slot
				for (i = 0; i < ds_list_size(hand); i++) {
					if (x < hand[| i].x) {
						ds_list_insert(hand, i, id);
						other.heldCard = noone;
						break;
					}
				}
				if (other.heldCard != noone) {
					ds_list_add(hand, id);
				}
			}
		}	
	}
	
	heldCard = noone;
}

if (heldCard != noone) {
	heldCard.xTo = x;
	heldCard.yTo = y;
}