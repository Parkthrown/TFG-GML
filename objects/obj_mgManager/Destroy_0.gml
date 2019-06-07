/// @description Insert description here
// You can write your code in this editor
//instance_activate_all();
surface_clear(global.uiSurf);
instance_destroy(obj_overlayUI);
instance_create_depth(x,y,depth,obj_overlayUI);
with(instance_create_depth(x,y,0,obj_transition)){
	tTime = 0;
	ammount = 1;
}