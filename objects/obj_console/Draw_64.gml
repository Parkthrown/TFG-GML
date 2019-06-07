/// @description Insert description here
// You can write your code in this editor
display_set_gui_size(GAME_WIDTH,GAME_HEIGHT);
if(!surface_exists(surf)) surf = surface_create(GAME_WIDTH,GAME_HEIGHT);
surface_set_target(surf);
draw_set_font(fnt_base);
draw_set_color(c_white);
draw_text(16,240,text);
surface_reset_target();

var tx = surface_get_texture(surf);
var uvs = [texture_get_texel_width(tx),texture_get_texel_height(tx)];
shader_set(sh_outline);
var uf = shader_get_uniform(sh_outline,"u_vTexSize");
shader_set_uniform_f(uf,uvs[0],uvs[1]);
var uf = shader_get_uniform(sh_outline,"u_vColor");
shader_set_uniform_from_color(uf,color_to_glsl_array(color));
draw_surface(surf,0,0);
shader_reset();

surface_clear(surf);

if(is_string(text)){
	var palette = global.palettes[|(string_length(text)%5)+1];
	color = color_lerp(color,palette[((current_time/500)%3)],0.045);
}
