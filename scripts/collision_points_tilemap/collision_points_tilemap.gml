///@arg tilemap
///@arg points
var cmap = CMAP
var collide = 0;

for(var i = 1; i < argument_count; i++){
	var arr = argument[i];
	collide = collide || collision_tiles(cmap,arr[0],arr[1]);
}

return collide;