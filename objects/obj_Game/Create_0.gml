//set room width and camera and gui stuff;

InitFoodInfo();
InitProcCardInfo();
InitRecipeGrid();

global.cardW = 96;
global.cardH = 128;

global.baseDeck = ds_list_create();
global.money = 0;

//generate random deck
var cards = irandom_range(7,12);
repeat(cards) {
	var card = noone;
	switch (irandom(3)){
		default:
		case 0:
			card = CreateCard(0, 0, cardTypes.food, foodCard.spinch);
			break;
		case 1:
			card = CreateCard(0, 0, cardTypes.food, foodCard.mato);
			break;
		case 2:
			card = CreateCard(0, 0, cardTypes.food, foodCard.tato);
			break;
		case 3:
			card = CreateCard(0, 0, cardTypes.food, foodCard.snowbird);
			break;
		case 4:
			card = CreateCard(0, 0, cardTypes.food, foodCard.mato);
			break;
		case 5:
			card = CreateCard(0, 0, cardTypes.food, foodCard.mato);
			break;
		case 6:
			card = CreateCard(0, 0, cardTypes.food, foodCard.mato);
			break;
		case 7:
			card = CreateCard(0, 0, cardTypes.food, foodCard.mato);
			break;
		case 8:
			card = CreateCard(0, 0, cardTypes.food, foodCard.mato);
			break;
	}
		
	card.persistent = true;
	card.visible = false;
	ds_list_add(global.baseDeck, card);
	
}
//var procs = irandom_range(2,4);
//repeat(procs) {
//	var card = noone;
//	switch (irandom(2)){
//		default:
//		case 0:
//			card = CreateCard(0, 0, cardTypes.process, procCard.knife);
//			break;
//		case 1:
//			card = CreateCard(0, 0, cardTypes.process, procCard.skillet);
//			break;
//		case 2:
//			card = CreateCard(0, 0, cardTypes.process, procCard.pot);
//			break;
//		case 3:
//			card = CreateCard(0, 0, cardTypes.process, procCard.oven);
//			break;
//	}
		
//	card.persistent = true;
//	card.visible = false;
//	ds_list_add(global.baseDeck, card);
	
//}
var card = noone;
card = CreateCard(0, 0, cardTypes.process, procCard.knife);
card.persistent = true;
card.visible = false;
ds_list_add(global.baseDeck, card);
card = CreateCard(0, 0, cardTypes.process, procCard.skillet);
card.persistent = true;
card.visible = false;
ds_list_add(global.baseDeck, card);
card = CreateCard(0, 0, cardTypes.process, procCard.pot);
card.persistent = true;
card.visible = false;
ds_list_add(global.baseDeck, card);

room_goto(TestShop);

global.dev = true;
global.paused = false;