/// @description Insert description here
// You can write your code in this editor
if(active){
	if(part_system && part_emitter){
	part_emitter_burst(part_system,part_emitter,obj_partManager.flamePart,1);
	alarm_set(0,10);
	}else{
		event_user(0);
	}
}