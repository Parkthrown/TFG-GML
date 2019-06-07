///@argument0 array
var arr = argument0;
if(is_array(arr)){
	var list = ds_list_create();
	for(var i = 0; i<array_length_1d(arr); i++){
		list[|i] = arr[i];
	}
	return list;
}
return undefined;