/// @description Insert description here
// You can write your code in this editor
var _wax = instance_nearest(x,y,Wax);
if(instance_exists(_wax)){
	var coloring = _wax.flameType;
	if(coloring){
		flameType_set_palette(coloring);
		shader_set(sh_flameType);
		draw_sprite(sprite_index,image_index,x,y);
		shader_reset();
	}else{
		draw_self();
	}
}
