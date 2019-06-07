var file = ds_map_create();
var arr;

#region maps

arr = global.saveFileMap[?"maps"];
for(var i = 0; i<array_length_1d(arr); i++){
	var map = ds_map_create();
	ds_map_copy(map,variable_global_get(arr[i]));
	ds_map_add_map(file,arr[i],map);
}

#endregion
#region lists

arr = array_append(global.saveFileMap[?"lists"],global.saveFileMap[?"matrices"]);
for(var i = 0; i<array_length_1d(arr); i++){
	var list = ds_list_create();
	ds_list_copy(list,variable_global_get(arr[i]));
	ds_map_add_list(file,arr[i],list);
}

#endregion
#region vars

arr = global.saveFileMap[?"vars"];
for(var i = 0; i<array_length_1d(arr); i++){
	ds_map_add(file,arr[i],variable_global_get(arr[i]));
}

#endregion

var json = json_encode(file);

var fileStr = "/"+SAVE_PREFIX+string(global.fileName)+SAVE_FORMAT;

if(file_exists(SAVE_DIRECTORY+fileStr)) file_delete(SAVE_DIRECTORY+fileStr);
var tx = file_text_open_write(SAVE_DIRECTORY+fileStr);
file_text_write_string(tx,json);
file_text_close(tx);

ds_map_destroy(file);
file = undefined;


