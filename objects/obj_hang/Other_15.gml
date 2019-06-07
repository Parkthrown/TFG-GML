/// @description Insert description here
// You can write your code in this editor
var vx = floor(camera_get_view_x(view_camera[0]));
var vy = floor(camera_get_view_y(view_camera[0]));
var xscale = (image_xscale + image_xscale * (cos(TIMER)/10)) * light_xscale;
var yscale = (image_yscale + image_yscale * (cos(TIMER)/10)) * light_yscale;
draw_sprite_ext(spr_lightMask32x, TIMER*8  , CENTERX -vx, CENTERY -vy, xscale, yscale, image_angle, color , (light_strength * -CURRENT_BRIGHTNESS));