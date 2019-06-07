///@argument0 data

with(instance_create_depth(0,0,0,obj_dialogBox)){
	instance_deserialize_vars(argument0,1);
	alarm_set(0,5);
	text = dialog[|0];
	text_length = string_length(text);
	font_size = font_get_size(font);
	text_width = string_width_ext(text, font_size+(font_size/2), maxlength);
	text_height = string_height_ext(text, font_size+(font_size/2), maxlength);
	
}
