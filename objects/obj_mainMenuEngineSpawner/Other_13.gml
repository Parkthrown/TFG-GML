/// @description Insert description here
// You can write your code in this editor
/*
var wax = instance_create_depth(x,y,100,Wax);
with(wax){
	setState(states.Cutscene,0);
	sprite_index = WaxWaffleIdle;
	alarm_set(8,10);
}

with(obj_Cam){
	vec = [vec[0],stretch(other.y+32,32)-dist];
	state = 1;
	spd = 8;
}
screenFlash(6);
sleep(2);
shaker(8,37,obj_Cam);
with(instance_create_depth(x,y,0,obj_deathFlares)){
	distance_ratio = 0.015;
}
#region effects
	part_type_speed(obj_partManager.partStar,1.2,3.2,-0.025,0.005);
	part_type_life(obj_partManager.partStar,32,52);
	part_particles_create_color(global.part_system_front,x,y,obj_partManager.partStar,
	c_black,128);
	part_type_life(obj_partManager.partStar,16,24);
	part_type_speed(obj_partManager.partStar,0.75,0.75,-0.01,0);
#endregion	
*/
instance_destroy();