///@argument0 target;
///@argument1 speed;

if(is_array(argument0)){
	var xdir = x-argument0[0];
	var ydir = y-argument0[1];
}else{
	var xdir = x-argument0.x;
	var ydir = y-argument0.y;
}

var mdir = sqrt(power(xdir,2) + power(ydir,2));

var scale = argument1/mdir

hsp = -(xdir*scale);
vsp = -(ydir*scale);

