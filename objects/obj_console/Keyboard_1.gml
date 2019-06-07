/// @description Insert description here
// You can write your code in this editor
if(global.IO[0] == object_index){
	switch(keyboard_lastkey){
		case vk_backspace:
			text = string_copy(text,1,max(0,string_length(text)-1));
		break;
		case vk_enter:
			ds_list_add(commands,text);
			event_user(0);
			text = "";
		break;
		case vk_up:
			current = (current >= 0) ? current-1: ds_list_size(commands)-1;
			text = (commands[|current] == undefined) ? "": commands[|current];
		break;
		case vk_down:
			current = (current<ds_list_size(commands)) ? current+1: 0;
			text = (commands[|current] == undefined) ? "": commands[|current];
		break;
		case vk_tab:
		break;
		default:
			text = (is_string(text)) ? text+keyboard_lastchar: string(text)+keyboard_lastchar;
			current = -1;
		break;
	}
	io_clear();
}
