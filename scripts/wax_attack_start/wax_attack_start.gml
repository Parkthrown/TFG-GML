///@desc attack or cook the held item
///@argument attack

if(holding) {
	holding.boil = (holding.boil) ? holding.boil: flameType;
	return;
}

var inits = weapon[?weaponData.inits];
if(inits[argument0] != -1 && inits[argument0] != undefined){
	script_execute(inits[argument0],weapon,argument0);
}

