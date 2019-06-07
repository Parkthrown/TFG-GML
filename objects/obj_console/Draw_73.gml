/// @description Insert description here
// You can write your code in this editor
if(global.debug){
	var tiles1 = layer_tilemap_get_id(layer_get_id("tiles_1"));
	var tiles = CMAP;
	var collide = collision_tiles(tiles,mouse_x,mouse_y);
	draw_sprite_ext(spr_pointer,TIMER*4,mouse_x,mouse_y,1,1,0,
	collide ? c_red : c_white,1);
	if(mouse_check_button_pressed(mb_left)){
		show_debug_message("-----------------------//----------------------------")
		show_debug_message(tilemap_get_height_at_pixel(tiles,mouse_x,mouse_y))
		show_debug_message("-----------------------//----------------------------")
	}
}