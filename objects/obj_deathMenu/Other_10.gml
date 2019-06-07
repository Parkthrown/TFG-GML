/// @description Insert description here
// You can write your code in this editor
if(alarm[0]){
	var u_Time_final = (TIMER*mult - u_Time);
	u_Time_final = floor(u_Time_final*8)/8;
}else{
	var u_Time_final = pi - (TIMER*mult - u_Time);
	u_Time_final = floor(u_Time_final*16)/16;
}

shader_set(shader); 
	shader_set_uniform_f(light,(cos(u_Time_final)-0.085));
	texture_set_stage(pal, global.cubeMap);
	draw_surface(surf,0,0);
shader_reset();