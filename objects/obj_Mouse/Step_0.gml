var clicked = mouse_check_button_pressed(mb_left);
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
	show_debug_message(heldCard);
	heldCard.xTo = x-15;
	heldCard.yTo = y-15;
} else {
	show_debug_message("none");
}