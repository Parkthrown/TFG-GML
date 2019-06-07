/// @description Insert description here
// You can write your code in this editor
if(room == saveRoom){
	with(all){
		if(ds_map_exists(global.playerData,object_index)){
			instance_destroy();
		}
	}
	for(var i = 0; i<ds_list_size(saveInstances);i++){
		var map = saveInstances[|i];
		var object = map[?"object_index"];
		var _layer = map[?"depth"];
		var inst = instance_create_depth(0,0,_layer,object);

		var array = global.playerData[?object];
		with(inst){
			for(var i = 0; i<array_length_1d(array);i++){
				var name = array[i];
				var value = map[?name];
				variable_instance_set(inst,name,value);
			}
		}
	} 
	with(obj_Cam){
		follow = Wax;
	}
	instance_destroy();
}
	