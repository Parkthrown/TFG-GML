///@argument0 angle;
///@argument1 speed;


var vDir = [cos(argument0),sin(argument0)];

var mDir = hipotenuse(vDir[0],vDir[1]);

var scale = argument1/mDir

return  [(vDir[0]*scale), -(vDir[1]*scale)];

