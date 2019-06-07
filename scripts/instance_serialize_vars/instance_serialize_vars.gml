///@argument0 instance
///@argument1 variables
var inst = argument0;
var arr = argument1;
var map = ds_map_create();
for(var i = 0; i< array_length_1d(arr); i++){
	var str = undefined;
	var val = undefined;
	switch(string_char_at(arr[i],0)){
		default:
			val = arr[i];
			if(variable_instance_exists(inst,val)){
				ds_map_add(map,val,variable_instance_get(inst,val));
			}
		break;
		case "|":
			str = string_copy(i,2,string_length(i));
			if(variable_instance_exists(inst,str)){
				val = ds_list_create();
				ds_list_copy(val,variable_instance_get(inst,str));
				ds_map_add_list(map,arr[i],val);
			}
		break;
		case "?": 
			str = string_copy(i,2,string_length(i));
			if(variable_instance_exists(inst,str)){
				val = ds_map_create();
				ds_map_copy(val,variable_instance_get(inst,str));
				ds_map_add_map(map,arr[i],val);
			}
		break;
		case "#":
			str = string_copy(i,2,string_length(i));
			if(variable_instance_exists(inst,str)){
				var grid = variable_instance_get(inst,str);
				var w = ds_grid_width(grid);
				var h = ds_grid_height(grid);
				val = ds_grid_create(w,h);
				ds_grid_copy(val,variable_instance_get(inst,str));
				ds_map_add(map,arr[i],val);
			}
		break;
	}
}

return map;