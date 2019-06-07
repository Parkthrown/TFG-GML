///arg player
///arg room
with(instance_exists(obj_Cam) ? obj_Cam: instance_create_depth(0,0,1,obj_Cam)){
	if(instance_exists(argument[0])){
		state = 0;
		follow = argument[0];
		x = argument[0].x;
		y = argument[0].y;
	}else{
		state = 1;
	}
}
audit_tile_layers(LAYERS_MANDATORY);
with(instance_create_depth(0,0,depth,obj_overlayUI)){
	target = argument[0];
}

navigation_get_layer_data(global.navigator);
depth_assign();
