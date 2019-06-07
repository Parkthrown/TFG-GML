///@argument0 x1
///@argument1 y1
///@argument2 x2
///@argument3 y2
///@argument4 oType
/*

var x1 = argument[0];
var x2 = argument[2];
var y1 = argument[1];
var y2 = argument[3];
var oType = argument[4];
var list = argument[5];
var _flags = argument[6]
var notme = 1;
var prec = 0;
var ordered = 0;
if(argument_count > 7){
	notme = argument[7];
	if(argument_count> 8){
		prec = argument[8];
		if(argument_count > 9){
			ordered = argument[9];
		}
	}
}

var tList = global.collision_list;

collision_rectangle_list(x1,y1,x2,y2,oType,prec,notme,tlist,ordered);

for(var i = 0; i < ds_list_size(tList); i++){
	var o = tList[|i];
	with(o){
		if(_flags & flags){
			ds_list_add(list,id);
		}
	}
}

ds_list_clear(global.collision_list);
return list;
*/