/// @description Insert description here
// You can write your code in this editor
if(done){
	var commit = ((global.controls_gamepad) ? controller_get(CONTROLS_JUMP,0) : keyboard_get(CONTROLS_JUMP)) || auto;
	if(commit){
		done = 0;
		line++;
		if(line < ds_list_size(dialog)){
			iterator = 1;
			actualtext = "";
			text = dialog[|line];
			text_length = string_length(text);
			text_width = string_width_ext(text, font_size+(font_size/2), maxlength);
			text_height = string_height_ext(text, font_size+(font_size/2), maxlength);
			alarm_set(0,spd);

		}else{
			show_debug_message("this dialog was: " + string(ds_list_size(dialog)) + " lines long");
			show_debug_message("and ended in: " + text);
			instance_destroy();
		}

	}
}