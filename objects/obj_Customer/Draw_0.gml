draw_sprite(sprite_index,patience,x,y);

//draw_guy;
draw_sprite(spr_CustBody,body,x+119,y+43);
draw_sprite(spr_CustHead,head,x+119,y+43+bounce);
if(hat != -1)
	draw_sprite(spr_CustHat,hat,x+119,y+43+bounce);
	
//draw order
draw_set_halign(fa_left);
draw_set_color(c_black);
draw_text_ext(x+10, y+9,global.foodCardInfo[# order,1 ],15,85);