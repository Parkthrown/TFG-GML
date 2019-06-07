///@argument instance
///@argument room
///@argument coords

var inst = argument0;
var _room = argument1;
var coords = argument2;

var map = ds_map_create();
var serialData = array_remove(global.playerData[?inst.object_index],["x","y"]);
ds_map_add(map,"object_index",inst.object_index);
ds_map_add_map(map,"player",instance_serialize_vars(inst,serialData));
ds_map_add_map(map,"room",_room);
ds_map_add(map,"x",coords[0]);
ds_map_add(map,"y",coords[1]);

return map;