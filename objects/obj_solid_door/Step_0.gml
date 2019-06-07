/// @description Insert description here
// You can write your code in this editor
if(open){
	with(instance_create_depth(x,y,depth,obj_ns_door)){
		sprite_index = other.sprite_index;
		image_xscale = other.image_xscale;
		depth = get_depth_map();
	}
	instance_destroy();
}