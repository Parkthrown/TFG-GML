///@argument0 file

var file = argument0;
var arr = [];

#region maps

arr = global.saveFileMap[?"maps"];
for(var i = 0; i<array_length_1d(arr); i++){
	ds_map_destroy(variable_global_get(arr[i]));
	var map = ds_map_create();
	ds_map_copy(map,file[?arr[i]]);
	variable_global_set(arr[i],map);
}

#endregion
#region lists

arr = global.saveFileMap[?"lists"];
for(var i = 0; i<array_length_1d(arr); i++){
	ds_list_destroy(variable_global_get(arr[i]));
	var list = ds_list_create();
	ds_list_copy(list,file[?arr[i]]);
	variable_global_set(arr[i],list);
}

#endregion
#region matrices

arr = global.saveFileMap[?"matrices"];
for(var i = 0; i<array_length_1d(arr); i++){
	ds_list_destroy(variable_global_get(arr[i]));
	var list = ds_list_create();
	ds_list_copy(list,file[?arr[i]]);
	for(var j = 0; j < ds_list_size(list); j++){
		if(is_array(list[|j])) continue;
		var subList = list[|j];
		list[|j] = array_from_list(list[|j]);
		ds_list_destroy(subList)
	}
	variable_global_set(arr[i],list);
}

#endregion
#region vars

arr = global.saveFileMap[?"vars"];
for(var i = 0; i<array_length_1d(arr); i++){
	variable_global_set(arr[i],file[?arr[i]]);
}

#endregion

ds_map_destroy(file);