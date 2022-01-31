var dist = point_distance(x,y,xTo,yTo);

if (dist > 2) {
	move_towards_point(xTo, yTo, dist/10);
} else {
	speed = 0;
	x = xTo;
	y = yTo;
}

if( abs(image_xscale - scaleTo) > 0.03) {
	image_xscale = approach(image_xscale,scaleTo, abs(image_xscale - scaleTo)/8 );
} else {
	image_xscale = scaleTo;
}

if( abs(image_yscale - scaleTo) > 0.03) {
	image_yscale = approach(image_yscale,scaleTo, abs(image_yscale - scaleTo)/8 );
} else {
	image_yscale = scaleTo;
}

if(hover)
	scaleTo = 1.2;
else
	scaleTo = 1;