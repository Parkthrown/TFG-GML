/// @description Insert description here
// You can write your code in this editor
event_inherited();
finished = 0;
lock = 0;

var arr = global.shortcuts[|global.level];
if(arr[lock] == 1){
	with(instance_create_depth(x,y,depth,obj_ns_shdoor)){
		sprite_index = other.sprite_index;
		image_xscale = other.image_xscale;
		depth = get_depth_map();
	}
	instance_destroy();
}