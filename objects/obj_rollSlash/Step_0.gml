/// @description Insert description here
// You can write your code in this editor
if(instance_exists(creator)){
	x = creator.x;
	y = creator.y;
	image_xscale = creator.image_xscale;
	event_inherited();
}else{
	instance_destroy();
}