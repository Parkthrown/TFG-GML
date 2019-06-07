/// @description Insert description here
// You can write your code in this editor
for(var i = 0; i<random_range(8,12);i++){
	with(instance_create_depth(random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),depth,obj_debris)){
		set_speed_from_angle([random_range(x-1,x+1),random_range(y-1,y+1)],max(other.vsp,other.hsp)*1.5);
	}
}
repeat(4)part_particles_create(global.part_system_front,random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),obj_partManager.partSmokeBlast,1);
shaker(12,5,obj_Cam);