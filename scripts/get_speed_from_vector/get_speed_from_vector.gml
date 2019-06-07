///@argument0 target;
///@argument1 speed;

if(is_array(argument0)){
	var xdir = argument0[0]-x;
	var ydir = argument0[1]-y;
}else{
	var xdir = argument0.x-x;
	var ydir = argument0.y-y;
}

var mdir = hipotenuse(xdir,ydir);

var scale = argument1/mdir

return [(xdir*scale), -(ydir*scale)];

