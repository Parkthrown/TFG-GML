if(flameType) wax_draw_flame();
shader_set(sh_brightness);
	var percent = shader_get_uniform(sh_brightness,"percent");
	shader_set_uniform_f(percent,0.5+(image_index/image_number));
	draw_self();
shader_reset();
