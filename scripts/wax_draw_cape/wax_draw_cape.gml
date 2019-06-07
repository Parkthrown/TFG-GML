if(global.cape != -1){
	if(!surface_exists(capeSurf)){
		capeSurf = surface_create(128,128);
	}
	var spr = (sprite_exists(global.cape)) ? global.cape: spr_Cape;
	surface_set_target(capeSurf);
		draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(spr,image_index));
		draw_vertex_texture(64,53,0,0);
		draw_vertex_texture(64,67+abs((vsp+hsp))/2,0,1);
		draw_vertex_texture((64-8*image_xscale)-(4.2*hsp),64-3.5*vsp,1,0);
		draw_vertex_texture((64-8*image_xscale)-(4.2*hsp),(64-3.5*vsp)+8,1,1);
		draw_primitive_end();
		surface_reset_target();
		shader_set(sh_outline);
		var tex = surface_get_texture(capeSurf);
		var uvs = texture_get_texel_size(tex);
		shader_set_uniform_vec3(shader_get_uniform(sh_outline,"u_vColor"),[0.,0.,0.]);
		shader_set_uniform_vec2(shader_get_uniform(sh_outline,"u_vTexSize"),uvs);
		draw_surface(capeSurf,x-64,y-64);
		shader_reset();
	surface_clear(capeSurf);
}