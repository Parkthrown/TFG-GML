/// @description Insert description here
// You can write your code in this editor
if(iterator <= string_length(text)){
	var char = string_char_at(text,iterator);
	actualtext += string_char_at(text,iterator);
	if(char != " ") audio_play_sound(sound,0,0);
	if(is_array(script)) script_execute(script[0],script[1]);
	iterator++;
	if((global.controls_gamepad) ? controller_get(CONTROLS_ATTACK,0): keyboard_get(CONTROLS_ATTACK)){
		alarm_set(0,spd/3);
	}else{
		alarm_set(0,spd);
	}
}else{
	done = 1;
}

