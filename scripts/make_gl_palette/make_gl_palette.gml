///@argument colors
///@argument ...
var arr = [];
for(var i = 0; i<argument_count; i++ ){
	arr = array_append(arr,color_to_array(argument[i]));
}
return rgbToGlsl(arr);