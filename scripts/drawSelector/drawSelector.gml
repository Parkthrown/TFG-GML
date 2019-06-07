///@argument0 selector
///@argument0 width
///@argument0 height

var selector = argument0;
var xx = selector[0];
var yy = selector[1];
var width = argument1;
var height = argument2;

draw_box_corners(spr_9slicetop,0,xx,yy,xx+width,yy+height);
