/// @description Insert description here
// You can write your code in this editor
display_set_gui_size(GAME_WIDTH,GAME_HEIGHT);
if(surface_exists(global.uiSurf)){
	draw_surface(global.uiSurf,0,0);
}else global.uiSurf = surface_create(GAME_WIDTH,GAME_HEIGHT);