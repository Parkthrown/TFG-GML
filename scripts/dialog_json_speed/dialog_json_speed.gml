///@argument0 speaker
///@argument1 cutscene
///@argument2 speed

var count = argument_count;
var speaker = argument[0];
var cutscene = argument[1];
var spd = argument[2];

var map = ds_map_create();
map[?"speaker"] = speaker;
map[?"cutscene"] = cutscene;
map[?"spd"] = spd;

var list = ds_list_create()
for( var i = 3; i<argument_count; i++ ){
	ds_list_add(list,argument[i]);
}

ds_map_add_list(map,"|dialog",list);

var json = json_encode(map);
ds_map_destroy(map);
map = undefined;

return json;