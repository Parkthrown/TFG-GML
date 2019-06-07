var oI = object_index;
while(!ds_map_find_value(global.depthMap,oI)){
	if(object_get_parent(oI)){
		oI = object_get_parent(oI);
	}else{
		show_debug_message("couldn't find parent map");
		return depth;
	}
}
return global.depthMap[?oI];

