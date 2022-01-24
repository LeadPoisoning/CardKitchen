mouse = instance_create_layer(mouse_x, mouse_y, "Instances", obj_Mouse);
deck = ds_list_create();
hand = ds_list_create();
discard = ds_list_create();

InitCardInfoGrid();

cardW = 96;
cardH = 128;
deckX = 1000;
deckY = 600;
discardX = 1000;
discardY = 600 - cardH*3/2;
handStartX = 100;
handStartY = 640;

var i = 0;
deck[| i] = instance_create_depth(deckX, deckY, 0, obj_Card);
deck[| i++].cardType = 1;
deck[| i] = instance_create_depth(deckX, deckY, 0, obj_Card);
deck[| i++].cardType = 1;
deck[| i] = instance_create_depth(deckX, deckY, 0, obj_Card);
deck[| i++].cardType = 1;
deck[| i] = instance_create_depth(deckX, deckY, 0, obj_Card);
deck[| i++].cardType = 1;
deck[| i] = instance_create_depth(deckX, deckY, 0, obj_Card);
deck[| i++].cardType = 2;
deck[| i] = instance_create_depth(deckX, deckY, 0, obj_Card);
deck[| i++].cardType = 2;
deck[| i] = instance_create_depth(deckX, deckY, 0, obj_Card);
deck[| i++].cardType = 2;
deck[| i] = instance_create_depth(deckX, deckY, 0, obj_Card);
deck[| i++].cardType = 2;