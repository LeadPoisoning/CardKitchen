if(!faceUp) {
	draw_sprite(spr_TestCardBack,0,x,y);
} else {
	draw_sprite(sprite_index,0,x,y);
	draw_text(x - 20,y - 20,id);
}