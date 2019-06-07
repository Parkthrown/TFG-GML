///@arg array;
with(instance_create_depth(x,y,0,obj_deathFlares)){
	distance = 470;
	state = 1;
	ammount = 2;
	size = 10;
	end_deadzone = 5;
	distance_ratio = distance*0.01;
	_approach = 1;
}

sprite_index = WaxWaffleIdle;
alarm_set(8,100);