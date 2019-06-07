/// @description Insert description here
// You can write your code in this editor
mult = 1.25;
duration = pi*60;

shader = sh_forcedPalette;
uniforms = undefined;
middleware = -1;
actor = obj_ambientManager;

alarm_set(0,(duration)/mult);
global.coins -= min(global.coins,floor(max(global.coins/10,10)));
u_Time = TIMER*mult;

surf = surface_create(surface_get_width(application_surface),surface_get_height(application_surface));
pal = shader_get_sampler_index(shader,"u_sPalette");
light = shader_get_uniform(shader,"u_fLight");

if(instance_exists(actor)){
	setMiddleware(actor,id);
}
