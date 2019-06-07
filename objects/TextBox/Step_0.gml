/// @description Insert description here
// You can write your code in this editor
if(instance_exists(global.player)){
	with(receptor){
		if(distance_to_point(other.x+string_length(other.text),other.y)>64){
			instance_destroy(other);
		}
	}
}
if(!instance_exists(parent)){
	instance_destroy();
}