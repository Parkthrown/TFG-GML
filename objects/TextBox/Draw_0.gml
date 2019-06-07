/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_base);
draw_set_color(c_black)
draw_text_ext(x-1,y-1,text,string_height(text),string_length(text)*3);
draw_set_color(c_white);
draw_text_ext(x,y,text,string_height(text),string_length(text)*3);