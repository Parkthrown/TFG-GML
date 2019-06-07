/// @description Insert description here
// You can write your code in this editor

var pause = 0;
#region controls
pause = global.input_pause;
#endregion
if(pause && !global.transition && !instance_exists(obj_deathMenu)){
	if(!global.paused){
		with(instance_create_depth(0,0,0,obj_pauseMenu)){
			instance_destroy(obj_screenFreeze);
			pimg = sprite_create_from_surface(application_surface,
			0,0,surface_get_width(application_surface),
			surface_get_height(application_surface),0,0,0,0);
			alpha = 0.1;
			switch_pause();
		}
	}
}