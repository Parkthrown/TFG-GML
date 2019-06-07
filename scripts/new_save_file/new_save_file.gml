var file = ds_map_create();
var arr = [];

#region maps

arr = global.saveFileMap[?"maps"];
for(var i = 0; i<array_length_1d(arr); i++){
	var map = ds_map_create();
	ds_map_add_map(file,arr[i],map);
}

#endregion
#region lists

arr = array_append(global.saveFileMap[?"lists"],global.saveFileMap[?"matrices"]);
for(var i = 0; i<array_length_1d(arr); i++){
	var list = ds_list_create();
	ds_map_add_list(file,arr[i],list);
}

ds_list_destroy(file[?"shortcuts"]);
var shortcuts = ds_list_create();
for(var i = 0; i<11; i++){
	shortcuts[|i] = [0,0,0,0];
}
ds_map_add_list(file,"shortcuts",shortcuts);

#endregion

#region vars

arr = global.saveFileMap[?"vars"];
for(var i = 0; i<array_length_1d(arr); i++){
	ds_map_add(file,arr[i],undefined);
}

#endregion

return file;