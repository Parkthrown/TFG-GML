/// @description Insert description here
// You can write your code in this editor
alarm_set(0,time);

if(actor != -1 && instance_exists(actor)){
	setMiddleware(actor,id);
}

var surf;
if(instance_exists(actor)){
	surf = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
	surface_set_target(surf);
	with(actor){
		event_user(0);
	}
	img = sprite_create_from_surface(surf,0,0,window_get_width(),window_get_height(),0,0,0,0);
	surface_reset_target();
	surface_free(surf);
	surf = undefined;
}else{
	img = sprite_create_from_surface(application_surface,0,0,window_get_width(),window_get_height(),0,0,0,0);
}

instance_deactivate_all(1);
instance_activate_object(obj_tile);
instance_activate_object(obj_overlayUI);
instance_activate_object(obj_gameManager);