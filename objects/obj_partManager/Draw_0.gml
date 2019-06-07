/// @description Insert description here
// You can write your code in this editor

with(obj_Cam){
	shader_set(sh_outline);
	outline_set_gl(surface_get_texture(other.surf),other.pOutline);
	var w = x-width/2;
	var h = y-height/2 - dist;
	draw_surface_part(other.surf,w,h,width,height,w,h);
	shader_reset();
}