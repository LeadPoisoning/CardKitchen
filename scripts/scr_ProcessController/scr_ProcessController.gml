function acceptCard(inCard) { // obj_Slot

	return true;

}

function runProcessTurn() { // obj_processButton
	
	// Make sure ALL slots can process
	for(var i = 0; i < instance_number(obj_Slot); i++) {
		var testSlot = instance_find(obj_Slot,i);
		if( !canProcessSlot(testSlot) ) {
			
			//if a single one cannot, then return -1
			show_debug_message("invalid process");
			return -1;
		}
		
	}
	
	// Process each slot
	for(var i = 0; i < instance_number(obj_Slot); i++) { //iterate through the slots to find the one containing the cad
		var slot = instance_find(obj_Slot,i);
		processSlot(slot);
		
	}
	
	// Increment turn
	global.dayTurnCount++;
	show_debug_message("Processing... Turn is now: " + string(global.dayTurnCount));
	
	// TODO: turn increment stuff

}

function canProcessSlot(slot) {  // obj_processButton
	var stack = slot.cardStack;
	//TODO
	
	//if there are two process cards
	var procCount = 0;
	for(var i = 0; i < ds_list_size(stack); i++) {
		if( stack[| i].object_index == obj_ProcCard )//find the proc card
			procCount++;
	
	}
	if(procCount > 1)
		return false;
		
	//if there are none they must all fit a recipe
	
	return true;
	
}

function processSlot(slot) {  // obj_processButton
	
	var unprocList = ds_list_create();
	var usedList = ds_list_create();
	
	var procCard = noone;
	var stack = slot.cardStack;
	
	// go through the cards
	for(var i = 0; i < ds_list_size(stack); i++) {
		var currentCard = stack[| i];
		
		//find the proc card
		if( currentCard.object_index == obj_ProcCard )
			procCard = currentCard;
		
		// add all food cards to the unprocList;
		if( currentCard.object_index == obj_FoodCard )
			ds_list_add(unprocList,currentCard);
	
	}
	
	if (procCard == noone) {
		show_debug_message("No proc, checking recipes");
		
		//TODO lookup a valid recipe
		//do it`
		
	} else {
		show_debug_message("Proc is ");// + string(global.procCardInfo[# procCard.cardId, 1 ]));
		
		//TODO: lookup a valid process
		//do it
	}
	
	ds_list_destroy(unprocList);
	ds_list_destroy(usedList);
	
}

function processFood(_process, _ingredientList) {
	//assume precondition that ingredients list contains the same item?
	
	for(var i = 0; i < ds_list_size(_ingredientList); i++) {
		var foodItem = _ingredientList[| i];
		//look under the process
		var processedItem = global.procCheck[# _process.cardId, foodItem.cardId];
		// make that item
		var output = CreateCard(foodItem.x,foodItem.y,cardTypes.food,processedItem);
		DiscardCard(output);
		
		//destroy that food if its used up
		foodItem.uses--;
		if(foodItem.uses < 1)
			DestroyCard(foodItem);
			
	}
	
	//return p
	DiscardCard(_process)
}

function combineRecipe(ingredientList) {
	
	//for each x in the recipe's
	
	//return
}