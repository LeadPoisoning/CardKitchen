function createCustomer() {
	
	// create customer
	// give random food from list
	
	var foodOptions = [
		foodCard.salad,
		foodCard.snowbirdNuggets,
		foodCard.snowbirdSoup,
		foodCard.snowTucky,
		foodCard.matoSoup,
		foodCard.tatoMashed,
		foodCard.tatoFries
		];
		
	var _p = irandom_range(4,6);
	
	var _customer = instance_create_layer(950,-80,"Customers",obj_Customer);
	_customer.order = foodOptions[irandom(6)];
	_customer.patience = _p;
	
	return _customer;
}

function advanceDay() {
	
	global.dayTurnCount++;
	
	for(var i = 0; i < instance_number(obj_Customer); i++) {
		var current = instance_find(obj_Customer,i);
		current.patience--;
	}
	
}