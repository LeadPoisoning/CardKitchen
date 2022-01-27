for(var i = 0; i < instance_number(obj_Slot); i++) {
	var testStack = instance_find(obj_Slot,i).cardStack;
	DiscardCard(testStack[| 0]);
}