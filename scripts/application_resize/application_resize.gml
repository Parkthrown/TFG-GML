///@desc resizes the app surface and dispatches every event associated with resizing the app surface
///@arg width
///@arg height

surface_resize(application_surface,argument0,argument1);

with(obj_ambientManager){
	application_texture = surface_get_texture(application_surface);
	application_texel_width = 1/argument0;
	application_texel_height = 1/argument1;
}