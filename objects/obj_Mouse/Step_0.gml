var clicked = mouse_check_button(mb_left);
var released = mouse_check_button_released(mb_left);

x = mouse_x;
y = mouse_y;

if (clicked) {
	heldCard = collision_point(x, y, obj_Card , false, true);
}

if (released) {
	heldCard = noone;
}

if (heldCard != noone) {
	heldCard.toX = x;
	heldCard.toY = y;
}