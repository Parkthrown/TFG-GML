/// @description Insert description here
// You can write your code in this editor
load_Instances_room();
with(instance_exists(obj_Cam) ? obj_Cam: instance_create_depth(0,0,1,obj_Cam)){
	if(instance_exists(global.player)){
		state = 0;
		follow = global.player;
		x = global.player.x;
		y = global.player.y;
	}else{
		state = 1;
	}
}
audit_tile_layers(LAYERS_MANDATORY);
with(instance_create_depth(0,0,depth,obj_overlayUI)){
	target = global.player;
}

navigation_get_layer_data(global.navigator);
depth_assign();
