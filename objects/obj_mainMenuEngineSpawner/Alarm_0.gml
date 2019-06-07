/// @description Insert description here
// You can write your code in this editor
part_particles_create(global.part_system_front,
random_range(bbox_left,bbox_right),
random_range(bbox_top,bbox_bottom),
obj_partManager.partDust,1);
alarm_set(0,1);