InitFoodCardInfo();
InitProcCardInfo();
InitProcCheck();
InitRecipeCheck();

global.cardW = 96;
global.cardH = 128;

global.baseDeck = ds_list_create();

var i = 0;
repeat(9) {
	var card = CreateCard(0, 0, cardTypes.food, i mod 2);
	card.persistent = true;
	card.visible = false;
	global.baseDeck[| i++] = card;
	
}
var card = CreateCard(0, 0, cardTypes.process, 0);
card.persistent = true;
card.visible = false;
global.baseDeck[| i++] = card;

var card = CreateCard(0, 0, cardTypes.process, 0);
card.persistent = true;
card.visible = false;
global.baseDeck[| i++] = card;

room_goto(TestShop);