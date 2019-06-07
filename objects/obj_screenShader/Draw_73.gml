/// @description draw setup
// You can write your code in this editor
if(!surface_exists(surf)){
	surf = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
}

surface_set_target(surf);
	if(instance_exists(actor)){
		with(actor){
			event_user(0);
		}
	}else{
		surface_copy(surf,0,0,application_surface);
	}
surface_reset_target();


