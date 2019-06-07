/// @description Insert description here
// You can write your code in this editor
//scr_text("Text",speed,x,y);

cutscene = noone;

speaker = noone;
dialog = ds_list_create();
line = 0;

done = 0;
maxlength = 390;
text = "";
spd = 5;
font = fnt_base;
color = c_white;
sound = snd_talk;
script = -1;
auto = 0;

text_length = string_length(text);
font_size = font_get_size(font);

text_width = string_width_ext(text, font_size+(font_size/2), maxlength);
text_height = string_height_ext(text, font_size+(font_size/2), maxlength);

iterator = 1;
actualtext = "";
alarm_set(0,spd);