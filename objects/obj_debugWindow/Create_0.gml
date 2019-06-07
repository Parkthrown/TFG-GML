/// @description Insert description here
// You can write your code in this editor

target = noone;
vars  = [];
xx = ~-1;
yy = ~-1;
width = 72;

var len = array_length_1d(vars);

surf = surface_create(width,max(len*16,1));
dragging = 0;