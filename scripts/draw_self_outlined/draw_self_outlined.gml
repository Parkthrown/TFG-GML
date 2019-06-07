///@argument0 color

var uvs = sprite_get_texel_size(sprite_index,image_index);
shader_set(sh_outline);
var uf = shader_get_uniform(sh_outline,"u_vTexSize");
shader_set_uniform_f(uf,uvs[0],uvs[1]);
var uf = shader_get_uniform(sh_outline,"u_vColor");
shader_set_uniform_from_color(uf,color_to_glsl_array(argument0));
draw_self();
shader_reset();