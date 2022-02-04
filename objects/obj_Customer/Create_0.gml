order = foodCard.salad;

patience = 5;

body = irandom(3);
head = irandom(3);
hat = -1;

if (random(1) > 0.4)
	hat = irandom(4);


//mood = 0;
	//default
	//hangry - fast food will give a bigger bonus, slow will be harsher
	//chill - less bonus for fast, less/no punishment for slow
	//connoisseur - hates modifications (spices/salt/sugar)
	//adventerous - loves mods
	//alcoholic - extra susceptible to alc
	//music lover - extra susceptible to music
	//reviewer - harsher all around, effects popularity
	
xTo = 0;
yTo = 0;

bounce = 1;
bounceOff = random(100);
bounceSpd = random_range(100,220);