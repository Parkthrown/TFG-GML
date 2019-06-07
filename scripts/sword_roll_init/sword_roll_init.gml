var hasDashSlash = false; 

if(sprite_index == WaxRollSlice || shots < 2){
	hasDashSlash = true;
}else with(obj_rollSlash){
	hasDashSlash = hasDashSlash || creator == other;
}

if(!hasDashSlash){
	weapon_assign_animation(argument0,argument1);
	hsp += -(hsp/3);
	vsp = -1.25;
}
