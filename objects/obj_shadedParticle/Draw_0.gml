/// @description Insert description here
// You can write your code in this editor
shader_set(sh_flatColor);
shader_set_uniform_f(u_Color,color[0],color[1],color[2]);
draw_self();
shader_reset();
