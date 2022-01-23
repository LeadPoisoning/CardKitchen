deck = ds_list_create();
hand = ds_list_create();
discard = ds_list_create();

var i = 0;
deck[| i++] = 1;
deck[| i++] = 2;
deck[| i++] = 1;
deck[| i++] = 2;
deck[| i++] = 1;
deck[| i++] = 2;
deck[| i++] = 1;
deck[| i++] = 2;

cardW = 96;
cardH = 128;
deckX = 1000;
deckY = 600;
discardX = 1000;
discardY = 600 - cardH*3/2;
handX = 200;
handY = 640;