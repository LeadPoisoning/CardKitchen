/// @description Draw Card
DrawCards(1);
drawAlarmCount--;

if(drawAlarmCount == 0) {
	global.control = true;
} else {
	alarm[1] = drawDelay;
}
