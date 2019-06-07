if(ds_map_exists(global.saveRooms,room)){
with(all){
	if(ds_map_exists(global.saveMap,object_index)){
		instance_destroy(id,0);
	}
}
var list = global.saveRooms[?room];
	for(var i = 0; i<ds_list_size(list); i++){
		var m = list[|i];
		with(save_map_get_instance(m)){
			if(ds_map_exists(global.loadScripts,object_index)){
				var loadScript = global.loadScripts[?object_index];
				script_execute(loadScript);
			}
		}
	}
}