/// @description Insert description here
// You can write your code in this editor
draw_self();
if(alarm[0] > 0){
	alpha += 0.005;
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_red,alpha);
}else if(alpha > 0){
	alpha -=  0.01;
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_red,alpha);
}