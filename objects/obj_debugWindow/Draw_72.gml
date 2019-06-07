/// @description Insert description here
// You can write your code in this editor
var len = array_length_1d(vars);

if(surface_get_height(surf) < (len*16)+16){
	surface_free(surf);
	surf = surface_create(width,(len*16)+16);
}

surface_set_target(surf);
draw_nineSlice(spr_9slice_menu,2,2,width-2,6+len*TILE_SIZE);
surface_reset_target();

