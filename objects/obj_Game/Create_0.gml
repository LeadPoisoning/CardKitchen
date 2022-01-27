InitFoodCardInfo();
InitProcCardInfo();
InitProcCheck();

global.cardW = 96;
global.cardH = 128;

global.baseDeck = ds_list_create();

var i = 0;
repeat(8) {
	var card = CreateCard(0, 0, cardTypes.food, i mod 2);
	card.persistent = true;
	global.baseDeck[| i++] = card;
	
}
var card = CreateCard(0, 0, cardTypes.process, 0);
card.persistent = true;
global.baseDeck[| i++] = card;

room_goto(Room1);