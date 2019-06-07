/// @description Insert description here
// You can write your code in this editor
var sWidth = GAME_WIDTH;
var sHeight = GAME_HEIGHT;
var centerY = sHeight/2;
var centerX = sWidth/2;
display_set_gui_size(sWidth,sHeight);
draw_sprite_ext(spr_dialogBox,0,0,206,1,1,0,color,1);
draw_set_color(color);
draw_set_font(font);
draw_text_ext(56,220,actualtext,font_size,text_width);