/// @description Damage Event
// You can write your code in this editor
if(!inmune){
	part_particles_create(global.part_system_front,x,y,obj_partManager.partBlood,choose(3,4));
		part_type_speed(obj_partManager.partStar,1.2,3.2,-0.5,0.005);
	part_type_life(obj_partManager.partStar,18,18);
	part_particles_create_color(global.part_system_front,x,y,obj_partManager.partStar,
	c_black,25);
	part_type_life(obj_partManager.partStar,16,24);
	part_type_speed(obj_partManager.partStar,0.75,0.75,-0.01,0);
	part_particles_create_color(global.part_system_front,x,y,obj_partManager.partStar,
	c_black,10);
	if (state != states.Dead && !checkState(states.Airborne,airStates.Knocked)){
		setState(states.Airborne,airStates.Knocked);
	}
	if(HP <= 0){
		instance_destroy();
	}
}else{
	
}

