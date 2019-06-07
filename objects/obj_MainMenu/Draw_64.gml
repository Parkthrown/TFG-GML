/// @description Insert description here
// You can write your code in this editor
display_set_gui_size(GAME_WIDTH,GAME_HEIGHT);
draw_set_color($000000);
draw_rectangle(0,0,GAME_WIDTH,TILE_SIZE,0);
draw_rectangle(0,GAME_HEIGHT-TILE_SIZE,GAME_WIDTH,GAME_HEIGHT,0);
draw_set_color($ffffff);