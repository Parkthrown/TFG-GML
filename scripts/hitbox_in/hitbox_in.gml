///@argument0 x1
///@argument1 y1
///@argument2 x2
///@argument3 y2
///@argument4 oType
///@argument5 list


var x1 = argument0;
var x2 = argument2;
var y1 = argument1;
var y2 = argument3;
var oType = argument4;
var list = argument5;

if(is_array(oType)){
	for(var i = 0; i<array_length_1d(oType); i++){
		collision_rectangle_list(x1,y1,x2,y2,oType[i],0,1,list,0);
	}
}else{
	collision_rectangle_list(x1,y1,x2,y2,oType,0,1,list,0);
}

return list;
