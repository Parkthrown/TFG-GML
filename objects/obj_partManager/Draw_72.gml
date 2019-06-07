/// @description Insert description here
// You can write your code in this editor

if(!surface_exists(surf)){
	surf = surface_create(GAME_WIDTH,GAME_HEIGHT);
}

surface_set_target(surf);
	draw_clear_alpha(0,0);
	shader_set(sh_paletteSwap);
	shader_set_uniform_f_array(u_Color,particlePalette);
		
	with(obj_particle){
		event_user(events.specialDraw);
	}
		
	shader_reset();
		
	for(var i = 0; i < ds_list_size(sysDrawList); i++){
		part_system_drawit(sysDrawList[|i]);
	}
		
	for(var i = 0; i< ds_list_size(emberSystems); i++){
		if(part_particles_count(emberSystems[|i])){
			shader_set(sh_flameType);
			flameType_set_palette(i);
			part_system_drawit(emberSystems[|i]);
			shader_reset();
		}
	}
		
	with(obj_decoInstance){
		event_user(events.specialDraw);
	}
	
	with(obj_player){
		event_user(events.specialDraw);
	}

surface_reset_target();
