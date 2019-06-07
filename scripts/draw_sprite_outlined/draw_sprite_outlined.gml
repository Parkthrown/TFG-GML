///@argument0 sprite
///@argument1 image
///@argument2 x
///@argument3 y
///@argument4 color

var uvs = sprite_get_texel_size(argument0,argument1);
shader_set(sh_outline);
var uf = shader_get_uniform(sh_outline,"u_vTexSize");
shader_set_uniform_f(uf,uvs[0],uvs[1]);
var uf = shader_get_uniform(sh_outline,"u_vColor");
shader_set_uniform_from_color(uf,color_to_glsl_array(argument4));
draw_sprite(argument0,argument1,argument2,argument3);
shader_reset();