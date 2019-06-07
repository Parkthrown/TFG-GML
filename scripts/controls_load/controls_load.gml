///@argument0 map
///@argument1 file
if(file_exists(argument1)){
	var json = json_decode(json_create_from_file(argument1));
	for(var i = ds_map_find_first(json); ds_map_find_next(json,i) != undefined; i = ds_map_find_next(json,i)){
		argument0[?real(i)] = json[?i];
	}
	ds_map_destroy(json);
}else show_debug_message(strcat(TRACE_WARNING,"File supplied does not exist!"))