var width = GAME_WIDTH;
var height = GAME_HEIGHT;
var vMid = height/2;
var hMid = width/2;

with(obj_Cam){
	vMid = y - dist;
	hMid = x;
}

part_particles_create(global.part_system_front,hMid,vMid+42+selected*16,obj_partManager.partBlast,1);