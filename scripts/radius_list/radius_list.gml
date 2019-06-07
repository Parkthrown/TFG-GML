///@argument0 list
///@argument1 size
///@argument2 origin(rads)
///@argument3 distance

var list = argument0;
var size = argument1;
var origin = argument2;
var dist = argument3;

for(var i = 0; i< size; i++){
	var ang = (pi/(size/2));
	ds_list_add(list,[sin((i+origin)*ang)*dist,cos((i+origin)*ang)*dist]);
}

return list;
