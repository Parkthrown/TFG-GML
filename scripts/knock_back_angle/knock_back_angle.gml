///@argument0 target
///@argument1 direction
///@argument2 angle
///@argument3 force

var realAngle = (argument1>0) ? degtorad(argument2): degtorad(-argument2+180);
with(argument0){
	set_speed(get_speed_from_angle(realAngle,argument3));
	show_debug_message(strcat(hsp," && ",vsp));
}