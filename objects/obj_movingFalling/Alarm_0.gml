/// @description Insert description here
// You can write your code in this editor
open = 1;
vsp = (type == 3 || type == 2) ? int64(-realSp): 0;
hsp = (type == 3 || type == 1) ? int64(-realSp): 0;
repeat(4)part_particles_create(global.part_system_front,random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),obj_partManager.partSmokeBlastSmall,1);
shaker(10,5,obj_Cam);