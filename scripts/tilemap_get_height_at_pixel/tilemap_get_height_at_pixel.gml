///@desc
///@arg tileMap
///@argument x
///@argument y

var _x = argument1;
var _y = argument2;

var tile = tilemap_get_at_pixel(argument0,_x,_y);
if(tile <= -1 || tile & tile_index_mask <= -1) return 0;

if(tile < TILE_MAX){
	var col = ( _x&(TILE_SIZE-1));
}else{
	tile = tile & tile_index_mask;
	var col = (TILE_SIZE-1-( _x&(TILE_SIZE-1)));
}

col += (tile*TILE_SIZE);
var height = global.heights[col % (TILE_SIZE*TILE_MAX + 1)];
	
var yy = _y&(TILE_SIZE-1);
	 
if(height == 0 || yy >= height) return height;
return -1;