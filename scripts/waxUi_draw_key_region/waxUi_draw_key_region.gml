
var colors = KEY_COLORS;
var loop = 0;
var level = global.shortcuts[|global.level];
for(var i = array_length_1d(colors)-1; i>=0; --i) {
	shader_set((level[loop]) ? sh_outline: sh_outlineOnly);
	var uvs = sprite_get_texel_size(spr_keycard_floor,0);
	var uf = shader_get_uniform(sh_outlineOnly,"u_vTexSize");
	shader_set_uniform_f(uf,uvs[0],uvs[1]);
	var uf = shader_get_uniform(sh_outlineOnly,"u_vColor");
	shader_set_uniform_f_color(uf,colors[i]);
	draw_sprite_ext(spr_keycard_floor,0,426+i*7,0,1,1,0,c_white,1);
	shader_reset();
	loop++;
}
