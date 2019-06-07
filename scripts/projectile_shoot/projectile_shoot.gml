///@arg projectile

var bullet = argument0[?projectileData.actor];
var cost = argument0[?projectileData.cost];

if(shots >= cost){
	with(instance_create_depth(x,y,0,bullet)){
		creator = other.id;
		hsp = baseSpeed * other.image_xscale;
		flameType = other.flameType;
	}
	shots -= cost;
	return SUCCESS_CODE
}
return FAILURE_CODE;
