/// @description Insert description here
// You can write your code in this editor
if(alarm[2]){
	shader_set(sh_damageCycle);
	var hurtvar = shader_get_uniform(sh_damageCycle,"u_time");
	var palette = shader_get_uniform(sh_damageCycle,"u_vColors");
	shader_set_uniform_f_array(palette,DAMAGECYCLE);
	show_debug_message(DAMAGECYCLE);
	shader_set_uniform_f(hurtvar,TIMER*5);
	draw_self();
	shader_reset();
}else{
	draw_self();
}