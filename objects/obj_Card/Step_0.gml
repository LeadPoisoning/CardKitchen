var dist = point_distance(x,y,xTo,yTo);

if (dist > 2) {
	move_towards_point(xTo, yTo, dist/10);
} else {
	speed = 0;
	x = xTo;
	y = yTo;
}