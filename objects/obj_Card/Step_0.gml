sprite_index = global.cardInfo[# cardId, 0];

if (inHand) {
	if (point_distance(x,y,xTo,yTo) > 8) {
		move_towards_point(xTo, yTo, 8);
	} else {
		speed = 0;
		x = xTo;
		y = yTo;
	}
}