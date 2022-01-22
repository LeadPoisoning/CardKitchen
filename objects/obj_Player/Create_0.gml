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

deckCount = i;
handCount = 0;
discardCount = 0;