#region ------------ INPUTS ------------
var clicked = 0;
var right_clicked = 0;
var released = 0;

if(global.control) {
	clicked = mouse_check_button_pressed(mb_left);
	right_clicked = mouse_check_button_pressed(mb_right);
	released = mouse_check_button_released(mb_left);
}

x = mouse_x;
y = mouse_y;

#endregion

#region ------------ HOVER ------------

//resetCards
obj_Card.hover = false;
obj_Slot.hover = false;
obj_Button.hover = false;
hoverCard = noone;

//if not holding card
if(heldCard == noone) {
	
	//check if hovering button
	if(position_meeting(x,y,obj_Button)) {
		var button = instance_nearest(x,y,obj_Button);
		button.hover = true;
	}

	//check if hovering card
	
	//check inside hand only
	if(position_meeting(x,y,obj_Card)) {
		// get card hovering on
		var checkCard = instance_nearest(x,y,obj_Card);
		//if its not in the hand ignore it
		if(ds_list_find_index(player.hand,checkCard) != -1)
			hoverCard = checkCard;
		//}
	}
		
	//check each slot
		//for each card in that slot stack
			//if its the last card in the stack
				//check the full rectangle of the card
			//else
				//check a rectangle the size of the slot gap
					
	if (hoverCard != noone) {
		hoverCard.depth = 100;
		hoverCard.hover = true;
	}
		
	//check if hovering button
		//button.hover = true;

//if holding card
} else{

	//check if hovering a slot
	for(var i = 0; i < instance_number(obj_Slot); i++) {
		//check if held card is colliding with rectangle;
		//height of rect = list_size-2 * gap + cardheight
	}
			
			
		//if hover slot != noone;
			//slot.hover = true;
}

#endregion

#region ------------ LEFT CLICK ------------

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
	
	if(ds_list_find_index(player.discard,heldCard) != -1) {
		heldCard = noone;
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
#endregion

//Right click card to sell it
if (right_clicked) { //flip face up
	var target = collision_point(x, y, obj_Card , false, true);
	if(target != noone && target.faceUp && target.object_index == obj_FoodCard) {
		global.money += target.value;
		DestroyCard(target);
		with(player) {
			DrawCards(1);
		}
	}
//		target.faceUp = !target.faceUp;
}

#region ------------ RELEASE LEFT ------------

if (released) {
	// Dropping a card if one is held
	if (heldCard != noone) {
		
		with( heldCard ) {
			var hand = player.hand;
			
			// Check if it is being dropped on a slot
			if( place_meeting(x,y,obj_Slot) ) {
				var slot = instance_nearest(x,y,obj_Slot);
				//if the slot is full, cancel and put it pack in hand
				// TODO

				// put card in slotstack
				ds_list_add(slot.cardStack,id);
			} else {
				// Check if it is being dropped onto a card that is in a slot
				var cardOverlap = instance_place(x,y,obj_Card);//get the colliding card
				if ( cardOverlap != noone ) {
					var slotStack = noone;
					for(var i = 0; i < instance_number(obj_Slot); i++) { //iterate through the slots to find the one containing the cad
						var testStack = instance_find(obj_Slot,i).cardStack;
						var index = ds_list_find_index(testStack,cardOverlap);
						if(index != -1) {
							slotStack = testStack;
							break;
						}
					}
					//slot stack now holds either noone or a reference to the ds_list holding that card
					if(slotStack != noone) {
						
						//if the slot is full, cancel and put it pack in hand
						

						// put card in slotstack
						ds_list_add(slotStack,id);
					} else {
						// if the card it collided is not in a slot
						//place in hand
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
				} else {
					// if not over a slot OR a card
					//place in hand
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
	}
	
	heldCard = noone;
}

#endregion

// Update card that is being held
if (heldCard != noone) {
	heldCard.depth = 100;
	heldCard.xTo = x;
	heldCard.yTo = y;
}