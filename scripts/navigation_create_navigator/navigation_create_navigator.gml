///@arg navigator
var map = argument0;

map[?navigation.prevRoom] = 0;;
map[?navigation.nextRoom] = 0;
map[?navigation.navScript] = undefined;
var layerMap = ds_map_create();
ds_map_add_map(map,navigation.layers,layerMap);

return map;