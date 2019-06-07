/// @description Insert description here
// You can write your code in this editor
with(parent){
	talking = 0;
}
repeat(15){
	var rndx = random_range(0,string_length(text)*3);
	var rndy = random_range(0,string_height(text)*2);
	part_particles_create(global.part_system_front,x+rndx,y+rndy,obj_partManager.partDust,1);
}