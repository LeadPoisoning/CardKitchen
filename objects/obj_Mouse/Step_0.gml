var clicked = mouse_check_button_pressed(mb_left);
var right_clicked = mouse_check_button_pressed(mb_right);
var released = mouse_check_button_released(mb_left);

x = mouse_x;
y = mouse_y;

if (clicked) {
	heldCard = collision_point(x, y, obj_Card , false, true);
}

if (right_clicked) { //flip face up
	var target = collision_point(x, y, obj_Card , false, true);
	if(target != noone)
		target.faceUp = !target.faceUp;
}

if (released) {
	if (heldCard != noone) { // Dropping a card 
		
		with( heldCard) {
			
			// Check if it is being dropped on a slot
			if( place_meeting(x,y,obj_Slot) ) {
				var slot = instance_nearest(x,y,obj_Slot);
			
				// remove card from every slot
				for(var i = 0; i < instance_number(obj_Slot); i++) {
					var testStack = instance_find(obj_Slot,i).cardStack;
					var index = ds_list_find_index(testStack,id);
					if(index != -1)
						ds_list_delete(testStack,index);
				}
				
				// remove card from hand
				var hand = player.hand;
				var handIndex = ds_list_find_index(hand,id);
				if(handIndex != -1)
					ds_list_delete(testStack,index);

				// put card in slotstack
				ds_list_add(slot.cardStack,id);
			}

			// Check if it is being dropped anywhere
		}
		
	}
	
	heldCard = noone;
}

if (heldCard != noone) {
	heldCard.xTo = x;
	heldCard.yTo = y;
}