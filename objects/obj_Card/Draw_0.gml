if(hover)
	draw_sprite(spr_FXCardHover,0,x,y);

if(!faceUp) {
	draw_sprite(spr_TestCardBack,0,x,y);
} else {
	draw_sprite(sprite_index,0,x,y);
	draw_set_halign(fa_center);
	draw_text_ext(x,y-63,cardTitle,15,90);
}