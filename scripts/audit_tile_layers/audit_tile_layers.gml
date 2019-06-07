var layers = [];

if(is_array(argument[0])){
	layers = argument[0];
}else{
	for(var i = 0; i < argument_count; ++i){
		layers[i] = argument[i];
	}
}

var layerId;
for(var i = 0; i < array_length_1d(layers); ++i){
	if(!layer_exists(layers[i])){
		layerId = layer_create(-1,layers[i]);
		show_debug_message(strcat(TRACE_WARNING ,layers[i], ": ", "created as a layer"));
	}else{
		layerId = layer_get_id(layers[i]);
		if(layer_tilemap_exists(layerId,layer_tilemap_get_id(layerId))){
			continue;
		}
	}
	layer_tilemap_create(layerId,0,0,ts_cMap,room_width,room_height);
	show_debug_message(strcat(TRACE_WARNING ,layers[i], ": ", "created as a tilemap"));
}