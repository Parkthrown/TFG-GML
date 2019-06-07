/// @description Insert description here
// You can write your code in this editor
var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);
draw_sprite_ext(spr_lightMask16x, image_index, x -vx, y -vy, image_xscale, image_yscale, image_angle, image_blend, 1);