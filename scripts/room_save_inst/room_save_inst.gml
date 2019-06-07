var list = ds_list_create();

with(all){
	if(ds_map_exists(global.saveMap,object_index)){
		var map = inst_get_save_map(id);
		ds_list_add_map(list,map);
	}
}

if(!ds_map_exists(global.saveRooms,room)){
	ds_map_add_list(global.saveRooms,room,list);
}else{
	ds_map_replace(global.saveRooms,room,list);
}


