///@argument0 array
///@argument1 pos
return(
	array_append(
		array_copy_range(argument[0],0,argument1),
		array_copy_range(argument[0],argument1+1,array_length_1d(argument0))
	)
);