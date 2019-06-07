///@argument array 
///@argument value(s)...
var arr = argument[0]
for(var i = 1; i<argument_count; i++){
	if(is_array(argument[i])){
		var append = argument[i];
		for(var j = 0; j<  array_length_1d(append); j++){
			arr[array_length_1d(arr)] = append[j];
		}
	}else arr[array_length_1d(arr)] = argument[i];
}
return arr;