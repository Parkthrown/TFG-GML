///argument array
///argument data

var arr = [];

for(var i = 0; i< array_length_1d(argument0); i++){
	var append = 1;
	for (var j = 0; j < array_length_1d(argument1); j++) {
	    if(argument0[i] == argument1[j]) append = 0; 
	}
	if(append) arr[array_length_1d(arr)] = argument0[i];
}

return arr;
