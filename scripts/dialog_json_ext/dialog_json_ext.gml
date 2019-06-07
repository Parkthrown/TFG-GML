///@argument0 speaker
///@argument1 cutscene
///@argument2 speed
///@argument3 font
///@argument4 color
///@argument5 sound

var count = argument_count;
var speaker = argument[0];
var cutscene = argument[1];
var spd = argument[2];
var fnt = argument[3];
var col = argument[4];
var snd = argument[5];
var auto = argument[6];

var map = ds_map_create();
map[?"speaker"] = speaker;
map[?"cutscene"] = cutscene;
map[?"spd"] = spd;
map[?"sound"] = snd;
map[?"font"] = fnt;
map[?"color"] = col;
map[?"auto"] = auto;

var list = ds_list_create()
for( var i = 7; i<argument_count; i++ ){
	ds_list_add(list,argument[i]);
}

ds_map_add_list(map,"|dialog",list)
var json = json_encode(map);
ds_map_destroy(map);
map = undefined;
show_debug_message(json);
return json;
