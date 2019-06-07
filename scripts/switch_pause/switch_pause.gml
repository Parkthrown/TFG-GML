if(!global.paused){
	global.paused = 1;
	instance_deactivate_all(1);
	instance_activate_object(obj_unPauseable);
	show_debug_message("game paused");
}else{
	instance_activate_all();
	global.paused = 0;
	show_debug_message("game unpaused");
}