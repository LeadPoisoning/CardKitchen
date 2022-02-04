draw_sprite(sprite_index,patience,x,y);

//draw_guy;
draw_sprite(spr_CustBody,body,x+129,y+43);
draw_sprite(spr_CustHead,head,x+129,y+43);
if(hat != -1)
	draw_sprite(spr_CustHat,hat,x+129,y+43);
	
//draw order
draw_set_halign(fa_left);
draw_set_color(c_black);
draw_text_ext(x+10, y+9,global.foodCardInfo[# order,1 ],15,95);