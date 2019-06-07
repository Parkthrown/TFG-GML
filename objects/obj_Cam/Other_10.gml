/// @description Insert description here
// You can write your code in this editor
camera_destroy(view_camera[0]);

camera = camera_create();
camera_set_view_size(camera,width,height);
camera_set_view_pos(camera,x-width/2,(y-height/2)-dist);
view_camera[0] = camera;