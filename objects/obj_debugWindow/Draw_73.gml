/// @description Insert description here
// You can write your code in this editor
var palette = global.palettes[|TIMER%6];
var color = palette[(TIMER*3)%3];
var tx = surface_get_texture(surf);
var uvs = [texture_get_texel_width(tx),texture_get_texel_height(tx)];
shader_set(sh_outline);
var uf = shader_get_uniform(sh_outline,"u_vTexSize");
shader_set_uniform_f(uf,uvs[0],uvs[1]);
var uf = shader_get_uniform(sh_outline,"u_vColor");
shader_set_uniform_from_color(uf,color_to_glsl_array(color));
draw_surface(surf,x,y);
shader_reset();
draw_sprite(spr_x,0,x,y-16);