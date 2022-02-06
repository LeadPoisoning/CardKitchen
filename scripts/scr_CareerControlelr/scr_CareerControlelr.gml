function createCustomer() {
	
	// create customer
	// give random food from list
	
	var foodOptions = [
		foodCard.salad,
		foodCard.snowbird_nuggets,
		foodCard.snowbird_soup,
		foodCard.snowtucky_fried_bird,
		foodCard.mato_soup,
		foodCard.baked_tato,
		foodCard.tato_wedges
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