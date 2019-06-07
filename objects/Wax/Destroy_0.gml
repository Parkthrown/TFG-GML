/// @description Insert description here
// You can write your code in this editor
if (id == global.player){
	shaker(12,12,obj_Cam);
	shaker(3,50,obj_Cam);
	instance_create_depth(x,y,0,obj_deathMenu);
	with(obj_Cam){
		if(state == 0 && follow == other.id){
			state = 1;
			vec = [other.x,other.y];
		}
	}
}
instance_create_depth(x,y,0,obj_deathFlares);
#region effects
	part_type_speed(obj_partManager.partStar,1.2,3.2,-0.025,0.005);
	part_type_life(obj_partManager.partStar,32,52);
	part_particles_create_color(global.part_system_front,x,y,obj_partManager.partStar,
	c_black,128);
	part_type_life(obj_partManager.partStar,16,24);
	part_type_speed(obj_partManager.partStar,0.75,0.75,-0.01,0);
#endregion	
audio_play_sound(snd_WaxDead,1,0);
ds_map_destroy(weapon);
ds_map_destroy(projectile);