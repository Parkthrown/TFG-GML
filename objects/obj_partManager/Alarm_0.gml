/// @description Insert description here
// You can write your code in this editor
var size = ds_list_size(global.partList);
if(size > 0){
	show_debug_message("attempting to clear the particle buffer");
	if(part_particles_count(global.part_system_front) == 0){
		part_particles_clear(global.part_system_front);
		show_debug_message("Particle buffer cleared");
		alarm_set(0,3600);
	}else if(size > 16){
		show_debug_message("Trimming particle buffer");
		ds_list_set(global.partList,0,ds_list_find_value(global.partList,size-1));
		for(var i = 16; i< size; i++){
			ds_list_delete(global.partList,i);
		}
	}
}else{
	alarm_set(0,3600);
}
