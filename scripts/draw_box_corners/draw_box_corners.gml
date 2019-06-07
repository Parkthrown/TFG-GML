///@argument0 sprite
///@argument1 image
///@argument2 x1
///@argument3 y1
///@argument4 x2
///@argument5 y2

var spr = argument0;
var img = argument1;
var xx = argument2;
var yy = argument3;
var xx2 = argument4;
var yy2 = argument5;

draw_sprite_ext(spr,img,xx,yy,1,1,0,c_white,1);
draw_sprite_ext(spr,img,xx2,yy,-1,1,0,c_white,1);
draw_sprite_ext(spr,img,xx,yy2,1,-1,0,c_white,1);
draw_sprite_ext(spr,img,xx2,yy2,-1,-1,0,c_white,1);