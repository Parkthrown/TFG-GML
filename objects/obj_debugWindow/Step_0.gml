/// @description Insert description here
// You can write your code in this editor
var swidth = surface_get_width(surf);
var sheight = surface_get_height(surf);
var otherDragged = 0;
with(obj_debugWindow){
	if(id != other){
		otherDragged = dragging || otherDragged;
	}
}
if( !otherDragged && mouse_check_button(mb_left) && instance_exists(obj_Cam) && ( dragging || point_in_rectangle(mouse_x,mouse_y,x,y,x+swidth,y+sheight) ) ){
	dragging = 1;
	xx = clamp(mouse_x-obj_Cam.x,-obj_Cam.width/2,obj_Cam.width/2-surface_get_width(surf));
	yy = clamp(mouse_y-obj_Cam.y,-obj_Cam.height/2,obj_Cam.height/2-surface_get_height(surf)-obj_Cam.dist);
	
}else{
	dragging = 0;
}

if( mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x,mouse_y,x,y-16,x+16,y) ){
	instance_destroy();
}