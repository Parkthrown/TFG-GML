///@argument0 list
var list = argument0;
var arr = [];
for(var i = 0; i<ds_list_size(list); i++){
	arr[i] = list[|i];
}
return arr;