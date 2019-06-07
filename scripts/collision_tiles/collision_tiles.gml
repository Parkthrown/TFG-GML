///@desc
///@arg tileMap
///@argument x
///@argument y

var _x = argument1;
var _y = argument2;

var t = tilemap_get_at_pixel(argument0,_x,_y);

if(t < TILE_MAX){
	var col = ( _x&(TILE_SIZE-1));
}else{
	t = t & tile_index_mask;
	var col = (TILE_SIZE-1-( _x&(TILE_SIZE-1)));
}

if(t <= -1) return false;

col += (t*TILE_SIZE);
var hh = global.heights[col % (TILE_SIZE*TILE_MAX + 1)];
	
var yy = _y&(TILE_SIZE-1);
	
if(hh == 0 || yy >= hh) return true ;
return false;