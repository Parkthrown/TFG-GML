
var uvs = texture_get_texel_size(argument0);
var uf = shader_get_uniform(sh_outline,"u_vTexSize");
shader_set_uniform_f(uf,uvs[0],uvs[1]);
var uf = shader_get_uniform(sh_outline,"u_vColor");
shader_set_uniform_vec3(uf,argument1);