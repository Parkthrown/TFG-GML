//scr_text("Text",speed,x,y);

actualDialog = instance_create_depth(0,0,0,type);
talking = argument0;

with (actualDialog){
	
	speaker = other;
	dialog = other.dialog;
	text = other.dialog[|0];
	
	maxlength = 390;
	
	spd = other.spd;
	color = other.color;
	font = fnt_base;

	text_length = string_length(text);
	font_size = font_get_size(font);

	text_width = string_width_ext(text, font_size+(font_size/2), maxlength);
	text_height = string_height_ext(text, font_size+(font_size/2), maxlength);
	
}

