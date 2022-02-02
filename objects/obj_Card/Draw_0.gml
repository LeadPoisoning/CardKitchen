if(hover)
	draw_sprite(spr_FXCardHover,0,x,y);

if(!faceUp) {
	draw_sprite(spr_TestCardBack,0,x,y);
} else {
	draw_sprite(sprite_index,0,x,y);
	draw_set_halign(fa_center);
	
	//draw title
	draw_set_color(c_black);
	draw_text_ext(x,y-62,cardTitle,15,90);
	draw_set_color(c_white);
	draw_text_ext(x,y-63,cardTitle,15,90);
	
	//draw text
	draw_set_color(c_black);
	draw_text_ext(x,y+21,cardDesc,15,90);
	draw_set_color(c_white);
	draw_text_ext(x,y+20,cardDesc,15,90);
}