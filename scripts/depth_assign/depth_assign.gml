var it = ds_map_find_first(global.depthMap);
var s = ds_map_size(global.depthMap);
for(var i = 0; i<s; i++){
	with(it){
		depth = global.depthMap[?it];
	}
	it=ds_map_find_next(global.depthMap,it);
}
