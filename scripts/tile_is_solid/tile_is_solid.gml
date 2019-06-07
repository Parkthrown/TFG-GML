///@arg tilemap
///@arg x
///@arg y
var tile = tilemap_get_at_pixel(argument0,argument1,argument2);
return (tile != -1) && ((tile & tile_index_mask) <= 1);