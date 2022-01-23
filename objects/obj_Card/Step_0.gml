if (inHand) {
	if (point_distance(x,y,toX,toY) > 8) {
		move_towards_point(toX, toY, 8);
	} else {
		speed = 0;
		x = toX;
		y = toY;
	}
}