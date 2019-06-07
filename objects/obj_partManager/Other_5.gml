/// @description Insert description here
// You can write your code in this editor
var count = 0;
for(var i = 0; i<ds_list_size(global.partList); i++){
	var p = ds_list_find_value(global.partList,i);
	if(part_type_exists(p)){
			part_type_destroy(p);
			count++;
	}
}
show_debug_message(string(count)+" particle types deleted");
surface_free(surf);