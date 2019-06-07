///@desc draw lightning for the scene

var vx = camera_get_view_x(view_camera[0])-floor(camera_get_view_x(view_camera[0]));
var vy = camera_get_view_y(view_camera[0])-floor(camera_get_view_y(view_camera[0]));
var dx = (vx * (surface_get_width(application_surface)/surface_get_width(surf_lights))) - (surface_get_width(application_surface)/surface_get_width(surf_lights));
var dy = (vy * (surface_get_height(application_surface)/surface_get_height(surf_lights))) - (surface_get_height(application_surface)/surface_get_height(surf_lights));
shader_set(shader);
	shader_set_uniform_f_array(u_col, color_mix);
	shader_set_uniform_f_array(u_con_sat_brt, con_sat_brt_mix);
	shader_set_uniform_f(u_lights_offset,application_texel_width*dx,application_texel_height*dy);
	texture_set_stage(u_s_palette,global.cubeMap);
	texture_set_stage(s_lights, tex_lights);
	if surface_exists(application_surface)
		draw_surface_ext(application_surface, 0, 0, global.game_xscale, global.game_yscale, 0, c_white, 1);
shader_reset();

/*
	
	show_debug_message(strcat(
		"---------------------- // TEXEL WIDTH // ------------------------\n\n",
		application_texel_width * 10000, "/ 10000\n == ? \n",
		(1/surface_get_width(application_surface)) * 10000,
		"\n-----------------------------------------------------------------------")
	);
	show_debug_message(strcat(
		"---------------------- // TEXEL HEIGHT // ------------------------\n\n",
		application_texel_height * 10000, "/ 10000\n == ? \n",
		(1/surface_get_height(application_surface)) * 10000,
		"\n-----------------------------------------------------------------------")
	);
		show_debug_message(strcat(
		"---------------------- // DIFFERENCES // ------------------------\n\n",
		"DX: ", dx, "\n","DY: ", dy,
		"\n-----------------------------------------------------------------------")
	);
	
*/

