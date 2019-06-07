var cmap = CMAP;
if(tilemap_get_at_pixel(cmap,x,bbox_bottom+1) != 0){
		y = tile_get_height_at_column(cmap,x,bbox_bottom+1) - 1 - BBOX_BOTTOM_DISTANCE;
}else if(in_slope()){
		y -= tilemap_get_height_at_column(cmap,x,bbox_bottom) - TILE_SIZE;
		y = tile_get_height_at_column(cmap,x,bbox_bottom) - 1 - BBOX_BOTTOM_DISTANCE;
}
	