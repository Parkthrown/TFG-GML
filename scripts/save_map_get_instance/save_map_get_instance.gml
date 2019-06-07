var map = argument0;
var object = map[?"object_index"];
var _depth = map[?"depth"];
var inst = instance_create_depth(0,0,_depth,object);

var array = global.saveMap[?object];

for(var i = 0; i<array_length_1d(array);i++){
	var name = array[i];
	var value = map[?name];
	variable_instance_set(inst,name,value);
}

return inst;