//set room width and camera and gui stuff;

InitFoodCardInfo();
InitProcCardInfo();
InitProcessGrid();
InitRecipeGrid();

global.cardW = 96;
global.cardH = 128;

global.baseDeck = ds_list_create();

var i = 0;
repeat(9) {
	var card = noone;
	if(i mod 3 == 0)
		card = CreateCard(0, 0, cardTypes.food, foodCard.mato);
	else if(i mod 3 == 1)
		card = CreateCard(0, 0, cardTypes.food, foodCard.tato);
	else
		card = CreateCard(0, 0, cardTypes.food, foodCard.spinch);
		
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