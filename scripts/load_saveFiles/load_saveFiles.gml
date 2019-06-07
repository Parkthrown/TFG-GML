///@argument0 list
var file = file_find_first(SAVE_DIRECTORY + "/*" + SAVE_FORMAT,0);
var map = "";
while(file != "" && ds_list_size(argument0)<5){
	var json = json_create_from_file(SAVE_DIRECTORY + "/" + file);
	map = json_decode(json);
	ds_list_add_map(argument0,map);
	file = file_find_next();
}
var size = ds_list_size(argument0);
if(size <= 5) repeat(5-size) ds_list_add_map(argument0,new_save_file());
return size;