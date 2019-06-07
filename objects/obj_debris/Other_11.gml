/// @description Insert description here
// You can write your code in this editor
if(abs(vsp) > 1){
vsp = -vsp/3.5;
part_particles_create(global.part_system_front,x,bbox_bottom,obj_partManager.partDust,irandom(3));
}else{
	vsp = 0;
	hsp = 0;
}
rot += 5*(vsp*2);