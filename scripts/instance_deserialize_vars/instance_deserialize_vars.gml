///@argument Json
///@arg destroy(true)

var json = (is_string(argument[0])) ? json_decode(argument[0]): argument[0];
var i = ds_map_find_first(json); 
var val = 0;
var str = "";

while(i != undefined){
	switch(string_char_at(i,0)){
		case "|":
			var list = json[?i];
			val = ds_list_create();
			ds_list_copy(val,list);
			str = string_copy(i,2,string_length(i));
			ds_list_destroy(variable_instance_get(id,str));
		break;
		case "?": 
			var map = json[?i];
			val = ds_map_create();
			ds_map_copy(val,map);
			str = string_copy(i,2,string_length(i));
			ds_map_destroy(variable_instance_get(id,str));
		break;
		case "#": 
			var grid = json[?i];
			var w = ds_grid_width(grid);
			var h = ds_grid_height(grid);
			val = ds_grid_create(w,h);
			ds_grid_copy(val,grid);
			str = string_copy(i,2,string_length(i));
			ds_grid_destroy(variable_instance_get(id,str));
		break;
		default:
			val = json[?i];
			str = i;
		break;
	}
	
	variable_instance_set(id,str,val);
	i = ds_map_find_next(json,i);
}

if(argument_count < 2 || argument[1]) ds_map_destroy(json);