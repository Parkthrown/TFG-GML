var xx = argument0;
var yy = argument1;

var tilemap = argument2;

var xaux = x;
var yaux = y;

x = xx;
y = yy;

var meeting = collision_tiles(tilemap,x,y) || 
			  collision_tiles(tilemap,bbox_left,y) ||
			  collision_tiles(tilemap,bbox_right,y) ||
			  collision_tiles(tilemap,bbox_left,bbox_top) ||
			  collision_tiles(tilemap,bbox_left,bbox_bottom) ||
			  collision_tiles(tilemap,bbox_right,bbox_top) ||
			  collision_tiles(tilemap,bbox_right,bbox_bottom);
			  
x = xaux;
y = yaux;

return meeting;

