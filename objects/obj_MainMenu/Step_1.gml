/// @description Insert description here
// You can write your code in this editor
get_global_inputs();

if(keyboard_check(vk_f11)){
	if(global.IO[0] != obj_console){
		lastIO = global.IO[0];
		global.IO[0] = obj_console;
	}else{
		global.IO[0] = lastIO;
	}
	io_clear();
}

if(keyboard_check_pressed(vk_f2) == 1){
	if(global.debug == 0){
		global.debug = 1;
		show_debug_overlay(1);
		
	}else{
		global.debug = 0;
		show_debug_overlay(0);
	}
}


/*
if(keyboard_check_pressed(vk_f7)) save_game(); 
if(keyboard_check_pressed(vk_f8)){
	if(!instance_exists(obj_debugTimer)){ 
			instance_create_depth(0,0,0,obj_debugTimer);
	}else{
			instance_destroy(obj_debugTimer);
	}
}