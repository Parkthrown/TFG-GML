var cmap = CMAP;
return tile_is_slope(cmap,x,bbox_bottom) || tile_is_slope(cmap,bbox_right,bbox_bottom)  || tile_is_slope(cmap,bbox_left,bbox_bottom);