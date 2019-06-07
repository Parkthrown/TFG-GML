///@argument0 name
///@argument1 xsize;
///@argument2 ysize;
///@argument3 realxsize;
///@argument4 realysize;

var name = argument[0];
var width = argument[1];
var height = argument[2];
var realWidth = argument[3];
var realHeight = argument[4];

ds_map_add(global.complexParallaxMap,name,[width,height,realWidth,realHeight,0,0]);
