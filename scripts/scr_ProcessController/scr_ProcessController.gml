function acceptCard(inCard) { // obj_Slot

	return true;

}

//function that is called by button when clicked
function tryRunTurn() { // obj_SubmitTurnButton
	
	var cardReplaceTotal = 0;
	
	// Make sure ALL slots can process
	for(var i = 0; i < instance_number(obj_Slot); i++) {
		var testSlot = instance_find(obj_Slot,i);
		if( !canOpSlot(testSlot) ) {
			
			//if a single one cannot, then return -1
			show_debug_message("invalid process");
			return -1;
		}
		
	}
	
	// Process each slot
	for(var i = 0; i < instance_number(obj_Slot); i++) {
		var slot = instance_find(obj_Slot,i);
		operateSlot(slot);
		cardReplaceTotal += slot.cardReplace;
		slot.cardReplace = 0;
	}
	
	var _player = obj_Player;
	with(_player){
		DrawCards(cardReplaceTotal);
	}
	
	// Increment turn
	global.dayTurnCount++;
	show_debug_message("Processing... Turn is now: " + string(global.dayTurnCount));
	
	// TODO: turn increment stuff

}

//checks a given slot for ability to perform some operation
function canOpSlot(slot) {  // obj_SubmitTurnButton
	var stack = slot.cardStack;
	//returns 1 if success
	//returns -1 if is empty
	//returns -2 if there are 2 process cards
	//returns -3 if theres a proc card but no valid process
	//returns -4 if there is no valid recipe
	
	// if there are two process cards
	var procCount = 0;
	var currentProc = noone;
	for(var i = 0; i < ds_list_size(stack); i++) {
		if( stack[| i].object_index == obj_ProcCard ) {//find the proc card
			currentProc = stack[| i];
			procCount++;
		}
	}
	if(procCount > 1) {
		show_debug_message("too many proc cards");
		return false;
	}
	
	if(currentProc != noone) {
		//error if any cards cannot be processed by the current process (ie their output == noone)
		for(var i = 0; i < ds_list_size(stack); i++) {
			if( stack[| i].object_index == obj_FoodCard ) {//only run on food cards
				if( global.processes[# currentProc.cardId, stack[| i].cardId] == noone ) {
					show_debug_message("cannot process a food in this list");
					return false;
				}
			}
		}

	}
		
	
	return true;
	
}

//runs the operation for a slot (resuming it is possible)
function operateSlot(slot) {  // obj_SubmitTurnButton
	//precondition: there is a valid process for this slot
	
	var stack = slot.cardStack;
	if(ds_list_size(stack) == 0)
		return;
		
	slot.cardReplace = ds_list_size(stack);
	
	var unprocList = ds_list_create();
	var currentProc = noone;
	
	// go through the cards
	for(var i = 0; i < ds_list_size(stack); i++) {
		var currentCard = stack[| i];
		
		//find the proc card
		if( currentCard.object_index == obj_ProcCard )
			currentProc = currentCard;
		
		// add all food cards to the unprocList;
		if( currentCard.object_index == obj_FoodCard )
			ds_list_add(unprocList,currentCard);
	
	}
	
	//if there are no proc cards try a recipe
	if (currentProc == noone) {
		show_debug_message("No proc, checking recipes");
		
		//TODO lookup a valid recipe
		makeRecipe(unprocList);
		//do it
		
	} else {
		show_debug_message("Proc is " + string(global.procCardInfo[# currentProc.cardId, 1 ]));
		
		processFood(currentProc,unprocList);
		//do it
	}
	
	ds_list_destroy(unprocList);
	
}

//called by operateSlot when there is a process card present
function processFood(_process, _ingredientList) { //obj_SubmitTurnButton
	//assume precondition that every card being processed has an output
	//?assume precondition that ingredients list contains the same item?
	
	DiscardCard(_process)
	
	for(var i = 0; i < ds_list_size(_ingredientList); i++) {
		var foodItem = _ingredientList[| i];
		//look under the process
		var processedItem = global.processes[# _process.cardId, foodItem.cardId];
		// make that item
		var output = CreateCard(foodItem.x,foodItem.y,cardTypes.food,processedItem);
		DiscardCard(output);
		
		//destroy that food if its used up
		foodItem.uses--;
		if(foodItem.uses < 1)
			DestroyCard(foodItem);
			
	}
	//does used list mater in this case?
}

//called by operateSlot when there are no process cards
function makeRecipe(_ingredientList) {
	//precondition: there is exactly one valid recipe for this list
	
	var foodItem = _ingredientList[| 0];
	//figure out what we're making
	var recipeItem = findRecipe(_ingredientList);
	//create and discard an output object
	var output = CreateCard(foodItem.x,foodItem.y,cardTypes.food,recipeItem);
	DiscardCard(output);
	//for each ingredient reduce uses
	for(var i = 0; i < ds_list_size(_ingredientList); i++) {
		var usedIng = _ingredientList[| i];
		usedIng.uses--;
		if(usedIng.uses < 1)
			DestroyCard(usedIng);
	}
	
}

//called by makeRecipe, to retrieve the correct cardId of the intended output card
function findRecipe(_ingredientList) { //obj_SubmitTurnButton
	//precondition: there is exactly one valid recipe for this list
	//returns a foodId;
	
	//create a temporary holding list of the ingredients
	var tempIngredientsList = ds_list_create();
	
	//check each recipe (column) in the recipe grid for a match with current ingredients
	for(var ix = 0; ix < ds_grid_width(global.recipes); ix++) {
		//reset the ingredients list back to the input
		ds_list_copy(tempIngredientsList,_ingredientList);
		
		//check each item in the recipe to make sure it exists the correct number of times
		for(var iy = 0; iy < ds_grid_height(global.recipes); iy++) {
			
			//if we hit the end of the recipe, check if we've suceeded or not
			if(global.recipes[# ix,iy] == noone) {
				var allIngUsed = true; //check that the ingredients list is all used up
				for(var ii = 0; ii < ds_list_size(tempIngredientsList); ii++) {
					if(tempIngredientsList[| ii] != noone) {
						allIngUsed = false;
						break;
					}
				}
				if(allIngUsed) {
					//we have succeeded
					// output is now the current column
					//clean up and return
					ds_list_destroy(tempIngredientsList);
					return ix;
				} else {
					//we have ingredients left over
					//for now (may change) this is considered a failure, and we must continue checking recipes
					break;
				}
			}
			
			//check if the current ingredient (from the recipe) exists somewhere in "tempIngredientsList" (index != -1)
			var ingIndex = -1;
			for(var ii = 0; ii < ds_list_size(tempIngredientsList); ii++) {
				if( tempIngredientsList[| ii] != noone)
					if( tempIngredientsList[| ii].cardId == global.recipes[# ix,iy]) {
						ingIndex = ii;
						break;
					}
			}
			if(ingIndex != -1) {
				//set that position of tempIngredientsList to "noone"
				tempIngredientsList[| ingIndex] = noone;
			} else {
				//this recipe is wrong, continue checking
				break;
			}
			
		}
	}
	
	//if we got here without finding a recipe thats bad
	show_debug_message("no recipe found");
	ds_list_destroy(tempIngredientsList);
	return -1;
	//return
}