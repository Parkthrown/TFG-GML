///@argument obj
///@argument damage
///@argument iframes
///@argument knockback
///@argument knockback_direction
///@argument knockback_angle
if(deal_damage(argument0,argument1)){
	with(argument0){
		var dir = (argument4 != 0) ? argument4: ((direction_x(other) != 0) ? direction_x(other): image_xscale);
		knock_back_angle(argument0,dir,argument5,argument3);
		alarm_set(2,argument2);
	}
	return 1;
}
return 0;