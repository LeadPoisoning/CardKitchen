if(hover)
	draw_sprite_ext(spr_FXCardHover,0,x,y,image_xscale,image_yscale,0,c_white,1)

if(!faceUp) {
	draw_sprite_ext(spr_TestCardBack,0,x,y,image_xscale,image_yscale,0,c_white,1);
	
} else {
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_white,1);
	draw_set_halign(fa_center);
	draw_set_font(fnt_Reg);
	draw_text_ext(x, y-(image_yscale*0.48*global.cardH), cardTitle, 25*image_yscale, global.cardW * 0.94*image_xscale );
}