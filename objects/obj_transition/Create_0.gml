/// @description Insert description here
// You can write your code in this editor
sfc = surface_create(GAME_WIDTH,GAME_HEIGHT);
tTime = 0;
dir = 0;
u_time = shader_get_uniform(sh_vignette,"u_time");
st = shader_get_uniform(sh_vignette,"u_resolution");
rad = shader_get_uniform(sh_vignette,"u_radius");
u_center = shader_get_uniform(sh_vignette,"u_center");
xx = 0;
yy = 0;
ammount = 0.02;
warping = 1;