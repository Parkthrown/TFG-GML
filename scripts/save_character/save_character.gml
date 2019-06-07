
var inst = argument0;
var object = inst.object_index;
var array = global.playerData[?object];
var map = ds_map_create();
map[?"object_index"] = object;
map[?"depth"] = inst.depth;

for(var i = 0; i<array_length_1d(array);i++){
	var name = array[i]
	var value = variable_instance_get(inst,name);
	map[?name] = value;
}
 
return map;