/// @description Insert description here
// You can write your code in this editor

img = -1;
shader = -1;
uniforms = [];
time = 0;
surf = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
middleware = -1;
actor = obj_ambientManager;

if(instance_exists(actor)){
	setMiddleware(actor,id);
}

alarm_set(0,time);
