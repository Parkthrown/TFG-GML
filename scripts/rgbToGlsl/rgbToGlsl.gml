if(is_array(argument0)){
	var arr = [];
	for(var i = 0; i<array_length_1d(argument0); i++){
		arr[i] = rgbToGlsl(argument0[i]);
	}
	return arr;
}else{
	return (argument0/255);
}