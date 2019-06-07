///@argument0 sprite
///@argument1 image
var tex = sprite_get_texture(argument0, argument1);
return [texture_get_texel_width(tex),texture_get_texel_height(tex)];