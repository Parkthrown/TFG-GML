/// @description advance time
// You can write your code in this editor
global.time = (global.time+cycle_speed)%1.;
with(obj_partManager){
	part_type_alpha1(partLight16px,1.5*-CURRENT_BRIGHTNESS);
}