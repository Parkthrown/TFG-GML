/// @description Insert description here
// You can write your code in this editor
if(flameType){
	var time = floor(cos(TIMER)*4);
	var vx = floor(camera_get_view_x(view_camera[0]));
	var vy = floor(camera_get_view_y(view_camera[0]));
	var xscale = image_xscale + image_xscale * (cos(TIMER)/10);
	var yscale = image_yscale + image_yscale * (cos(TIMER)/10);
	var col = global.palettes[|flameType];
	
	draw_sprite_ext(spr_lightMask32x, TIMER*8,
	x -vx,
	y-26+time -vy,
	xscale, yscale, image_angle, col[0], 1);
}
