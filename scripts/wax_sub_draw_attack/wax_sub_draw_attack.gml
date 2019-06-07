var effects = weapon[?weaponData.effects];
var effect = effects[argument0[?fsmData.stateArgs]];
if(effect != -1){
	shader_set(sh_flameType);
	flameType_set_palette(flameType);
	draw_sprite_ext(effect,image_index,x,y,image_xscale,image_yscale,0,c_white,1.);
	shader_reset();
}
wax_draw_default();