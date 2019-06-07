/// @description draw
// You can write your code in this editor

shader_set(shader);
	shader_set_all(shader,uniforms);
	draw_surface_ext(surf,0,0,global.game_xscale,global.game_yscale,0,c_white,1);
shader_reset();
