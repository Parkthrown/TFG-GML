///@argument0 palette
var colors = shader_get_uniform(sh_flameType,U_VCOLORS);
var replace = shader_get_uniform(sh_flameType,U_VREPLACECOLORS);
shader_set_uniform_f_array(replace,REPLACE_GREYS);
shader_set_uniform_f_array(colors,global.glPalettes[|argument0%6]);