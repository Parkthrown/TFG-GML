///@arg navigator

var map = argument0;
var layers =  map[?navigation.layers];
var layerIds = layer_get_all();
var len = array_length_1d(layerIds);
for(var i = 0; i < len; ++i ){
	
	var lay = layerIds[i];
	
	var layerName = layer_get_name(lay);
	var layerElements = ds_map_create();
	var elements = layer_get_all_elements(lay);
	
	ds_map_add_map(layers,lay,layerElements);
	
	for(var j = 0; j < array_length_1d(elements); ++j){
		var elId = elements[j];
		var elType = layer_get_element_type(elId);
			var elList = layerElements[?elType];
			if(!is_array(elList)){
				layerElements[?elType] = [];
				elList = layerElements[?elType];
			}
			elList[@array_length_1d(elList)] = elId;
	}
}