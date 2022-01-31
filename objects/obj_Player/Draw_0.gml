draw_sprite(spr_TestDeck, -1, deckX, deckY);

draw_set_halign(fa_left);
draw_text(50,10,"Turns: " + string(global.dayTurnCount));
draw_text(50,30,"Money: $" + string(global.money));