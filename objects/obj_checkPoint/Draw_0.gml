/// @description Insert description here
// You can write your code in this editor

var time = round(cos(TIMER)*4);

draw_self();

if(surface_exists(surf)){
	
	surface_set_target(surf);
	shader_set(sh_paletteSwap);
	draw_sprite_ext(spr_effigy,0,32,32,1,1,0,c_white,1.);
	shader_reset();
	surface_reset_target();

	shader_set(sh_outline);
	outline_set_gl(surface_get_texture(surf),[0.,0.,0.]);
	draw_surface(surf,x-32,y-60+time)
	shader_reset();
	surface_clear(surf);
	
}

if(flameType){
	
	if(!part_emitter){
		part_system = obj_partManager.emberSystems[|flameType%6];
		part_emitter = part_emitter_create(part_system);
		alarm_set(0,10);
	}
	
	
	part_emitter_region(part_system,part_emitter,x-2,x+2,
	y-28+time,
	y-26+time,
	ps_shape_ellipse,ps_distr_gaussian);
	
}


