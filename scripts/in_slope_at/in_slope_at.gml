var xx = argument0;
var yy = argument1;
var yy_bbox_bottom = yy + BBOX_BOTTOM_DISTANCE;
var cmap = CMAP;
var result = tile_is_slope(cmap,xx,yy_bbox_bottom) 
					|| tile_is_slope(cmap,xx + BBOX_RIGHT_DISTANCE + 1,yy_bbox_bottom)  
					|| tile_is_slope(cmap,xx + BBOX_LEFT_DISTANCE - 1,yy_bbox_bottom);
return result;

