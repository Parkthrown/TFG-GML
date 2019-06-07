///@argument0 vec1
///@argument1 vec2
///@argument2 speed

if(!is_array(argument0) && !is_array(argument1)) return -1;

var top = array_length_1d(argument1);
var arr = [];

for(var i = 0; i < array_length_1d(argument0); i++){
	if(i > top){
		var append = [];
		array_copy(append,0,argument0,i,array_length_1d(argument0));
		return array_append(arr,append);
	}
	arr[i] = lerp(argument0[i],argument1[i],argument2);
}
return arr;
