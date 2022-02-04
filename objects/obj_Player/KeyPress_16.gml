if(global.control) {
	//global.dayTurnCount++;
	advanceDay();
	
	drawAlarmCount = ds_list_size(hand);
	repeat(drawAlarmCount) {
		DiscardCard(hand[|0]);
	}
	alarm[1] = drawDelay;
	
}