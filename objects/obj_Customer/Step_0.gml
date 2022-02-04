var dist = point_distance(x,y,xTo,yTo);

if (dist > 2) {
	move_towards_point(xTo, yTo, dist/10);
} else {
	speed = 0;
	x = xTo;
	y = yTo;
}

if(x > room_width) {
	//remove from player list
	var player = obj_Player;
	var pos = ds_list_find_index(player.customers,id);
	if(pos != -1)
		ds_list_delete(player.customers,pos);
	instance_destroy();
}