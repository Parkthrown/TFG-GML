/// @description Insert description here
// You can write your code in this editor
if(state == 1){
	part_type_speed(obj_partManager.partStar,1.2,3.2,-0.025,0.005);
	part_type_life(obj_partManager.partStar,32,52);
	part_particles_create_color(global.part_system_front,x,y,obj_partManager.partStar,
	c_black,128);
	part_type_life(obj_partManager.partStar,16,24);
	part_type_speed(obj_partManager.partStar,0.75,0.75,-0.01,0);
}