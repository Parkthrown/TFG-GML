if(flameType) wax_draw_flame();
shader_set(sh_brightness);
	var percent = shader_get_uniform(sh_brightness,"percent");
	shader_set_uniform_f(percent,0.4+((image_number-image_index*argument0[?fsmData.stateArgs])/10));
	draw_self();
shader_reset();
