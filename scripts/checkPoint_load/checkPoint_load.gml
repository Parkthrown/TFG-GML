///@argument0 checkPointData

var map = argument0;

var player = map[?"player"];

with(instance_create_depth(map[?"x"],map[?"y"],0,map[?"object_index"])){
	global.player = id;
	global.IO[0] = id;
	instance_deserialize_vars(player,0);
	get_depth_map();
	y -= BBOX_BOTTOM_DISTANCE;
	persistent = 1;
}

room_goto(map[?"room"]);

var str = strcat(
	"\nroom is: ",
	room_get_name(map[?"room"]),
	"\ncharacter is: ",
	object_get_name(map[?"object_index"]),
	"\nwith vars: ",
	json_encode(player)
);
ds_map_destroy(player);
show_debug_message(str);



